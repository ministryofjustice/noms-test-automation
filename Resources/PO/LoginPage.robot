*** Settings ***
Documentation    This is the Page Object for the Login Page
Resource  ../../Data/Global_Data.robot

*** Variables ***
${LOGINBUTTON} =   xpath=//input[contains(@type, 'submit')]
${INVALID_CREDENTIAL_ERROR} =  //div[contains(.//text(), 'The username or password you have entered is invalid.')]
${REQUIRED_TEXT} =  //span[contains(.//text(), 'Required')]


*** Keywords ***
Load
   Go To  ${START_URL}

Input Username
    [Arguments]    ${username}
    Wait For Page Ready    name=username
    Input Text    name=username   ${username}

Input Password
    [Arguments]    ${password}
    Wait For Page Ready    password
    Input Text    password    ${password}

Submit Credentials
    Click Button    ${LOGINBUTTON}

Error Message Is Shown
    Wait For Page Ready    ${INVALID_CREDENTIAL_ERROR}
    Page Should Contain Element  ${INVALID_CREDENTIAL_ERROR}

Credentials
    Wait Until Page Contains Element  ${LOGINBUTTON}
    Click Button    ${LOGINBUTTON}

Check For "Required" Text Displays
    Wait For Page Ready     ${REQUIRED_TEXT}
    Page Should Contain Element  ${REQUIRED_TEXT}

Wait For Page Ready
    [Arguments]     ${element}
    Wait Until Page Contains Element    ${element}  timeout=1 minutes
    Focus  ${element}