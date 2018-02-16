*** Settings ***
Documentation    This is the Page Object for the Footer links
Resource  ../../Data/Global_Data.robot

*** Variables ***
${TERMS_&_CONDITIONS_LINK} =  //div/div/div[contains(.//text(), 'Terms and conditions')]
${TERMS_&_CONDITIONS_PAGE} =  //div[contains(.//text(), 'Terms and conditions')]

*** Keywords ***

Go To Home URL
    Go To  ${START_URL}

Check Page URL
    ${current_url} =  Get Location
    Run Keyword If  "${current_url}" == "${START_URL}"   Log  ${current_url}

Check for presence of Terms & Conditions link
  Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${TERMS_&_CONDITIONS_LINK}

Click "T's & C's" Link
    Wait Until Keyword Succeeds  20  0  Click Element   ${TERMS_&_CONDITIONS_LINK}

Check T's & C's page wording appears
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${TERMS_&_CONDITIONS_PAGE}