*** Settings ***
Documentation    As a prison officer, i want to search for offenders
                 ...  so that i know who the prisoners are.
Resource  ../StepDefs/Search_Offender_Records_Step_Def.robot

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

##TODO: The scenario below could possibly be a bug. Team to confirm
#Scenario 4: Check That No Record Is Returned When [Search] For Offender With "#" Character
#    [Tags]  [JIRA: EA-8]
#    Given Admin User Logs Into [NOMIS]
#    When Enters [#] Character Into [Search] Field
#    And Selects [Search] Button
#    Then Check That Offenders List Is Not Returned

Scenario 5: Check All Records Returned When [Search] For Offender With no Data In Search Box But With Specific [Location]
    [Tags]  [JIRA: EA-8]
    Given Admin User Logs Into [NOMIS]
    When Selects [Leeds] From Location Dropdown Menu
    And Selects [Search] Button
    Then Check That Offenders List Is Returned

Scenario 6: Validate That Personal Details Page Displays When Search By Offender's [Surname]
    [Tags]  [JIRA: EA-8]
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [Surname] Into The [Search] Field
    And Selects [Search] Button
    Then Check That Personal's Details Page Displays

Scenario 7: Check That No Record Is Returned When Search By Offender's [First Name]
    [Tags]  [JIRA: EA-8]
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [First Name] Into The [Search] Field
    And Selects [Search] Button
    Then Check That No Matching Record Message Is Returned

Scenario 8: Check [404] Status Code Is Returned When [Search] For Offender With Invalid Data "+" Regardless Of [Location]
    [Tags]  [JIRA: EA-8]
    Given Admin User Logs Into [NOMIS]
    When Enters [+] Into The [Search] Field
    And Selects [Leeds] From Location Dropdown Menu
    When Selects [Search] Button
    Then Check That [404] Error Status Code Is Returned

Scenario 9: Validate [Personal Details] Page Returns When Search By Offender's Valid [Surname] At A Specific [Location]
    [Tags]  [JIRA: EA-8]
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [Surname] Into The [Search] Field
    And Selects [Leeds] From Location Dropdown Menu
    When Selects [Search] Button
    Then Check That Personal's Details Page Displays