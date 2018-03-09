*** Settings ***
Documentation    Check that footer links are present and return the correct information
Resource  ../StepDefs/Footer_Link_Validation_Step_Def.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Footer_Link_Validation.robot

*** Test Cases ***
Check for presence of page elements
    [Tags]  [JIRA: EM-299]
    Given user is on [NOMIS]
    Then Check [T's and C's link] is present

Scenario 2: Check T's & C's Link
    [Tags]  [JIRA: EM-299]
    Given user is on [NOMIS]
    And Check [T's and C's link] is present
    When user selects [T's and C's link]
    Then Check T's & C's page appears
#    And ... content includes?..
