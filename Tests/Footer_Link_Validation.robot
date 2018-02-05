*** Settings ***
Documentation    Check that footer links are present and return the correct information
Resource  ../StepDefs/View_Offender_Record_Step_Def.robot
Resource  ./../Resources/Common.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Footer_Link_Validation.robot

*** Test Cases ***
Check for presence of page elements
    [Tags]  [JIRA: EM-299]
    Given user is on [NOMIS]
    Then Check That [T's and C's link] Section Is Available

#Scenario 2: Check T's & C's Link
#    [Tags]  [JIRA: EM-299]
#    Given user is on [NOMIS]
#    And [T's and C's link] is present
#    When user selects [T's and C's link] link
#    Then a pop up window is returned clarifying the user's T's & C's
#    And ... content includes?..
#
