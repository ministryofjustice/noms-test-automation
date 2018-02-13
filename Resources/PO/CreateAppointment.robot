*** Settings ***
Library  Selenium2Library
Resource  ../../Data/Global_Data.robot

*** Variables ***
${ADD_APPOINTMENT_LINK} =   //a[@href='/bookings/details/addAppointment'][contains(.//text(), 'Add appointment')]
${APPOINTMENT_TYPE_FIELD} =   name=appointmentType
${APPOINTMENT_LOCATION_FIELD} =   name=location
${APPOINTMENT_TYPE} =  //select[@name='appointmentType']/option[.='Dentist']
${APPOINTMENT_LOCATION} =  //select[@name='location']/option[.='HEALTHCARE']
${APPOINTMENT_DATE} =  //*[@id="app"]/div/main/div/div/form/div[6]/div/div/div/div[2]/div[1]/div/input
${CURRENT_DATE} =  //*[@id="app"]/div/main/div/div/form/div[6]/div/div/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]
${START_HOUR_FIELD} =
${START_HOUR} =  name=hours
${START_MINUTE} =
${END_HOUR} =
${END_MINUTE} =

${COMMENT_TEXT} =  name=comment

*** Keywords ***
Validate "Add appointment" Link
    Page Should Contain Element  ${ADD_APPOINTMENT_LINK}

Selects [Add appointment] Link
    Wait Until Keyword Succeeds  20  0  Click Element   ${ADD_APPOINTMENT_LINK}

Select "Type" Field
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${APPOINTMENT_TYPE_FIELD}

Select "Appointment Type" From Dropdown
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${APPOINTMENT_TYPE}

Select "Location" Field
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${APPOINTMENT_LOCATION_FIELD}

Select "Appointment Location" From Dropdown
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${APPOINTMENT_LOCATION}

Select 'Select date' field
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${APPOINTMENT_DATE}

Select current date
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${CURRENT_DATE}

Select start time [Hour]
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${START_HOUR}