*** Settings ***
Documentation    As a prison officer, i want to see search results page when i search for offenders
                 ...  so that i know who the prisoners are.

Resource   ../Resources/Common.robot

*** Keywords ***

Admin User Logs Into [NOMIS]
    Login.Login Valid User

Selects [Search] Button
    SearchOffenderRecords.Click "Search" Button

Check That [Search Results] Page Displays
    SearchOffenderResults.Offender Search Results Page Displays

Validate The Table Column Headers On [Search Results] Page
    SearchOffenderResults.Check The Table Column Headers Are Correct       Name              ID      IEP   Age  Location
    SearchOffenderResults.Check The Table Column Headers Are Correct    ${SEARCH_RESULTS.a}  A1476AE  Standard  28  COURT

User Logs in Successfully
    Toolbar.Check User Is On The "Home" Page

Selects [Offender]
    SearchOffenderResults.Select Offender "Alderton"

Offender [Personal Details] Page Displays
    SearchOffenderResults.Personal Details Page Displays

Selects [Grid] View Option
    SearchOffenderResults.Select "Grid" View

Check That [Sort By Name] Option Displays
    SearchOffenderResults.Sort By Names Displays

Selects [List] View Option
    SearchOffenderResults.Select "List" View

Validate [Sort By Name] Option Is No Longer Display
    SearchOffenderResults.Sort By Names No Longer Display

Home Page Displays If Breadcrumb Is Selected
    Toolbar.Select The "Home" Link
    Toolbar.Check User Is On The "Home" Page