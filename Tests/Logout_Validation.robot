*** Settings ***
Documentation    Login Validation Tests
Resource  ../StepDefs/Logout_Validation_Step_Def.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Logout_Validation.robot

*** Test Cases ***

Scenario 1: Check User Can Logout Of [Nomis] After Been Logged In Successfully With Correct Credentials
    [Tags]   Smoke
    Given Admin User Logs Into [NOMIS]
    When User Selects Submit Button
    Then Check That User Logs in Successfully
    When Selects Breadcrumb
    And Selects [Logout] Button
    Then Check That [Signin] Page Displays
