*** Settings ***
Resource  ./../Resources/Common.robot


*** Keywords ***

Admin User Logs Into [NOMIS]
    Login.Login Valid User

Enters Offender's [Name] Into The [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${OFFENDER_HEADER_RECORD.name}

Selects [Search] Button
    SearchOffenderRecords.Click "Search" Button

[Offender] Details Tab Displays
    SearchOffenderResults.Personal Details Page Displays

Selects [Case Note] Tab
    OffenderRecordTabs.Select "Case Notes" Tab

Check [Case Note] Tab Displays
    OffenderRecordTabs.Check "Case Notes" Tab Displays

Selects [Case Note] Created
    AmendCaseNote.Click "Created" Case Note

Check Initial [Case Note] Created
    AmendCaseNote.Check Created Case Note Exists

Check [Make Amendment] Button Is Available
    AmendCaseNote.Check "Make Amendment" Button

Selects [Make Amendment] Button
    AmendCaseNote.Click "Make Amendment" Button

[Amend Case Note] Page Displays
    AmendCaseNote.Check You Are On "Amend Case Note" Page

Amend [Case Note] Comment
    AmendCaseNote.Amend "Case Note"     ${CASE_NOTE_TEXTS.edit}

Selects [Save Amendment] Button
    AmendCaseNote.Click "Save Amendment" Button

Amended [Case Note] Displays
    AmendCaseNote.Check "Amended Case Note" Displays


