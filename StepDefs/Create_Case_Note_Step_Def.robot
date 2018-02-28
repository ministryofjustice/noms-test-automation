*** Settings ***
Documentation    Checks to ensure a new case note can be created.
Resource  ./../Resources/Common.robot

*** Keywords ***

Admin User Logs Into [NOMIS]
    Login.Login Valid User

User Logs in Successfully
    Toolbar.Check User Is On The "Home" Page

Selects [Search] Button
    SearchOffenderRecords.Click "Search" Button

Check That [Search Results] Page Displays
    SearchOffenderResults.Offender Search Results Page Displays

Validate The Table Column Headers On [Search Results] Page
    SearchOffenderResults.Check The Table Column Headers Are Correct       Name              ID      IEP   Age  Location
    SearchOffenderResults.Check The Table Column Headers Are Correct    ${SEARCH_RESULTS.a}  A1476AE  Standard  28  COURT

Selects [Offender]
    SearchOffenderResults.Select Offender "Alderton"

[Personal] Details Tab Displays
    SearchOffenderResults.Personal Details Tab Displays

Validate [Add Case Note] Link Is Available
    ViewOffenderHeaderRecord.Check "Add Case Note" Is Available

Enters Offender's [Name] Into The [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${OFFENDER_HEADER_RECORD.name}

[Offender] Details Tab Displays
    SearchOffenderResults.Personal Details Page Displays

[Add Appointment] Link Is On The Page
    ViewOffenderHeaderRecord.Check "Add Appointment" Link Is Available

[Add New Case Note] Page Displays
    ViewOffenderHeaderRecord.Check You Are On "Add Case Note" Page

Validate The [URL]
    ViewOffenderHeaderRecord.Check The URL

Selects [Add Case Note] Link
    ViewOffenderHeaderRecord.Select "Add Case Note" Link

Selects [Type] From Dropdown Menu
    CreateCaseNote.Select "Type" From Dropdown

Selects [General] From Dropdown Menu
    CreateCaseNote.Select "General" From Dropdown

Selects [SubType] From Dropdown Menu
    CreateCaseNote.Select "SubType" From Dropdown

Selects [History Sheet Entry] From Dropdown Menu
    CreateCaseNote.Select "History Sheet Entry" From Dropdown

Enters Case Note Text
    CreateCaseNote.Enter Case Note Text     ${CASE_NOTE_TEXTS.new}

Selects [Save Case Note]
    CreateCaseNote.Save Case Note

Sets [Time] By [Hour & Minutes]
    CreateCaseNote.Get Current Hour

Sets Date To [Future Date]
    CreateCaseNote.Get 3 Days In The Future

Check [Case Note] Tab Displays
    OffenderRecordTabs.Check "Case Notes" Tab Displays

Sets Date To [Previous Date]
    CreateCaseNote.Get 2 Days In The Past

Check Error Message Is Shown
    CreateCaseNote.Check "Case Note" Error Message
