*** Settings ***
Resource    ../payloads/login_payloads.resource
Resource    ../utils/common.resource

*** Keywords ***
Perform Valid Login Flow
    ${base_url}    Resolve Active Base URL
    ${user_payload}    Build Valid User Payload
    ${created_user_response}    Request    POST    ${base_url}    /usuarios    ${user_payload}
    Set Test Variable    ${created_user_response}
    ${payload}    Build Login Payload From User    ${user_payload}
    ${response}    Request    POST    ${base_url}    /login    ${payload}
    RETURN    ${response}

