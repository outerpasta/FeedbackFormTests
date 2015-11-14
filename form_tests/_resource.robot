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

${feedback}                 div.container.form-container.ng-scope

${feedback.mailingList}          css=div.col-xs-2.newsletter a
${mailingList}                   div.modal.fade.ng-isolate-scope.in
${mailingList.email}             css=${mailingList} input[type="email"]
${mailingList.ageCheckbox}       css=${mailingList} input[type="checkbox"]
${mailingList.signUp}            xpath=//button[contains(text(), 'Sign Up')]

${hear}                     ${feedback} form div:nth-child(1) div
${hear.socialMedia}         css=${hear} div:nth-child(1)
${hear.advertising}         css=${hear} div:nth-child(2)
${hear.searchEngine}        css=${hear} div:nth-child(3)
${hear.friend}              css=${hear} div:nth-child(4)
${hear.other}               css=${hear} div:nth-child(5) input
${hear.other.input}         css=#other

${rating}                   ${feedback} form div:nth-child(2) div
${rating.1}                 css=${rating} div:nth-child(1) input
${rating.2}                 css=${rating} div:nth-child(2) input
${rating.3}                 css=${rating} div:nth-child(3) input
${rating.4}                 css=${rating} div:nth-child(4) input
${rating.5}                 css=${rating} div:nth-child(5) input

${recommend}                ${feedback} form > div:nth-child(3) div             
${recommend.yes}            css=${recommend} div:nth-child(1) input
${recommend.no}             css=${recommend} div:nth-child(2) input

${names}                    ${feedback} form > div:nth-child(6)
${names.first}              css=${names} div:nth-child(1) input
${names.last}               css=${names} div:nth-child(2) input

${contact}                  ${feedback} form > div:nth-child(9)
${contact.email}            css=${contact} div:nth-child(1) input
${contact.phone}            css=${contact} div:nth-child(2) input

${submit}                   css=${feedback} form div.form-actions.pull-right


${done}                     xpath=//button[contains(text(), 'Done')]


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