*** Settings ***
Documentation    As an officer, i want to be able to see all available tabs once i am on offender's personal page,
                 ...  so that i can access them easily.
Resource  ../StepDefs/Offender_Record_Tabs_Step_Def.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Offender_Record_Tabs.robot


*** Test Cases ***

Scenario 1: Validate [Personal Details] Tab & It's Contents
    [Tags]  [JIRA: EM-]
    Given Keyworker Logs Into [NOMIS]
    When [Nomis] Home Page Displays
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Page Displays
    And Offender Full Personal Details Displays

Scenario 2: Check Both [Add Case Note & Add Appointment] Always Available For All The Tabs
    Given Keyworker Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    Then [Personal] Details Page Displays
    And Validate Both [Add Case Note] & [Add Appointment] Links Available
    When Selects [Quick Look] Tab
    Then Validate Both [Add Case Note] & [Add Appointment] Links Available
    And Selects [Alerts] Tab
    Then Validate Both [Add Case Note] & [Add Appointment] Links Available
    When Selects [Case Notes] Tab
    Then Validate Both [Add Case Note] & [Add Appointment] Links Available
    And Selects [Key Dates] Tab
    Then Validate Both [Add Case Note] & [Add Appointment] Links Available

Scenario 3: Validate The [Quick Look] Tab & Its Contents
    Given Keyworker Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    Then [Personal] Details Page Displays
    When Selects [Quick Look] Tab
    And Validate [Offence] & [Money] Details

Scenario 4: Check The [Alert] Tab & Its Contents
    Given Keyworker Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    Then [Personal] Details Page Displays
    When Selects [Alerts] Tab
    Then Check Informations Available Under [Alerts] Tab

Scenario 5: Validate The [Case Notes] Tab & Its Contents
    Given Keyworker Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    Then [Personal] Details Page Displays
    When Selects [Case Notes] Tab
    Then Validate [Case Notes] Tab Filter Header

Scenario 6: Check The [Key Dates] Tab & Its Contents
    Given Keyworker Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    Then [Personal] Details Page Displays
    When Selects [Key Dates] Tab
    Then Check [Key Notes] Tab Information


