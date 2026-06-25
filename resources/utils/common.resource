*** Settings ***
Library    BuiltIn
Library    Collections
Library    OperatingSystem
Library    RequestsLibrary
Library    String
Resource   ../config/environments/variables.resource

*** Keywords ***
Resolve Active Base URL
    ${base_url}    Resolve Base Url    ${DEFAULT_BASE_URL}
    RETURN    ${base_url}

Resolve Base Url
    [Arguments]    ${base_url}
    RETURN    ${base_url}

Load Static Fixture
    [Arguments]    ${file_name}
    ${fixture_data}    Load Fixture    ${file_name}
    RETURN    ${fixture_data}

Load Fixture
    [Arguments]    ${file_name}
    ${fixture_path}    Set Variable    ${CURDIR}/../payloads/estatic/${file_name}
    ${raw_json}    Get File    ${fixture_path}
    ${data}    Evaluate    json.loads($raw_json)    json
    RETURN    ${data}

Request
    [Arguments]    ${method}    ${base_url}    ${endpoint}    ${payload}=${None}
    Create Session    api    ${base_url}
    ${upper_method}    Convert To Uppercase    ${method}
    ${keyword}    Set Variable    ${upper_method} On Session
    IF    $payload is None
        ${response}    Run Keyword    ${keyword}    api    ${endpoint}    expected_status=anything
    ELSE
        ${response}    Run Keyword    ${keyword}    api    ${endpoint}    json=${payload}    expected_status=anything
    END
    RETURN    ${response}

Response Json
    [Arguments]    ${response}
    ${data}    Evaluate    json.loads($response.text)    json
    RETURN    ${data}

Delete Created User From Response
    [Arguments]    ${response}
    ${response_body}    Response Json    ${response}
    ${user_id}    Set Variable    ${response_body.get("_id")}
    IF    $user_id
        ${base_url}    Resolve Active Base URL
        Request    DELETE    ${base_url}    /usuarios/${user_id}
    END
