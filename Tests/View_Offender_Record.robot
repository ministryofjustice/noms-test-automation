*** Settings ***
Documentation    As an officer, i want to view offender's record
                 ...  so that i can have great plan of approaching the offender.
Resource  ../StepDefs/View_Offender_Record_Step_Def.robot
Resource  ./../Resources/Common.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/View_Offender_Record.robot

*** Test Cases ***
Scenario 1: Check That User Can [View Offender Record] Page After Successful Login
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]
    When [Nomis] Home Page Displays
    And Enters Offender's [Surname] Into The [Search] Field
    When Selects [Search] Button
    And Selects [Offender]
    Then [Offender] Details Tab Displays

Scenario 2: Validate The [Table Header Details] On [Offender Details] Page
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]

