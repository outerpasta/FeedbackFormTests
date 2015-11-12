*** Settings ***
Documentation     Test succesful run
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
Valid Submit
    Click Element                  xpath=${R1_Social_Media}
    Click Element                  xpath=${R2_1}   
    Click Element                  xpath=${R3_Yes} 
    Input Text                     xpath=${I1_First_Name}  alex
    Input Text                     xpath=${I1_Last_Name}   barry
    Input Text                     xpath=${I2_Email}       outerpasta@gmail.com
    Input Text                     xpath=${I2_Phone}       3103101806   
    Click Element                  xpath=${BT_Submit}  
    Element Should Be Visible      xpath=${BT_DONE}  
    Click Element                  xpath=${BT_DONE}  
    Element Should Not Be Visible  xpath=${BT_DONE}  