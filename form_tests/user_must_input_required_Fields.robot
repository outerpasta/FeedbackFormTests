*** Settings ***
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
User Must Input Rating
    Click Element                   ${R1.Social_Media}
    Click Element                   ${R3.Yes} 
    Input Text                      ${I1.First_Name}    alex
    Input Text                      ${I1.Last_Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Not Be Visible   ${BT.DONE}  
    
User Must Input Recommend
    Click Element                   ${R1.Social_Media}
    Click Element                   ${R2.1}   
    Input Text                      ${I1.First_Name}    alex
    Input Text                      ${I1.Last_Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Not Be Visible   ${BT.DONE} 
    
User Must Input First Name  
    Click Element                   ${R1.Social_Media}
    Click Element                   ${R2.1} 
    Click Element                   ${R3.Yes}   
    Input Text                      ${I1.Last_Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Not Be Visible   ${BT.DONE} 

User Must Input Last Name  
    Click Element                   ${R1.Social_Media}
    Click Element                   ${R2.1} 
    Click Element                   ${R3.Yes}   
    Input Text                      ${I1.First_Name}    alex
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Not Be Visible   ${BT.DONE}   
    
User Must Specify Reason If "Other" Selected 
    Click Element                   ${R1.Other}
    Click Element                   ${R2.1} 
    Click Element                   ${R3.Yes}   
    Input Text                      ${I1.First_Name}    alex
    Input Text                      ${I1.Last_Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Not Be Visible   ${BT.DONE} 
    
User Can Specify Reason If "Other" Selected 
    Click Element                   ${R1.Other}
    Input Text                      ${R1.Other_Input}   the news
    Click Element                   ${R2.1} 
    Click Element                   ${R3.Yes}   
    Input Text                      ${I1.First_Name}    alex
    Input Text                      ${I1.Last_Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Be Visible       ${BT.DONE} 
    Click Element                   ${BT.DONE} 