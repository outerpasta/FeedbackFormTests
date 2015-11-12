*** Settings ***
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
User Can Submit
    Click Element                   xpath=${R1_Social_Media}

    Click Element                   xpath=${R3_Yes} 
    Input Text                      xpath=${I1_First_Name}  alex
    Input Text                      xpath=${I1_Last_Name}   barry
    Input Text                      xpath=${I2_Email}       outerpasta@gmail.com
    Input Text                      xpath=${I2_Phone}       3103101806   
    Click Element                   xpath=${BT_Submit}  
    Element Should Not Be Visible   xpath=${BT_DONE}  