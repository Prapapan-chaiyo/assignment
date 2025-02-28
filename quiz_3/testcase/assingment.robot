*** Settings ***
Resource    ${CURDIR}/../Keywords/import.robot

*** Test Cases ***
Get user profile success
    [Documentation]    To verify get user profile api will return correct data when trying to get profile of existing user
    get_user_page.Get user and return response body       ${user.url}    ${user.path}    ${user.id}    ${user.status_code}
    get_user_page.Verify response body that get user profile    ${user.id}    ${user.email}    ${user.first_name}    ${user.last_name}    ${user.avatar}

Get user profile but user not found
    [Documentation]    To verify get user profile api will return 404 not found when trying to get exist profile of not existing user
    get_user_page.Get user and return response body       ${user.url}    ${user.path}    ${user.invalid_id}    ${user.status_code_filed}
    get_user_page.Verify response body that user not found    ${user.not_found}
