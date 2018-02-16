*** Settings ***
Documentation    This Is Checking All Available Tabs Under Offender's Header's Records.

Resource   ../Resources/Common.robot


*** Keywords ***
Keyworker Logs Into [NOMIS]
    Login.Login As Keyworker User

[Nomis] Home Page Displays
    Toolbar.Check User Is On The "Home" Page

Enters Offender's [Name] Into The [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${OFFENDER_HEADER_RECORD.name}

Selects [Search] Button
    SearchOffenderRecords.Click "Search" Button

[Personal] Details Page Displays
    SearchOffenderResults.Personal Details Page Displays

Offender Full Personal Details Displays
    OffenderRecordTabs.Full "Personal Details" Tab  ${OFFENDER_HEADER_RECORD.dob}   ${OFFENDER_HEADER_RECORD.aliase}
    ...     ${OFFENDER_HEADER_RECORD.age}   ${OFFENDER_HEADER_RECORD.gender}

Validate Both [Add Case Note] & [Add Appointment] Links Available
#    Wait For Page Ready  ${ADD_CASE_NOTE_LINK}
    wait until keyword succeeds  10  0  OffenderRecordTabs.Check "Add Case Note" Link Is Available
#    Wait For Page Ready  ${ADD_APPOINTMENT_LINK}
    wait until keyword succeeds  10  0  OffenderRecordTabs.Check "Add Appointment" Link Is Available

Selects [Quick Look] Tab
    OffenderRecordTabs.Click "Quick Look" Tab

Selects [Alerts] Tab
    OffenderRecordTabs.Select "Alerts" Tab

Selects [Case Notes] Tab
    OffenderRecordTabs.Select "Case Notes" Tab

Selects [Key Dates] Tab
    OffenderRecordTabs.Select "Key Dates" Tab

Validate [Offence] & [Money] Details
    OffenderRecordTabs.Full Quick Look Tab "Offence Details"    ${OFFENDER_TABS_RECORD.Offences}    ${OFFENDER_TABS_RECORD.MoneySpends}
    ...  ${OFFENDER_TABS_RECORD.MoneyPrivate}   ${OFFENDER_TABS_RECORD.MoneySavings}

Check Informations Available Under [Alerts] Tab
    OffenderRecordTabs.Check "Alerts" Tab Body Infomation

Validate [Case Notes] Tab Filter Header
    wait until keyword succeeds  10  0  OffenderRecordTabs.Check "Case Notes" Tab Filter Header

Check [Key Notes] Tab Information
    OffenderRecordTabs.Full "Key Dates" Tab Body Information    ${OFFENDER_HEADER_RECORD.iep}

