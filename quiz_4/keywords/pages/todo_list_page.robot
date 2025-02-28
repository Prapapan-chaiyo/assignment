*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
See message the todo list is empty
    [Arguments]    ${text_warning}
    Wait Until Element Is Visible    ${txt_todo_empty}
    ${txt_empty}=    get text    ${txt_todo_empty}
    Should Be Equal    ${txt_empty}    ${text_warning}

Click add todo list
   Click element when ready   ${btn_add}

Verify title name
   [Arguments]   ${title_name}
   Wait Until Element Is Visible    ${txt_todo_list_name}
   ${txt_title_name}=    get text    ${txt_todo_list_name}
   Should Be Equal    ${txt_title_name}    ${title_name}

Verify date and time for today
   Wait Until Element Is Visible    ${text_date}
   ${text_date_list}    Get Text    ${text_date}
   Should Be Equal As Strings    ${text_date_list}    ${new_formatted_date}

Select list todo
   Click element when ready   ${list_todo}
