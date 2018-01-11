*** Settings ***
Documentation    As a prison officer, i want to search for offenders
                 ...  so that i know who the prisoners are.
Resource  ../StepDefs/Search_Offender_Records_Step_Def.robot
Resource  ./../Resources/Common.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Search_Offender_Records.robot

*** Test Cases ***

Scenario 1: Check [Search] Field Is Available For User To Search For Offender After Successful Login
    [Tags]  [JIRA: EA-8]
    Given Admin User Logs Into [NOMIS]
    When [Nomis] Home Page Displays
    Then Check That [Search] Field Is Available

Scenario 2: Validate That No Record Is Returned When [Search] For Offender With Invalid "*" Character
    [Tags]  [JIRA: EA-8]
    Given Admin User Logs Into [NOMIS]
    When Enters [*] Character Into [Search] Field
    And Selects [Search] Button
    Then Check That No Matching Record Message Is Returned

Scenario 3: Validate That No Record Is Returned When [Search] For Offender With Invalid "%" Character
    [Tags]  [JIRA: EA-8]
    Given Admin User Logs Into [NOMIS]
    When Enters [%] Character Into [Search] Field
    And Selects [Search] Button
    Then Check That [400] Error Status Code Is Returned

Scenario 4: Check That All Records Are Returned When [Search] For Offender With Invalid "#" Character
    [Tags]  [JIRA: EA-8]
    Given Admin User Logs Into [NOMIS]
    When Enters [#] Character Into [Search] Field
    And Selects [Search] Button
    Then C
