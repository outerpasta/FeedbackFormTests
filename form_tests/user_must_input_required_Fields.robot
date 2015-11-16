*** Settings ***
Documentation     Required Fields
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
User Must Input Rating
    Click Element                   ${hear.socialMedia}
    Click Element                   ${recommend.yes} 
    Enter Names
    Enter Contact Info
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done}  
    
User Must Input Recommend
    Click Element                   ${hear.socialMedia}
    Click Element                   ${rating.1}   
    Enter Names
    Enter Contact Info 
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done} 
    
User Must Input First Name  
    Click Element                   ${hear.socialMedia}
    Click Element                   ${rating.1} 
    Click Element                   ${recommend.yes}   
    Input Text                      ${names.last}            barry
    Enter Contact Info  
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done} 

User Must Input Last Name  
    Click Element                   ${hear.socialMedia}
    Click Element                   ${rating.1} 
    Click Element                   ${recommend.yes}   
    Input Text                      ${names.first}           alex
    Enter Contact Info 
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done}   
    
User Must Specify Reason If "Other" Selected 
    Click Element                   ${hear.other}
    Click Element                   ${rating.1} 
    Click Element                   ${recommend.yes}   
    Enter Names
    Enter Contact Info
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done} 
    User Can Input If Required Item Selected      ${hear.other.input}      the news
    
User Must Specify Reason If "No" Selected
    Click Element                   ${hear.socialMedia}
    Click Element                   ${rating.1}
    Click Element                   ${recommend.no}
    Enter Names
    Enter Contact Info
    Click Element                   ${submit}
    Element Should Not Be Visible   ${done}
    User Can Input If Required Item Selected      ${recommend.no.input}    bad service
    
    
*** Keywords ***
User Can Input If Required Item Selected 
    [Arguments]                     ${required_input}      ${text}
    Input Text                      ${required_input}      ${text}
    Click Element                   ${submit}  
    Element Should Be Visible       ${done} 
    Click Element                   ${done} 
    
Enter Names
    Input Text  ${names.first}    alex
    Input Text  ${names.last}     barry

Enter Contact Info    
    Input Text  ${contact.email}  outerpasta@gmail.com
    Input Text  ${contact.phone}  3103101806   
    
    