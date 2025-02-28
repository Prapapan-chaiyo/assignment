*** Settings ***
Resource    ../import.robot

*** Keywords ***
Login page is shown
    [Arguments]    ${text_title_page}
    Verify title page    ${text_title_page}

Login success and message 'You logged into a secure area!' is shown
    [Arguments]    ${user_name}    ${password}    ${text_login_button}    ${text_state_login}
    Input username    ${user_name}
    Input password    ${password}
    Click login    ${text_login_button}
    See message state login    ${text_state_login}

Go back to the Login page and the message ' You logged out of the secure area!' is shown
    [Arguments]   ${text_logout_button}    ${text_state_logout}
    Click logout    ${text_logout_button}
    See message state logout    ${text_state_logout}

Login failed and the message 'Your password is invalid!' is shown
    [Arguments]    ${user_name}    ${password}    ${text_login_button}    ${text_state_login_failed}
    Input username    ${user_name}
    Input password    ${password}
    Click login    ${text_login_button}
    See message login failed    ${text_state_login_failed}

Login failed and the message 'Your username is invalid!' is shown
    [Arguments]    ${user_name}    ${password}    ${text_login_button}    ${text_user_not_found}
    Input username    ${user_name}
    Input password    ${password}
    Click login    ${text_login_button}
    See message username is invalid    ${text_user_not_found}
