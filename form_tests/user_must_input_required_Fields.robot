*** Settings ***
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
User Must Input Rating
    Click Element                   ${hear.socialMedia}
    Click Element                   ${recommend.yes} 
    Input Text                      ${names.first}           alex
    Input Text                      ${names.last}            barry
    Input Text                      ${contact.email}         outerpasta@gmail.com
    Input Text                      ${contact.phone}         3103101806   
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done}  
    
User Must Input Recommend
    Click Element                   ${hear.socialMedia}
    Click Element                   ${rating.1}   
    Input Text                      ${names.first}           alex
    Input Text                      ${names.last}            barry
    Input Text                      ${contact.email}         outerpasta@gmail.com
    Input Text                      ${contact.phone}         3103101806   
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done} 
    
User Must Input First Name  
    Click Element                   ${hear.socialMedia}
    Click Element                   ${rating.1} 
    Click Element                   ${recommend.yes}   
    Input Text                      ${names.last}            barry
    Input Text                      ${contact.email}         outerpasta@gmail.com
    Input Text                      ${contact.phone}         3103101806   
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done} 

User Must Input Last Name  
    Click Element                   ${hear.socialMedia}
    Click Element                   ${rating.1} 
    Click Element                   ${recommend.yes}   
    Input Text                      ${names.first}           alex
    Input Text                      ${contact.email}         outerpasta@gmail.com
    Input Text                      ${contact.phone}         3103101806   
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done}   
    
User Must Specify Reason If "Other" Selected 
    Click Element                   ${hear.other}
    Click Element                   ${rating.1} 
    Click Element                   ${recommend.yes}   
    Input Text                      ${names.first}           alex
    Input Text                      ${names.last}            barry
    Input Text                      ${contact.email}         outerpasta@gmail.com
    Input Text                      ${contact.phone}         3103101806   
    Click Element                   ${submit}  
    Element Should Not Be Visible   ${done} 
    User Can Specify Reason If "Other" Selected
    
*** Keywords ***
    
User Can Specify Reason If "Other" Selected 
    Input Text                      ${hear.other.input}      the news 
    Click Element                   ${submit}  
    Element Should Be Visible       ${done} 
    Click Element                   ${done} 