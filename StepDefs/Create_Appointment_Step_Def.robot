*** Settings ***
Documentation    Checks to ensure a new appointment can be created.
Resource  ./../Resources/Common.robot

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

Selects [Offender]
    SearchOffenderResults.Select Offender "Alderton"

[Personal] Details Tab Displays
    SearchOffenderResults.Personal Details Page Displays

Validate [Add appointment] Link Is Available
    CreateAppointment.Validate "Add appointment" Link

Validate The [URL]
    ViewOffenderHeaderRecord.Check The URL

Select [Type] Field
    CreateAppointment.Select "Type" Field

Select Appointment Type
    CreateAppointment.Select "Appointment Type" From Dropdown

Selects [Location] Field
    CreateAppointment.Select "Location" Field

Select Appointment location
    CreateAppointment.Select "Appointment Location" From Dropdown

Sets [Appointment] Date To [7 Days] In The Future
    CreateAppointment.Go To 7 Days In The Future

Check [Add New Appointment] Page Displays
    CreateAppointment.Check You are on "Add New Appointment" Page

Sets Appointment [Time] By [Hour & Minutes]
    CreateAppointment.Get Hour
    CreateAppointment.Get Minute

Selects [Add Appointment] Button
    CreateAppointment.Select "Add Appointment" Button

Validate The Appointment Is Created Successfully
    CreateAppointment.Check No Date Error On The Page
    CreateAppointment.Check No Time Error On The Page
    Capture

Selects [Add appointment] Link
    CreateAppointment.Select "Add appointment" Link

Adds [Comment]
    CreateAppointment.Add Comment To "Appointment"  ${OFFENDER_HEADER_RECORD.name}

Check That [Appointment] Is Not Created
    CreateAppointment.Check "Time" Error Displays
    CreateAppointment.Check "Date" Error Displays

Selects Add Appointment Button To Submit The Form
    CreateAppointment.Add Appointment Button
    Capture

Check [Appointment Type] Error Message Is Thrown
    CreateAppointment.Check "Appointment Type" Error Message Displays

[Location] Error Message Displays
    CreateAppointment.Check "Location" Error Message Displays

[Cancel] Button Is Selected
    CreateAppointment.Click "Cancel" Button

Sets [Appointment] Date To [8 Days] In The Future
    CreateAppointment.Go To 8 Days In The Future

Sets [Appointment] Date To [14 Days] In The Future
    CreateAppointment.Go To 14 Days In The Future

Sets [Appointment] Date To [Current Day]
    CreateAppointment.Set To Today's Date



