*** Settings ***
Documentation    This is the Page Object for the Offender Personal Page Tabs
Resource  ../../Data/Global_Data.robot

*** Variables ***
${PERSONAL_DETAILS_BODY} =   //div[contains(@class, 'offender-details')]
${ADD_CASE_NOTE_LINK} =   //a[contains(@href, '/bookings/details/addCaseNote')]
${ADD_APPOINTMENT_LINK} =   //a[contains(@href, '/bookings/details/addAppointment')]
${QUICK_LOOK_TAB} =   //div[contains(.//text(), 'Quick look')]
${ALERTS_TAB} =   //div[contains(text(),'Alerts')]
${CASE_NOTE_TAB} =   //div[contains(text(),'Case notes')]
${KEY_DATES_TAB} =   //div[contains(text(),'Key dates')]
${QUICK_LOOK_TAB_BODY} =   //div[contains(@class, 'quick-look')]
${ALERTS_TAB_BODY} =   //h1[contains(text(),'There are no alerts for this offender.')]
${CASE_NOTES_TAB_FILTER_HEADER} =   //h3[contains(text(),'Filters')]

${KEY_DATES_TAB_BODY} =   //div[contains(@class, 'key-dates')]

*** Keywords ***

Full "Personal Details" Tab
    [Arguments]  ${dob}  ${age}  ${gender}  ${aliases}
    Capture Page Screenshot
    Wait Until Element Becomes Available    ${PERSONAL_DETAILS_BODY}

Full Quick Look Tab "Offence Details"
    [Arguments]  ${dob}  ${age}  ${gender}  ${aliases}
    Capture Page Screenshot
    Wait Until Element Becomes Available    ${QUICK_LOOK_TAB_BODY}

Full "Key Dates" Tab Body Information
    [Arguments]  ${iep}
    Capture Page Screenshot
    Wait Until Element Becomes Available    ${KEY_DATES_TAB_BODY}


Check "Case Notes" Tab Filter Header
    Wait Until Element Becomes Available    ${CASE_NOTES_TAB_FILTER_HEADER}

Check "Alerts" Tab Body Infomation
    Wait Until Element Becomes Available    ${ALERTS_TAB_BODY}

Check "Add Case Note" Link Is Available
    Wait Until Element Becomes Available    ${ADD_CASE_NOTE_LINK}

Check "Add Appointment" Link Is Available
    Wait Until Element Becomes Available    ${ADD_APPOINTMENT_LINK}

Click "Quick Look" Tab
    Click Any Element   ${QUICK_LOOK_TAB}

Select "Alerts" Tab
    Click Any Element   ${ALERTS_TAB}

Select "Case Notes" Tab
    Click Any Element   ${CASE_NOTE_TAB}

Select "Key Dates" Tab
    Click Any Element   ${KEY_DATES_TAB}

Check "Case Notes" Tab Displays
    Wait Until Element Becomes Available    ${CASE_NOTE_TAB}


Wait Until Element Becomes Available
    [Arguments]  ${element}
    Sleep  20s
    Wait Until Page Contains Element    ${element}  timeout=1 minutes
#    Set Focus To Element  ${element}


Click Any Element
    [Arguments]  ${element}
    Wait Until Page Contains Element    ${element}  timeout=1 minutes
    Wait Until Keyword Succeeds  20  0  Click Element   ${element}

