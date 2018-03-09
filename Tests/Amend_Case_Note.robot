*** Settings ***
Documentation    Amend Case Note Created Tests
Resource  ../StepDefs/Amend_Case_Note_Step_Def.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Amend_Case_Note.robot

*** Test Cases ***
Scenario 1: Check That Created [Case Note] Exists
    [Tags]  [JIRA: EM-133] Regression
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    Then [Offender] Details Tab Displays
    And Selects [Case Note] Tab
    Then Check [Case Note] Tab Displays
    And Check Initial [Case Note] Created
    When Selects [Case Note] Created
    And Check [Make Amendment] Button Is Available

Scenario 2: Check User Can Amend Created [Case Note] Successfully
    [Tags]  [JIRA: EM-133] Regression
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    Then [Offender] Details Tab Displays
    And Selects [Case Note] Tab
    Then Check [Case Note] Tab Displays
    When Selects [Case Note] Created
    And Selects [Make Amendment] Button
    Then [Amend Case Note] Page Displays
    When Amend [Case Note] Comment
    And Selects [Save Amendment] Button
    Then Check [Case Note] Tab Displays
    And Amended [Case Note] Displays
    Then Check Initial [Case Note] Created
