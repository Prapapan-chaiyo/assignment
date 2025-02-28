*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Input title
    [Arguments]    ${title_name}
    Wait Until Page Contains Element    ${txt_title}
    Input Text    ${txt_title}     ${title_name}

Make todo list
   Click element when ready   ${btn_action}

Enable remind me
    Wait Until Element Is Visible   ${btn_remind_me}
    ${switch_status}    Get Element Attribute    ${btn_remind_me}    checked
    Run Keyword If    '${switch_status}' == 'false'    Click Element    ${btn_remind_me}

Verify the date for today
   [Arguments]   ${text_today}
   Wait Until Element Is Visible    ${text_reminder_date}
   ${todo_date}=    get text    ${text_reminder_date}
   Should Be Equal    ${todo_date}    ${text_today}

Verify time
    ${time_displayed}    Get Text    ${text_reminder_time}
    ${time}    Set Variable    ${time_displayed} 
    Set Global Variable     ${time}

Verify the current date and time
    [Arguments]   ${date_add}
    ${full_text}    Get Text    ${text_reminder}
    ${clean_text}    Replace String    ${full_text}    Reminder set for    ${EMPTY}
    ${split_text}    Split String    ${clean_text}    ,
    ${reminder_date}    Strip String    ${split_text}[0] 
    ${reminder_year}    Strip String    ${split_text}[1]
    ${reminder_time}    Strip String    ${split_text}[2]

    ${formatted_reminder_date}    Set Variable    ${reminder_date}, ${reminder_year}
    ${date}    Set Variable    ${formatted_reminder_date}
    Set Global Variable     ${date}

    ${current_date}    Get Current Date 
    ${add_date}    Add Time To Date    ${current_date}    ${date_add} days   
    ${convert_date}=    Convert Date	${add_date}    result_format=%d %b, %Y

    Should Be Equal As Strings    ${date}    ${convert_date}
    Should Be Equal As Strings    ${reminder_time}    ${time}

    ${new_format}    Set Variable    ${reminder_date}, ${reminder_year}
    ${formatted_date}    Convert Date    ${new_format}    date_format=%d %b, %Y    result_format=%b %d, %Y
    ${new_formatted_date}    Set Variable    ${formatted_date}${SPACE}${SPACE}${time}
    Set Global Variable     ${new_formatted_date}

Verify reminder date detail
   [Arguments]    ${date_add}
    Wait Until Element Is Visible    ${text_reminder_date}
    ${current_date}    Get Current Date 
    ${date_detail}    Add Time To Date    ${current_date}    ${date_add} days   
    ${convert_date_detail}=    Convert Date	${date_detail}    result_format=%-d %b, %Y
    ${txt_date}=    get text    ${text_reminder_date}
    Should Be Equal    ${txt_date}    ${convert_date_detail}

Verify reminder time detail
   [Arguments]    ${time}
   Wait Until Element Is Visible    ${text_reminder_time}
   ${time_todo}=    get text    ${text_reminder_time}
   Should Be Equal    ${time_todo}    ${time}

Edit titel
    [Arguments]    ${edit_title_name}
    Wait Until Page Contains Element    ${txt_edit_title}
    Clear Text  ${txt_edit_title}
    Input Text    ${txt_edit_title}    ${edit_title_name}

Click Edit date
   Click element when ready    ${text_reminder_date}

Edit date
    [Arguments]   ${date_add}
    ${current_date}    Get Current Date
    ${edit_date}    Add Time To Date    ${current_date}    ${date_add} days   
    ${new_edit_date}=    Convert Date	${edit_date}    result_format=%d %B %Y
    Wait Until Element Is Visible  ${locator_calendar}
    ${find_calendar}    Run Keyword And Return Status     Wait Until Element Is Visible    //android.view.View[@content-desc="${new_edit_date}"] 
    IF  ${find_calendar} == ${TRUE}
        Click element when ready   //android.view.View[@content-desc="${new_edit_date}"] 
    ELSE
        Swipe Up    android:id/content   //android.view.View[@content-desc="${new_edit_date}"]
        Click element when ready   //android.view.View[@content-desc="${new_edit_date}"] 
    END

Click ok button to edit date
    Click element when ready   ${btn_ok}
