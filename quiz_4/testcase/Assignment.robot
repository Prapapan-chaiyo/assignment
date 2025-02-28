*** Settings ***
Resource    ${CURDIR}/../Keywords/import.robot
Test Setup       Open application mimimal todo
Test Teardown    Close Application


*** Test Cases ***
Verify the todo list is empty
    See message the todo list is empty    ${list.empty}

Create a todo list without reminders successfully
   Click add todo list
   Add todo list without reminders    ${title.name}
   Verify todo list without reminders   ${title.name}

Create a todo list with reminders for today successfully
   Click add todo list
   Add todo list with reminders for today    ${title.name}    ${title.date_today}    0
   Verify date and time for today

Verify the todo list details with reminders
   Click add todo list
   Add todo list with reminders for today    ${title.name}    ${title.date_today}    0
   Verify date and time for today
   Select list todo
   Verify todo details    0    ${time}

Edit todo list with reminders
   Click add todo list
   Add todo list with reminders for today    ${title.name}    ${title.date_today}    0
   Verify date and time for today
   Select list todo
   Edit todo list    ${title.name_edit}    2
   Verify title name    ${title.name_edit}
   
   