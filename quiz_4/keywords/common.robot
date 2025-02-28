*** Settings ***
Resource    import.robot

*** Keywords ***
Open application mimimal todo
    Open Application    remote_url=${remoteURL}   
    ...    deviceName=${deviceName}   
    ...    platformVersion=${platformVersion}   
    ...    platformName=${platformName}  
    ...    app=${app}

Click element when ready 
    [Arguments]    ${MyElement}
    Wait Until Element Is Visible    ${MyElement}
    Click Element    ${MyElement}

Swipe Up
    [Arguments]       ${fragement}    ${find_element_id}
    FOR    ${index}    IN RANGE    10
        ${element_size}=    Get Element Size    id=${fragement}
        ${element_location}=    Get Element Location    id=${fragement}
        ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
        ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
        ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
        Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
        ${el}    Run Keyword And Return Status     Wait Until Page Contains Element   ${find_element_id}
        Run Keyword If    ${el}     Exit For Loop
    END
