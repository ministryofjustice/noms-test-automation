*** Settings ***
Library  Selenium2Library
Resource  ../../Data/Global_Data.robot

*** Variables ***
${BOOKING_HEADER_DETAILS}       //div[@class=('header-details')]
${KEY_WORKER}       //div[contains(.//text(), 'Key worker')]/b/span[contains(.//text(), '')]
${OFFENDER} =   //span[contains(.//text(), '${OFFENDER_HEADER_RECORD.name}')]/div/span
${ADD_CASE_NOTE_LINK} =   //a[@href='/bookings/details/addCaseNote'][contains(.//text(), 'Add case note')]
${ADD_APPOINTMENT_LINK} =   //div[2]/a[@href='/bookings/details/addAppointment'] [contains(.//text(), 'Add appointment')]
${ADD_CASE_NOTE_PAGE} =   //h1[contains(.//text(), 'Add new case note')]
${PAGE_URL}     https://notm-dev.hmpps.dsd.io/bookings/details/addCaseNote

*** Keywords ***

Check Table Header Details
    [Arguments]  ${prisoner_name}  ${prison_no}  ${iep}  ${alerts}  ${location}  ${key_worker}
	Page Should Contain Element  ${BOOKING_HEADER_DETAILS}

Get Key Worker Name
    ${key_worker_name} =  Get Text     ${KEY_WORKER}
    Log To Console  ${key_worker_name}
    Set Suite Variable  ${key_worker_name}

Select The "Offender"
    Wait Until Keyword Succeeds  10  0  Click Element  ${OFFENDER}


Check "Add Case Note" Is Available
	Page Should Contain Element  ${ADD_CASE_NOTE_LINK}

Check "Add Appointment" Link Is Available
	Page Should Contain Element  ${ADD_APPOINTMENT_LINK}

Select "Add Case Note" Link
    Wait Until Keyword Succeeds  10  0  Click Element  ${ADD_CASE_NOTE_LINK}

Check You Are On "Add Case Note" Page
	Page Should Contain Element  ${ADD_CASE_NOTE_PAGE}

Check The URL
    ${current_url} =  Get Location
    Run Keyword If  "${current_url}" == "${PAGE_URL}"   Log  ${current_url}
