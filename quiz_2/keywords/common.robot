*** Settings ***
Resource    import.robot

*** Keywords ***
Open website
    Open Browser    ${url}      browser=chrome
    Maximize Browser Window

Click MyElement
    [Arguments]    ${MyElement}
    Wait Until Element Is Visible    ${MyElement}
    Click Element    ${MyElement}

Clear All Browser
    SeleniumLibrary.Close All Browsers
    