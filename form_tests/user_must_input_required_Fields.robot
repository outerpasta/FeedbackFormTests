*** Settings ***
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
User Must Input Rating
    Click Element                   ${R1.Social.Media}
    Click Element                   ${R3.Yes} 
    Input Text                      ${I1.First.Name}    alex
    Input Text                      ${I1.Last.Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Not Be Visible   ${BT.DONE}  
    
User Must Input Recommend
    Click Element                   ${R1.Social.Media}
    Click Element                   ${R2.1}   
    Input Text                      ${I1.First.Name}    alex
    Input Text                      ${I1.Last.Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Not Be Visible   ${BT.DONE} 
    
User Must Input Name  
    Click Element                   ${R1.Social.Media}
    Click Element                   ${R2.1} 
    Click Element                   ${R3.Yes}   
    Input Text                      ${I1.Last.Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Not Be Visible   ${BT.DONE} 
    
User Must Input Other If Selected 
    Click Element                   ${R1.Other}
    Click Element                   ${R2.1} 
    Click Element                   ${R3.Yes}   
    Input Text                      ${I1.First.Name}    alex
    Input Text                      ${I1.Last.Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Not Be Visible   ${BT.DONE} 
    
User Can Input Other If Selected 
    Click Element                   ${R1.Other}
    Input Text                      ${R1.Other.Input}   the news
    Click Element                   ${R2.1} 
    Click Element                   ${R3.Yes}   
    Input Text                      ${I1.First.Name}    alex
    Input Text                      ${I1.Last.Name}     barry
    Input Text                      ${I2.Email}         outerpasta@gmail.com
    Input Text                      ${I2.Phone}         3103101806   
    Click Element                   ${BT.Submit}  
    Element Should Be Visible       ${BT.DONE} 
    Click Element                   ${BT.DONE} 