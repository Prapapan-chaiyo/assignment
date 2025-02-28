*** Settings ***
Resource    ../import.robot

*** Keywords ***
Verify title page
    [Arguments]    ${text_title_page}
    ${text_title_locator}    String.Replace string    ${text_title_page_name}    ***text***    ${text_title_page}
    Wait Until Element Is Visible    ${text_title_locator}

Input username
    [Arguments]    ${user_name}
    Input Text    ${txt_username_login}    ${user_name}

Input password
    [Arguments]    ${password}
    Input Text    ${txt_password_login}    ${password}

Click login
    [Arguments]    ${text_login_button}
    ${btn_login_locator}    String.Replace string    ${btn_login}    ***text***    ${text_login_button}
    Click MyElement    ${btn_login_locator}

See message state login
    [Arguments]    ${text_state_login}
    Wait Until Page Contains    ${text_state_login}

Click logout
    [Arguments]    ${text_logout_button}
    ${btn_logout_locator}    String.Replace string    ${btn_logout}    ***text***    ${text_logout_button}
    Click MyElement    ${btn_logout_locator}

See message state logout
    [Arguments]    ${text_state_logout}
    Wait Until Page Contains    ${text_state_logout}

See message login failed
    [Arguments]    ${text_state_login_failed}
    Wait Until Page Contains    ${text_state_login_failed}

See message username is invalid
    [Arguments]    ${text_user_not_found}
    Wait Until Page Contains    ${text_user_not_found}
    