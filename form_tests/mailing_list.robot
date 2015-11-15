*** Settings ***
Documentation     Mailing List Subscription
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
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
    