*** Settings ***
Documentation    Checks to ensure a new appointment can be created.
Resource   ../Resources/PO/CreateAppointment.robot

*** Keywords ***

Admin User Logs Into [NOMIS]
    Login.Login Valid User

User Logs in Successfully
    Toolbar.Check User Is On The "Home" Page

Enters Offender's [Name] Into The [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${OFFENDER_HEADER_RECORD.name}

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

Validate [Add appointment] Link Is Available
    CreateAppointment.Validate "Add appointment" Link

Validate The [URL]
    ViewOffenderHeaderRecord.Check The URL

Select "Type" Field
    CreateAppointment.Select "Type" Field

Select Appointment Type
    CreateAppointment.Select "Appointment Type" From Dropdown

Select "Location" Field
    CreateAppointment.Select "Location" Field

Select Appointment location
    CreateAppointment.Select "Appointment Location" From Dropdown

Select Appointment Date
    CreateAppointment.Select 'Select date' field

#Select start time [Hour]
#    CreateAppointment.Select start time [Hour]