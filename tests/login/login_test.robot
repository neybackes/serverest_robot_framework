*** Settings ***
Documentation    Login tests for the API automation template.
Resource         ../../resources/config/base.resource
Resource         ../../resources/keywords/login_keywords.resource
Test Teardown    Run Keyword If    $created_user_response is not None    Delete Created User From Response    ${created_user_response}

*** Variables ***
${created_user_response}    ${None}

*** Test Cases ***
Scenario: Successful Login
    ${response}    Perform Valid Login Flow
    Response Status Should Be    ${response}    200
    Response Message Should Be    ${response}    Login realizado com sucesso
    Response Should Contain Field    ${response}    authorization
