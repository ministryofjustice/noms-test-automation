*** Settings ***
Resource   ../Resources/Common.robot

*** Keywords ***

Admin User Logs Into [NOMIS]
    Login.Login Valid User

[Nomis] Home Page Displays
    Toolbar.Check User Is On The "Home" Page


Enters Offender's [Name] Into The [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${OFFENDER_HEADER_RECORD.name}

Selects [Search] Button
    SearchOffenderRecords.Click "Search" Button

Selects The [Offender]
    ViewOffenderHeaderRecord.Select The "Offender"

[Offender] Details Tab Displays
    SearchOffenderResults.Offender Details Tab Displays

Validate The Offender [Header Details Record]
    ViewOffenderHeaderRecord.Check Table Header Details   ${OFFENDER_HEADER_RECORD.prisonerNo}   ${OFFENDER_HEADER_RECORD.keyWorker}
    ...     ${OFFENDER_HEADER_RECORD.name}  ${OFFENDER_HEADER_RECORD.iep}  ${OFFENDER_HEADER_RECORD.alerts}  ${OFFENDER_HEADER_RECORD.location}


Validate [Add Case Note] Link Is Available
    ViewOffenderHeaderRecord.Check "Add Case Note" Is Available

[Add Appointment] Link Is On The Page
    ViewOffenderHeaderRecord.Check "Add Appointment" Link Is Available

Selects [Add Case Note] Link
    ViewOffenderHeaderRecord.Select "Add Case Note" Link

[Add New Case Note] Page Displays
    ViewOffenderHeaderRecord.Check You Are On "Add Case Note" Page

Validate The [URL]
    ViewOffenderHeaderRecord.Check The URL