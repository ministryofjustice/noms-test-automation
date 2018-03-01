*** Settings ***
Resource  ../../Data/Global_Data.robot

*** Variables ***
${CREATED_CASE_NOTE} =  //p[contains(.//text(), '${CASE_NOTE_TEXTS.new}')]
${AMENDMENT_BUTTON} =  //button[contains(.//text(), 'Make amendment')]
${AMENDMENT_CASE_NOTE_PAGE} =  //h1[contains(.//text(), 'Amend case note')]
${SAVE_AMENDMENT_BUTTON} =  //button[contains(.//text(), ' Save amendment ')]
${AMENDED_CASE_NOTE} =  //p[contains(.//text(), '${CASE_NOTE_TEXTS.edit}')]

*** Keywords ***
Check Created Case Note Exists
    Page Should Contain Element     ${CREATED_CASE_NOTE}

Click "Created" Case Note
    Wait Until Keyword Succeeds  10  0   Click Element   ${CREATED_CASE_NOTE}

Check "Make Amendment" Button
    Wait Until Page Contains Element     ${AMENDMENT_BUTTON}    timeout=1 minutes

Click "Make Amendment" Button
    Wait Until Keyword Succeeds  10  0   Click Element   ${AMENDMENT_BUTTON}

Check You Are On "Amend Case Note" Page
    Wait Until Page Contains Element     ${AMENDMENT_CASE_NOTE_PAGE}    timeout=1 minutes

Amend "Case Note"
    [Arguments]  ${comment}
    Input Text  name=amendmentText  ${comment}

Click "Save Amendment" Button
    Wait Until Keyword Succeeds  10  0   Click Element   ${SAVE_AMENDMENT_BUTTON}

Check "Amended Case Note" Displays
    Page Should Contain Element     ${AMENDED_CASE_NOTE}