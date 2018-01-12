*** Settings ***
Documentation    As a prison officer, i want to search for offenders
                 ...  so that i know who the prisoners are.

Resource   ../Resources/Common.robot


*** Keywords ***
Admin User Logs Into [NOMIS]
    Login.Login Valid User

Check That [Search] Field Is Available
    SearchOffenderRecords.Search Field Is Available

[Nomis] Home Page Displays
    Toolbar.Check User Is On The "Home" Page

Enters [*] Character Into [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${SEARCH_VALUES.a}

Selects [Search] Button
    SearchOffenderRecords.Click "Search" Button

Check That No Matching Record Message Is Returned
    LoginPage.Wait For Page Ready     ${NO_MATCHING_RECORD}
    SearchOffenderRecords.No Matching Message Displays

Enters [%] Character Into [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${SEARCH_VALUES.b}

Check That [400] Error Status Code Is Returned
    SearchOffenderRecords.Error "400" Status Code Displays

Enters [#] Character Into [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${SEARCH_VALUES.c}

Check That Offenders List Is Returned
    SearchOffenderRecords.Search "Result" Returned With Offender
    SearchOffenderRecords.Second Offender Search "Result" In The List

Selects [Leeds] From Location Dropdown Menu
    SearchOffenderRecords.Select "Location" Dropdown
    SearchOffenderRecords.Select "LEEDS" From Dropdown

Enters Offender's [Surname] Into The [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${SEARCH_RESULTS.offenderSurname}

Check That Offender's Details Page Displays
    SearchOffenderRecords.Offender Details Page Displays

Enters Offender's [First Name] Into The [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${SEARCH_RESULTS.offenderFirstName}

Enters [+] Into The [Search] Field
    LoginPage.Wait For Page Ready     ${SEARCH_BOX}
    SearchOffenderRecords.Enter Search Value  ${SEARCH_VALUES.d}

Check That [404] Error Status Code Is Returned
    SearchOffenderRecords.Error "404" Status Code Displays