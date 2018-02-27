*** Settings ***
Documentation    Appointment creation tests
Resource  ../StepDefs/Create_Appointment_Step_Def.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Create_Appointment.robot

*** Test Cases ***
Scenario 1: Validate That [Appointment] Can Be Created For [7 Days] In The Future
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Tab Displays
    When Selects [Add appointment] Link
    Then Check [Add New Appointment] Page Displays
    When Select [Type] Field
    And Select Appointment Type
    When Selects [Location] Field
    Then Select Appointment location
    When Sets [Appointment] Date To [7 Days] In The Future
    And Sets Appointment [Time] By [Hour & Minutes]
    When Adds [Comment]
    And Selects [Add Appointment] Button
    Then Validate The Appointment Is Created Successfully

Scenario 2: Check User Cannot Submit [Appointment] With Blank Form
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Tab Displays
    When Selects [Add appointment] Link
    Then Check [Add New Appointment] Page Displays
    When Selects Add Appointment Button To Submit The Form
    Then Check That [Appointment] Is Not Created

Scenario 3: Validate [Appointment] Form Cannot Be Submitted With Blank Mandatory Fields
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Tab Displays
    When Selects [Add appointment] Link
    Then Check [Add New Appointment] Page Displays
    When Selects Add Appointment Button To Submit The Form
    Then Check [Appointment Type] Error Message Is Thrown
    And [Location] Error Message Displays
    Then Check That [Appointment] Is Not Created

Scenario 4: Check Selecting [Cancel] Button Returns User To [Personal Details] Page
    [Tags]  [JIRA: EM-133]  Smoke
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Tab Displays
    When Selects [Add appointment] Link
    Then Check [Add New Appointment] Page Displays
    When [Cancel] Button Is Selected
    Then [Personal] Details Tab Displays

Scenario 5: Validate That [Appointment] Can Be Created For [8 Days] In The Future
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Tab Displays
    When Selects [Add appointment] Link
    Then Check [Add New Appointment] Page Displays
    When Select [Type] Field
    And Select Appointment Type
    When Selects [Location] Field
    Then Select Appointment location
    And Sets [Appointment] Date To [8 Days] In The Future
    When Adds [Comment]
    And Sets Appointment [Time] By [Hour & Minutes]
    When Selects [Add Appointment] Button
    Then Validate The Appointment Is Created Successfully

Scenario 6: Check [Appointment] Can Be Created For [14 Days] In The Future
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Tab Displays
    When Selects [Add appointment] Link
    Then Check [Add New Appointment] Page Displays
    When Select [Type] Field
    And Select Appointment Type
    When Selects [Location] Field
    Then Select Appointment location
    And Sets [Appointment] Date To [14 Days] In The Future
    When Adds [Comment]
    And Sets Appointment [Time] By [Hour & Minutes]
    When Selects [Add Appointment] Button
    Then Validate The Appointment Is Created Successfully

Scenario 7: Check [Appointment] Can Be Created For Current Date [Today]
    [Tags]  [JIRA: EM-133]  Smoke
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Tab Displays
    When Selects [Add appointment] Link
    Then Check [Add New Appointment] Page Displays
    When Select [Type] Field
    And Select Appointment Type
    When Selects [Location] Field
    Then Select Appointment location
    And Sets [Appointment] Date To [Current Day]
    When Adds [Comment]
    And Sets Appointment [Time] By [Hour & Minutes]
    When Selects [Add Appointment] Button
    Then Validate The Appointment Is Created Successfully