*** Settings ***
Documentation     A test suite containing tests related to 
...               Vacume Cleaner & Anvil Co. Feedback Form.
Library           Selenium2Library

*** Variables ***
${SERVER}         qatest.jukinmedia.com
${BROWSER}        Firefox
${DELAY}          0.3
${LOGIN URL}      http://${SERVER}/
${FEEDBACK URL}   http://${SERVER}/#/form

${BT.Mailinglist}                css=body > div > header > div > div.col-xs-2.newsletter

${MailingList.Email}             css=body > div.modal.fade.ng-isolate-scope.in > div > div > form > div.modal-body.align-center > input
${MailingList.AgeCheckbox}       css=body > div.modal.fade.ng-isolate-scope.in > div > div > form > div.modal-body.align-center > label > input[type="checkbox"]
${MailingList.SignUp}            css=body > div.modal.fade.ng-isolate-scope.in > div > div > form > div.modal-footer > button

${R1.Social_Media}     css=div.form-group label:contains('Social Media')
${R1.Advertising}      css=div.form-group label:contains('Advertising')
${R1.Search_Engine}    css=div.form-group label:contains('Search Engine')
${R1.Friend}           css=div.form-group label:contains('Friend')
${R1.Other}            css=body > div > div.container.form-container.ng-scope > form > div:nth-child(1) > div > div.col-sm-4 > label > input
${R1.Other_Input}      css=#other

${R2.1}                css=body > div > div.container.form-container.ng-scope > form > div:nth-child(2) > div > div:nth-child(1) > input
${R2.2}                css=body > div > div.container.form-container.ng-scope > form > div:nth-child(2) > div > div:nth-child(2) > input
${R2.3}                css=body > div > div.container.form-container.ng-scope > form > div:nth-child(2) > div > div:nth-child(3) > input
${R2.4}                css=body > div > div.container.form-container.ng-scope > form > div:nth-child(2) > div > div:nth-child(4) > input
${R2.5}                css=body > div > div.container.form-container.ng-scope > form > div:nth-child(2) > div > div:nth-child(5) > input

${R3.Yes}              css=body > div > div.container.form-container.ng-scope > form > div:nth-child(3) > div > div:nth-child(1) > label > input
${R3.No}               css=body > div > div.container.form-container.ng-scope > form > div:nth-child(3) > div > div:nth-child(2) > label > input

${I1.First_Name}       css=body > div > div.container.form-container.ng-scope > form > div:nth-child(6) > div:nth-child(1) > input
${I1.Last_Name}        css=body > div > div.container.form-container.ng-scope > form > div:nth-child(6) > div:nth-child(2) > input

${I2.Email}            css=body > div > div.container.form-container.ng-scope > form > div:nth-child(9) > div:nth-child(1) > input
${I2.Phone}            css=#phone

${BT.Submit}           css=body > div > div.container.form-container.ng-scope > form > div.form-actions.pull-right > button
${BT.DONE}             css=body > div.modal.fade.ng-isolate-scope.in > div > div > div.modal-footer.align-center.ng-scope > button

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
    Test Analytics Exist

Test Analytics Exist
    ${val}=  Execute Javascript  return window._gat ? '0' : '1';
    Should Be Equal  ${val}  0