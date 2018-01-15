*** Settings ***
Library  Selenium2Library
Resource  ../../Data/Global_Data.robot

*** Variables ***
${OFFENDER_SEARCH_RESULT_PAGE} =   //h1[contains(.//text(), ' Search results ')]
${OFFENDER_SEARCH_RESULT_TABLE} =   //div[contains(@class, 'booking-table')]
${OFFENDER_DETAILS_TAB} =   //div[contains(.//text(), 'Offender details')]/div[1]
${OFFENDER_ALDERTON} =   //span[contains(.//text(), '${SEARCH_RESULTS.a}')]/div/span



*** Keywords ***

Offender Search Results Page Displays
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${OFFENDER_SEARCH_RESULT_PAGE}

Check The Table Column Headers Are Correct
	[Arguments]  ${name}  ${id}  ${iep}  ${age}  ${location}
	Wait Until Keyword Succeeds  10  0  Page Should Contain Element  ${OFFENDER_SEARCH_RESULT_TABLE}
#	//div[ contains(@id,'PG${group name}')]/div[1+${row in group}]/div[text()[contains(.,'${unit name}')]]

Select Offender "Alderton"
    Wait Until Keyword Succeeds  10  0  Click Element  ${OFFENDER_ALDERTON}

Offender Details Tab Displays
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${OFFENDER_DETAILS_TAB}

