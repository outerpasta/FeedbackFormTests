*** Settings ***
Documentation     Style Requirements
Test Setup        Init Utils
Resource          _resource.robot

*** Test Cases ***
Hover Over Link Turns Yellow 
    Mouse Over            ${feedback.mailingList}
    Compare CSS Value     return window.getCSSValue("color","newsletter",tags="a");   rgb(255, 255, 0)
    
Company Logo 15px from left edge
    Compare CSS Value     return window.getCSSValue("padding-left","logo","img");     15px

*** Keywords ***
Init Utils
    Go To Feedback Form
    Execute Javascript    ${EXECDIR}/js/window_utils.js

Compare CSS Value
    [Arguments]      ${script}     ${correct}
    ${value}=          Execute Javascript   ${script} 
    Should Be Equal    ${value}             ${correct}
