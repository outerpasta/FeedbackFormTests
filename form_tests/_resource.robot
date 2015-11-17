*** Settings ***
Documentation     A test suite containing tests related to 
...               Vacume Cleaner & Anvil Co. Feedback Form.
Library           Selenium2Library

*** Variables ***
${SERVER}         qatest.jukinmedia.com
${BROWSER}        Firefox
${DELAY}          0.5
${LOGIN URL}      http://${SERVER}/
${FEEDBACK URL}   http://${SERVER}/#/form

${feedback}                 div.container.form-container

${companyLogo}              css=div.col-xs-2.logo img
${companyMoto}              css=div.col-xs-8.align-center p
${companyName}              css=div.col-xs-8.align-center h1

${feedback.mailingList}          css=div.col-xs-2.newsletter a
${mailingList}                   div.modal
${mailingList.email}             css=${mailingList} input[type="email"]
${mailingList.ageCheckbox}       css=${mailingList} input[type="checkbox"]
${mailingList.signUp}            css=div.modal form button

${hear_path}                ${feedback} form div:nth-child(1) div
${hear.socialMedia}         css=${hear_path} div:nth-child(1)
${hear.advertising}         css=${hear_path} div:nth-child(2)
${hear.searchEngine}        css=${hear_path} div:nth-child(3)
${hear.friend}              css=${hear_path} div:nth-child(4)
${hear.other}               css=${hear_path} div:nth-child(5) input
${hear.other.input}         css=#other

${rating_path}              ${feedback} form div:nth-child(2) div
${rating.1}                 css=${rating_path} div:nth-child(1) input
${rating.2}                 css=${rating_path} div:nth-child(2) input
${rating.3}                 css=${rating_path} div:nth-child(3) input
${rating.4}                 css=${rating_path} div:nth-child(4) input
${rating.5}                 css=${rating_path} div:nth-child(5) input

${recommend_path}           ${feedback} form > div:nth-child(3) div             
${recommend.yes}            css=${recommend_path} div:nth-child(1) input
${recommend.no}             css=${recommend_path} div:nth-child(2) input
${recommend.no.input}       css=${feedback} form textarea

${names_path}               ${feedback} form > div:nth-child(6)
${names.first}              css=${names_path} div:nth-child(1) input
${names.last}               css=${names_path} div:nth-child(2) input

${contact_path}             ${feedback} form > div:nth-child(9)
${contact.email}            css=${contact_path} div:nth-child(1) input
${contact.phone}            css=${contact_path} div:nth-child(2) input

${submit}                   css=${feedback} div.form-actions.pull-right

${done}                     css=div.modal div.align-center button


*** Keywords ***
Open Browser To Feedback Form
    Open Browser            ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}
    Open Feedback Form    
    
Open Feedback Form
    Go To    ${LOGIN URL}
    Input Text      username    jukinmedia
    Input Text      password    qatest 
    Click Element   tag=button
    Location Should be   ${FEEDBACK URL}
    Test Analytics Exist

Go To Feedback Form
    Go To    ${FEEDBACK URL}

Test Analytics Exist
    ${val}=  Execute Javascript  return window._gat ? '0' : '1';
    Should Be Equal  ${val}  0

Fill Out Feedback Form
    [Arguments]  ${hear}=${hear.socialMedia}
    ...          ${rating}=${rating.1}
    ...          ${recommend}=${recommend.yes}
    ...          ${firstName}=alex              ${lastName}=barry
    ...          ${email}=outerpasta@gmail.com  ${phone}=13103101806
    Run Keyword If  '${hear}' != '${EMPTY}'        Click Element   ${hear}
    Run Keyword If  '${rating}' != '${EMPTY}'      Click Element   ${rating}   
    Run Keyword If  '${recommend}' != '${EMPTY}'   Click Element   ${recommend} 
    Input Text     ${names.first}             ${firstName}
    Input Text     ${names.last}              ${lastName}
    Input Text     ${contact.email}           ${email}
    Input Text     ${contact.phone}           ${phone} 
 
Submit Form    
    Click Element                   ${submit}  
    
Form Should Not Be Sent
    Element Should Not Be Visible   ${done}  