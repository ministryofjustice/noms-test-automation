*** Settings ***
Documentation    Case Note creation tests
Resource  ../StepDefs/create_case_note_Step_Def.robot
Resource  ./../Resources/Common.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Create_Case_Note.robot

*** Test Cases ***
Check That Selecting [Add Case Note] Link Takes User To [Add New Case Note] Page
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]
    When Enters Offender's [Name] Into The [Search] Field
    And Selects [Search] Button
    When [Offender] Details Tab Displays
    And Selects [Add Case Note] Link
    Then [Add New Case Note] Page Displays
    And Validate The [URL]

Create a case note with valid details
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Offender] Details Tab Displays
    And Selects [Add Case Note] Link
    Then [Add New Case Note] Page Displays
    And Validate The [URL]
    Then Selects [General] from Dropdown Menu
    And Selects [History Sheet Entry] from Dropdown Menu
    Then Enters case note text
#    And Selects [Edit] link
#    Then Selects [Occurrence Date]
    And Selects [Save case note]
    Then Validate The [URL]
#    Then Validate case note text is present

