*** Settings ***
Documentation    Login Validation Tests
Resource  ../StepDefs/Login_Validation_Step_Def.robot
Resource  ./../Resources/Common.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Login_Validation.robot

*** Test Cases ***

Scenario 1: Validate that User Cannot Login Into [Nomis] With Incorrect Credentials
    [Tags]  [JIRA: EA-7]
    Given User Enters Incorrect Credentials To Login Into [NOMIS]
    When User Selects Submit Button
    Then Check User Is Not Allowed Access And An Error Message Is Displayed

Scenario 2: Ensure that User Cannot Login Into [Nomis] Without Credentials
    [Tags]  [JIRA: EA-7]
    Given User Attempts To Login Into [NOMIS] Without Credentials
    When User Selects Submit Button
    Then Check That Fields Are Highlighted As Required

Scenario 3: Check [Admin] User Can Login Into [Nomis] Successfully With Correct Credentials
    [Tags]  [JIRA: EA-7]
    Given Admin User Logs Into [NOMIS]
    When User Selects Submit Button
    Then Check That User Logs in Successfully

Scenario 4: Validate that User Cannot Login Into [Nomis] With Valid "Username" & Incorrect "Password"
    [Tags]  [JIRA: EA-7]
    Given User Attempts To Login With Valid [Username] & Invalid [Password]
    When User Selects Submit Button
    Then Check User Is Not Allowed Access And An Error Message Is Displayed