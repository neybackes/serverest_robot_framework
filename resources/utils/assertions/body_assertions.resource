*** Keywords ***
Response Message Should Be
    [Arguments]    ${response}    ${expected_message}
    ${response_body}    Response Json    ${response}
    Should Be Equal    ${response_body["message"]}    ${expected_message}

Response Should Contain Field
    [Arguments]    ${response}    ${field_name}
    ${response_body}    Response Json    ${response}
    Dictionary Should Contain Key    ${response_body}    ${field_name}
    ${field_value}    Get From Dictionary    ${response_body}    ${field_name}
    Should Not Be Empty    ${field_value}
