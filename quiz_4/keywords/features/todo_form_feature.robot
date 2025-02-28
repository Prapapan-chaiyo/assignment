*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Add todo list without reminders
    [Arguments]    ${title_name}
    Input title    ${title_name}
    Make todo list

Add todo list with reminders for today
    [Arguments]    ${title_name}    ${text_today}    ${date_add}
    Input title    ${title_name}
    Enable remind me
    Verify the date for today    ${text_today}
    Verify time
    Verify the current date and time    ${date_add}
    Make todo list

Verify todo details
   [Arguments]    ${date}    ${time}
    Enable remind me
    Verify reminder date detail    ${date}
    Verify reminder time detail    ${time}

Edit todo list
   [Arguments]    ${edit_title_name}    ${date_add}
   Edit titel        ${edit_title_name}
   Click Edit date
   Edit date    ${date_add}
   Click ok button to edit date
   Verify reminder date detail    ${date_add}
   Make todo list
