*** Settings ***
Documentation    Case Note creation tests
Resource  ../StepDefs/Create_Case_Note_Step_Def.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/01__Create_Case_Note.robot

*** Test Cases ***
Scenario 1: Check That Selecting [Add Case Note] Link Takes User To [Add New Case Note] Page
    [Tags]  [JIRA: EM-133] Regression
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    When [Offender] Details Tab Displays
    And Selects [Add Case Note] Link
    Then [Add New Case Note] Page Displays
    And Validate The [URL]

##TODO: Fix - check correct calendar is being used.
#Scenario 2: Validate User Can Create [Case Note] Successfully For [Current Day]
#    [Tags]  [JIRA: EM-133]
#    Given Admin User Logs Into [NOMIS]
#    And Enters Offender's [Name] Into The [Search] Field
#    When Selects [Search] Button
#    Then [Offender] Details Tab Displays
#    And Selects [Add Case Note] Link
#    Then [Add New Case Note] Page Displays
#    And Selects [General] from Dropdown Menu
#    And Selects [History Sheet Entry] from Dropdown Menu
#    Then Enters Case Note Text
#    And Sets [Time] By [Hour & Minutes]
#    And Selects [Save Case Note]
#    Then Check [Case Note] Tab Displays

##TODO: Re-write to check for error when attempting to create future case note.
#Scenario 3: Check User Can Create [Case Note] Successfully For [Future Date]
#    [Tags]  [JIRA: EM-133]
#    Given Admin User Logs Into [NOMIS]
#    And Enters Offender's [Name] Into The [Search] Field
#    When Selects [Search] Button
#    Then [Offender] Details Tab Displays
#    And Selects [Add Case Note] Link
#    Then [Add New Case Note] Page Displays
#    And Selects [General] from Dropdown Menu
#    And Selects [History Sheet Entry] from Dropdown Menu
#    Then Enters Case Note Text
#    When Sets Date To [Future Date]
#    And Sets [Time] By [Hour & Minutes]
#    And Selects [Save Case Note]
#    Then Check [Case Note] Tab Displays

###TODO: Fix - check correct calendar is being used.
#Scenario 4: Validate [Case Note] Can Be Created Successfully For [Previous Date]
#    [Tags]  [JIRA: EM-133]
#    Given Admin User Logs Into [NOMIS]
#    And Enters Offender's [Name] Into The [Search] Field
#    When Selects [Search] Button
#    Then [Offender] Details Tab Displays
#    And Selects [Add Case Note] Link
#    Then [Add New Case Note] Page Displays
#    And Selects [General] from Dropdown Menu
#    And Selects [History Sheet Entry] from Dropdown Menu
#    Then Enters Case Note Text
#    When Sets Date To [Previous Date]
#    And Sets [Time] By [Hour & Minutes]
#    And Selects [Save Case Note]
#    Then Check [Case Note] Tab Displays

Scenario 5: Check [Case Note] Cannot Be Created With Blank Mandatory Fields
    [Tags]  [JIRA: EM-133] Regression
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Offender] Details Tab Displays
    And Selects [Add Case Note] Link
    Then [Add New Case Note] Page Displays
    When Selects [Save Case Note]
    Then Check Error Message Is Shown


