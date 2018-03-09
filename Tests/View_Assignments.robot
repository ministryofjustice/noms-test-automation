*** Settings ***
Documentation    As a prison officer, i want to view assignments assigned to me
                 ...  so that i can see my worklist in a tip of my finger.
Resource  ../StepDefs/View_Assignments_Step_Def.robot
Resource  ./../Resources/Common.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/View_Assignments.robot

*** Test Cases ***

Scenario 1: Check [View Assignments] Section Is Available On The Home Page After Successful Login
    [Tags]  [JIRA: EM-143]  Smoke  Regression
    Given Keyworker User Logs Into [NOMIS]
    When [Nomis] Home Page Displays
    Then Check That [View Assignments] Section Is Available

Scenario 2: Check [Key Worker] Link Is Available On The Home Page After Successful Login
    [Tags]  [JIRA: EM-143]  Smoke  Regression
    Given Keyworker User Logs Into [NOMIS]
    When [Nomis] Home Page Displays
    Then Check That [As Key Worker] Link Is Available

Scenario 3: Validate That Selecting [As Key Worker] Link Takes The User To [Assignments] Page
    [Tags]  [JIRA: EM-143]  Smoke  Regression
    Given Keyworker User Logs Into [NOMIS]
    When [Nomis] Home Page Displays
    And Selects [As Key Worker] Link
    Then Check That [Assignments] Page Is Displays
    And [Key Worker] Full Name Displays

Scenario 4: Validate The Static Table Available On [Assignments] Page
    [Tags]  [JIRA: EM-143]  Regression
    Given Keyworker User Logs Into [NOMIS]
    When [Nomis] Home Page Displays
    And Selects [As Key Worker] Link
    Then Check That [Assignments] Page Is Displays
    And Validate The Static Table Column Headers

Scenario 5: Check The [Grid & List] Toggle Links Available On [Assignments] Page
    [Tags]  [JIRA: EM-143]  Regression
    Given Keyworker User Logs Into [NOMIS]
    When [Nomis] Home Page Displays
    And Selects [As Key Worker] Link
    Then Check That [Assignments] Page Is Displays
    And Check [Grid & List] Toggle Links Are Available