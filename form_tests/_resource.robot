*** Settings ***
Documentation     A test suite containing tests related to 
...               Vacume Cleaner & Anvil Co. Feedback Form.
Library           Selenium2Library

*** Variables ***
${SERVER}         qatest.jukinmedia.com
${BROWSER}        Chrome
${DELAY}          1
${LOGIN URL}      http://${SERVER}/
${FEEDBACK URL}   http://${SERVER}/#/form

${R1_Social_Media}     /html/body/div/div[2]/form/div[1]/div/div[1]/label/input
${R1_Advertising}      /html/body/div/div[2]/form/div[1]/div/div[2]/label/input
${R1_Search_Engine}    /html/body/div/div[2]/form/div[1]/div/div[3]/label/input
${R1_Friend}           /html/body/div/div[2]/form/div[1]/div/div[4]/label/input
${R1_Other}            /html/body/div/div[2]/form/div[1]/div/div[5]/label/input
${R1_Input}            //*[@id="other"]

${R2_1}                /html/body/div/div[2]/form/div[2]/div/div[1]/input
${R2_2}                /html/body/div/div[2]/form/div[2]/div/div[2]/input
${R2_3}                /html/body/div/div[2]/form/div[2]/div/div[3]/input 
${R2_4}                /html/body/div/div[2]/form/div[2]/div/div[4]/input
${R2_5}                /html/body/div/div[2]/form/div[2]/div/div[5]/input

${R3_Yes}              /html/body/div/div[2]/form/div[3]/div/div[1]/label/input
${R3_No}               /html/body/div/div[2]/form/div[3]/div/div[2]/label/input

${I1_First_Name}       /html/body/div/div[2]/form/div[5]/div[1]/input
${I1_Last_Name}        /html/body/div/div[2]/form/div[5]/div[2]/input

${I2_Email}            /html/body/div/div[2]/form/div[6]/div[1]/input
${I2_Phone}            //*[@id="phone"]

${BT_Submit}           /html/body/div/div[2]/form/div[7]/button
${BT_DONE}             /html/body/div[3]/div/div/div[3]/button

*** Keywords ***
Open Browser To Login
    Open Browser            ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}
    
Go To Feedback Form
    Go To    ${LOGIN URL}
    Input Text      username    jukinmedia
    Input Text      password    qatest 
    Click Element   tag=button
    Location Should be   ${FEEDBACK URL}