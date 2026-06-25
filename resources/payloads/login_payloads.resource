*** Settings ***
Library    Collections
Resource   ../utils/common.resource

*** Keywords ***
Build Valid User Payload
    ${data}    Load Static Fixture    massa_login.json
    ${payload}    Get From Dictionary    ${data}    usuario_valido
    RETURN    ${payload}

Build Login Payload From User
    [Arguments]    ${user_payload}
    ${email}    Get From Dictionary    ${user_payload}    email
    ${password}    Get From Dictionary    ${user_payload}    password
    &{payload}    Create Dictionary    email=${email}    password=${password}
    RETURN    ${payload}


