*** Settings ***
Documentation     Checking Style Requirements
Test Setup        Init Utils
Resource          _resource.robot

*** Test Cases ***
Hover Over Link Turns Yellow 
    Mouse Over            ${feedback.mailingList}
    ${color}=             Execute Javascript          return window.getCSSValue("color","newsletter",tags="a");
    Should Be Equal       ${color}                    rgb(255, 255, 0)
    
Company Logo 15px from left edge
    ${padding}=           Execute Javascript          return window.getCSSValue("padding-left","logo","img");
    Should Be Equal       ${padding}                  15px

*** Keywords ***
Init Utils
    Execute Javascript    ${EXECDIR}/js/window_utils.js
