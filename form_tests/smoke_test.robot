*** Settings ***
Documentation     Smoke Test
Test Setup        Go To Feedback Form
Resource          _resource.robot

*** Test Cases ***
Valid Submit
    Fill Out Feedback Form
    Submit Form
    Element Should Be Visible       ${done} 