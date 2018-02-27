*** Settings ***
Resource  ../../Data/Global_Data.robot

*** Variables ***
${ADD_APPOINTMENT_LINK} =   //a[@href='/bookings/details/addAppointment'][contains(.//text(), 'Add appointment')]
${ADD_APPOINTMENT_BUTTON} =   //button[contains(.//text(), ' Add appointment ')]
${APPOINTMENT_TYPE_FIELD} =   name=appointmentType
${APPOINTMENT_LOCATION_FIELD} =   name=location
${APPOINTMENT_TYPE} =  //select[@name='appointmentType']/option[.='Dentist']
${APPOINTMENT_LOCATION} =  //select[@name='location']/option[.='HEALTHCARE']
${START_HOUR_FIELD} =
${START_HOUR} =  name=hours
${START_MINUTE} =
${END_HOUR} =
${END_MINUTE} =
${ADD_New_APPOINTMENT_PAGE} =   //h1[contains(.//text(), 'Add new appointment')]
${COMMENT_TEXT} =  name=comment
${DATE_ERROR} =  //span[contains(.//text(), 'Please select a date')]
${TIME_ERROR} =  //span[contains(.//text(), 'Please select a start time')]
${APPOINTMENT_TYPE_ERROR} =  //span[contains(.//text(), 'Please select an appointment type')]
${LOCATION_ERROR} =  //span[contains(.//text(), 'Please select a location')]
${CANCEL_BUTTON} =  //button[contains(.//text(), ' Cancel')]

*** Keywords ***
Validate "Add appointment" Link
    Page Should Contain Element  ${ADD_APPOINTMENT_LINK}

Select "Add appointment" Link
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

Select "Add Appointment" Button
    Repeat Keyword  3   Press Key   ${ADD_APPOINTMENT_BUTTON}  \13
#    Execute Javascript  document.getElementById('${APPOINTMENT_BUTTON}').click();(); return ""

Check You are on "Add New Appointment" Page
    Wait Until Keyword Succeeds  10  0  Wait Until Page Contains Element   ${ADD_New_APPOINTMENT_PAGE}  timeout=1 minutes

Check No Date Error On The Page
    Wait Until Page Does Not Contain Element   ${DATE_ERROR}  timeout=1 minutes

Check No Time Error On The Page
    Wait Until Page Does Not Contain Element   ${TIME_ERROR}  timeout=1 minutes

Add Comment To "Appointment"
    [Arguments]  ${comment}
    Input Text  ${COMMENT_TEXT}  ${comment}

Check "Time" Error Displays
    Page Should Contain Element     ${TIME_ERROR}

Check "Date" Error Displays
    Page Should Contain Element     ${DATE_ERROR}

Add Appointment Button
    Press Key   ${ADD_APPOINTMENT_BUTTON}  \\13

Click "Cancel" Button
    Press Key   ${CANCEL_BUTTON}  \\13

Check "Appointment Type" Error Message Displays
    Page Should Contain Element     ${APPOINTMENT_TYPE_ERROR}

Check "Location" Error Message Displays
    Page Should Contain Element     ${LOCATION_ERROR}