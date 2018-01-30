*** Settings ***
Documentation    As a prison officer, i want to see search results page when i search for offenders
                 ...  so that i know who the prisoners are.
Resource  ../StepDefs/Search_Offender_Result_Step_Def.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Search_Offender_Result.robot

*** Test Cases ***

Scenario 1: Check [Search Results] Page Displays When Search For Offenders
    [Tags]  [JIRA: EA-8]    [JIRA: EM-79]
    Given Admin User Logs Into [NOMIS]
    When User Logs in Successfully
    And Selects [Search] Button
    Then Check That [Search Results] Page Displays


#Scenario 2: Validate The Static Table Column Headers Are Correct On [Search Results] Page
#    [Tags]  [JIRA: EA-8]    [JIRA: EM-79]
#    Given Admin User Logs Into [NOMIS]
#    When User Logs in Successfully
#    And Selects [Search] Button
#    Then Validate The Table Column Headers On [Search Results] Page
#
#Scenario 3: Validate The [Grid & List] View Functions
#    [Tags]  [JIRA: EA-8]    [JIRA: EM-79]
#    Given Admin User Logs Into [NOMIS]
#    When User Logs in Successfully
#    And Selects [Search] Button
#    When Selects [Grid] View Option
#    Then Check That [Sort By Name] Option Displays
#    And Selects [List] View Option
#    Then Validate [Sort By Name] Option Is No Longer Display
#    And Home Page Displays If Breadcrumb Is Selected
#
#Scenario 4: Check That Selecting An Offender Takes User To Offender Details Tab
#    [Tags]  [JIRA: EA-8]    [JIRA: EM-79]
#    Given Admin User Logs Into [NOMIS]
#    When User Logs in Successfully
#    And Selects [Search] Button
#    When Selects [Offender]
#    Then [Offender] Details Tab Displays

