*** Settings ***





*** Variables ***
${BOOKING_DETAILS_PAGE}       https://notm-dev.hmpps.dsd.io/bookings/details/username=ZHAMMED&password=password123
${BOOKING_HEADER_DETAILS}       //div[@class=('header-details')]



*** Keywords ***


Check Table Header Details
    [Arguments]  ${prisoner_name}  ${prison_no}  ${iep}  ${alerts}  ${location}  ${key_worker}
	Wait Until Keyword Succeeds  10  0  Page Should Contain Element  ${BOOKING_HEADER_DETAILS}

Second keyword
    Do more
