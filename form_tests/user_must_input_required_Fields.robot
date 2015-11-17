*** Settings ***
Documentation     Required Fields
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
User Must Input Rating
    Fill Out Feedback Form   rating=${EMPTY}
    Submit Form    
    Form Should Not Be Sent
    
User Must Input Recommend
    Fill Out Feedback Form   recommend=${EMPTY}
    Submit Form    
    Form Should Not Be Sent
    
User Must Input First Name  
    Fill Out Feedback Form   firstName=${EMPTY} 
    Submit Form    
    Form Should Not Be Sent

User Must Input Last Name  
    Fill Out Feedback Form   lastName=${EMPTY}
    Submit Form    
    Form Should Not Be Sent
    
User Must Specify Reason If "Other" Selected 
    Fill Out Feedback Form   hear=${hear.other}
    Submit Form    
    Form Should Not Be Sent
    User Can Input If Required Item Selected      ${hear.other.input}      the news
    
User Must Specify Reason If "No" Selected
    Fill Out Feedback Form   recommend=${recommend.no}
    Submit Form    
    Form Should Not Be Sent
    User Can Input If Required Item Selected      ${recommend.no.input}    bad service
    
    
*** Keywords ***
User Can Input If Required Item Selected 
    [Arguments]                     ${required_input}      ${text}
    Input Text                      ${required_input}      ${text}
    Click Element                   ${submit}  
    Element Should Be Visible       ${done} 
    Click Element                   ${done} 