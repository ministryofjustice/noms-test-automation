*** Settings ***
Resource   ../Resources/Common.robot

*** Keywords ***

Admin User Logs Into [NOMIS]
    Login.Login Valid User

[Nomis] Home Page Displays
    Toolbar.Check User Is On The "Home" Page


Enters Offender's [Surname] Into The [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${SEARCH_RESULTS.offenderSurname}

Selects [Search] Button
    SearchOffenderRecords.Click "Search" Button

Selects [Offender]
    SearchOffenderResults.Select Offender "Alderton"

[Offender] Details Tab Displays
    SearchOffenderResults.Offender Details Tab Displays

