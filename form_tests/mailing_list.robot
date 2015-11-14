*** Settings ***
Documentation     Test Mailing List Subscription
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
Style Check      
    Mouse Over       ${feedback.mailingList}
    ${color}=        Execute Javascript     var elem = document.evaluate("/html/body/div/header/div/div[3]/a/span",document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;var color = window.getComputedStyle(elem, null).getPropertyValue("color");return color;
    Should Be Equal  ${color}            rgb(255, 255, 0)

User Must Enter Email
    Click Element   ${feedback.mailingList}
    Click Element   ${mailingList.ageCheckbox}
    Click Element   ${mailingList.signUp}
    Element Should Be Visible        css=${mailingList}

User Must Enter Valid Email
    Click Element   ${feedback.mailingList}
    Input Text      ${mailingList.email}          outerpasta@gmail
    Click Element   ${mailingList.ageCheckbox}
    Click Element   ${mailingList.signUp}
    Element Should Be Visible        css=${mailingList}

User Must Enter Age Verification
    Click Element   ${feedback.mailingList}
    Input Text      ${mailingList.email}          outerpasta@gmail.com
    Click Element   ${mailingList.signUp}
    Element Should Be Visible        css=${mailingList}
    
User Can Subscribe
    Click Element   ${feedback.mailingList}
    Input Text      ${mailingList.email}          outerpasta@gmail.com
    Click Element   ${mailingList.ageCheckbox}
    Click Element   ${mailingList.signUp}
    Element Should Not Be Visible    css=${mailingList}
    