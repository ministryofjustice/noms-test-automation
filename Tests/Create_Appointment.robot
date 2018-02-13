*** Settings ***
Documentation    Appointment creation tests
Resource  ../StepDefs/Create_Appointment_Step_Def.robot
Resource  ./../Resources/Common.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

#  pybot -d Results Tests/Create_Appointment.robot

*** Test Cases ***
Create an appointment with valid details
    [Tags]  [JIRA: EM-133]
    Given Admin User Logs Into [NOMIS]
    And Enters Offender's [Name] Into The [Search] Field
    When Selects [Search] Button
    Then [Personal] Details Tab Displays
    And Selects [Add appointment] Link
    Then Validate The [URL]
    And Select Appointment Type
    Then Select Appointment location
    And Select Appointment Date
    THEN Select current date
#    AND Select start time [Hour]

#    And selects [Add appointment]