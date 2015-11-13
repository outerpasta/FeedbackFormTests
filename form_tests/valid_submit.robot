*** Settings ***
Documentation     Test succesful run
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
Valid Submit
    Click Element                   ${hear.socialMedia}
    Click Element                   ${rating.1}   
    Click Element                   ${recommend.yes} 
    Input Text                      ${names.first}           alex
    Input Text                      ${names.last}            barry
    Input Text                      ${contact.email}         outerpasta@gmail.com
    Input Text                      ${contact.phone}         3103101806   
    Click Element                   ${submit}  
    Element Should Be Visible       ${done} 