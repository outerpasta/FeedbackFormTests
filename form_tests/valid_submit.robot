*** Settings ***
Documentation     Test succesful run
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
Valid Submit
    Click Element                  ${R1.Social.Media}
    Click Element                  ${R2.1}   
    Click Element                  ${R3.Yes} 
    Input Text                     ${I1.First.Name}     alex
    Input Text                     ${I1.Last.Name}      barry
    Input Text                     ${I2.Email}          outerpasta@gmail.com
    Input Text                     ${I2.Phone}          3103101806   
    Click Element                  ${BT.Submit}  
    Element Should Be Visible      ${BT.DONE}  
    Click Element                  ${BT.DONE}  