*** Settings ***
Resource   ../Resources/Common.robot

*** Keywords ***

Admin User Logs Into [NOMIS]
    Login.Login Valid User

[Nomis] Home Page Displays
    Toolbar.Check User Is On The "Home" Page

Check That [View Assignments] Section Is Available
    ViewAssignments.View Assignments Section Displays

Check That [As Key Worker] Link Is Available
    ViewAssignments.As Key Worker Link Is Available

Selects [As Key Worker] Link
    ViewAssignments.Click "As Key Worker" Link

Check That [Assignments] Page Is Displays
    ViewAssignments.Check 'Assignments' Page Displays

[Key Worker] Full Name Displays
    ViewAssignments.Check Worker Full Name Displays On The Page

Validate The Static Table Column Headers
    SearchOffenderResults.Check The Table Column Headers Are Correct   Name  ID  IEP   Age  Location

Check [Grid & List] Toggle Links Are Available
    SearchOffenderResults.Check "Grid" Toggle Link Is Available
    SearchOffenderResults.Check "List" Toggle Link Is Available
