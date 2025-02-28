*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Get user and return response body
    [Arguments]    ${url}    ${path}    ${user_id}    ${status_code}
    RequestsLibrary.Create Session    GetUserProfile    ${url}
    ${response}    GET On Session    GetUserProfile    /${path}/${user_id}    expected_status=${status_code}
    ${response_body}    Set Variable    ${response.json()}
    Set Global Variable    ${global_response_body}    ${response_body}

Verify response body that get user profile
    [Arguments]     ${user_id}    ${email}    ${first_name}    ${last_name}    ${avatar}
    BuiltIn.Should Be Equal As Numbers         ${global_response_body['data']['id']}    ${user_id}
    BuiltIn.Should Be Equal    ${global_response_body['data']['email']}    ${email}
    BuiltIn.Should Be Equal    ${global_response_body['data']['first_name']}    ${first_name}
    BuiltIn.Should Be Equal    ${global_response_body['data']['last_name']}    ${last_name}
    BuiltIn.Should Be Equal    ${global_response_body['data']['avatar']}    ${avatar}

Verify response body that user not found
    [Arguments]   ${user_not_found}
    BuiltIn.Should Be Equal As Strings    ${global_response_body}    ${user_not_found}
    