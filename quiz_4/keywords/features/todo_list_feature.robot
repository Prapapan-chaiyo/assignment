*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Verify todo list without reminders
    [Arguments]   ${title_name}
    Verify title name    ${title_name}