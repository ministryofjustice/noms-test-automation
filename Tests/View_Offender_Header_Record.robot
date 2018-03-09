*** Settings ***
Documentation    As an officer, i want to view offender's record
                 ...  so that i can have great plan of approaching the offender.
Resource  ../StepDefs/View_Offender_Header_Record_Step_Def.robot
Resource  ./../Resources/Common.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/View_Offender_Header_Record.robot

*** Test Cases ***
Scenario 1: Check That User Can [View Offender Record] Page After Successful Login
    [Tags]  [JIRA: EM-133]  Smoke  Regression
    Given Admin User Logs Into [NOMIS]
    When [Nomis] Home Page Displays
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Page Displays

Scenario 2: Validate The [Table Header Details] On [Offender Details] Page
    [Tags]  [JIRA: EM-133]  Regression
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    When [Personal] Details Page Displays
    Then Validate The Offender [Header Details Record]

Scenario 3: Check [Table Header Details] For Offender With [No Keyworker] Assigned
    [Tags]  [JIRA: EM-133]  Regression
    Given Admin User Logs Into [NOMIS]
    When Enters No Keyworker Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    When [Personal] Details Page Displays
    Then Check No Keyworker Assigned To Offender

Scenario 4: Check The [Add Case Note & Add Appointment] Links Are On [Offender Details] Page
    [Tags]  [JIRA: EM-133]  Smoke  Regression
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    When [Personal] Details Page Displays
    Then Validate [Add Case Note] Link Is Available
    And [Add Appointment] Link Is On The Page

Scenario 5: Check That Selecting [Add Case Note] Link Takes User To [Add New Case Note] Page
    [Tags]  [JIRA: EM-133]  Smoke  Regression
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    When [Personal] Details Page Displays
    And Selects [Add Case Note] Link
    Then [Add New Case Note] Page Displays
    And Validate The [URL]