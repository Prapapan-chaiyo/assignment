*** Settings ***
Resource    ../Keywords/import.robot
Test Setup         Open website
Test Teardown      Clear All Browser

*** Test Cases ***
Login success
   [Documentation]    To verify that users can login successfully when input a correct username and password.
   Login page is shown    ${login_page.title}
   Login success and message 'You logged into a secure area!' is shown    ${login.username}    ${login.password}    ${login_page.login_button}
   ...    ${message.state_login}
   Go back to the Login page and the message ' You logged out of the secure area!' is shown    ${login_page.logout_button}    ${message.state_logout}

Login failed password incorrect
   [Documentation]    To verify that users can login unsuccessfully when they input a correct username but wrong password.
   Login page is shown    ${login_page.title}
   Login failed and the message 'Your password is invalid!' is shown    ${login.username}    ${login.invalid_password}    ${login_page.login_button}
   ...    ${message.state_login_failed}

Login failed username not found
   [Documentation]    To verify that users can login unsuccessfully when they input a username that did not exist.
   Login page is shown    ${login_page.title}
   Login failed and the message 'Your username is invalid!' is shown    ${login.invalid_username}    ${login.invalid_password}    ${login_page.login_button}
   ...    ${message.state_user_not_found}
