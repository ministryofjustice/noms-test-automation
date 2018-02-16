*** Settings ***
Resource  ../../Data/Global_Data.robot

*** Variables ***
${OFFENDER_SEARCH_RESULT_PAGE} =   //h1[contains(.//text(), ' Search results ')]
${OFFENDER_SEARCH_RESULT_TABLE} =   //div[contains(@class, 'booking-table')]
${PERSONAL_DETAILS_TAB} =   //div[contains(.//text(), 'Personal details')]/div[1]
${OFFENDER_ALDERTON} =   //span[contains(.//text(), '${SEARCH_RESULTS.a}')]/div/span
${GRID_VIEW} =   //div[contains(.//text(), 'Grid')]
${SORT_BY} =   //span[contains(.//text(), 'Sort by:')]
${A_TO_Z} =   //select[@class='form-control']/option[.='Names A to Z ']
${Z_TO_A} =   //select[@class='form-control']/option[.='Names Z to A ']
${LIST_VIEW} =   //div[@data-name='List']

*** Keywords ***

Offender Search Results Page Displays
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${OFFENDER_SEARCH_RESULT_PAGE}

Check The Table Column Headers Are Correct
	[Arguments]  ${name}  ${id}  ${iep}  ${age}  ${location}
	Wait Until Keyword Succeeds  10  0  Page Should Contain Element  ${OFFENDER_SEARCH_RESULT_TABLE}

Select Offender "Alderton"
    Wait Until Keyword Succeeds  10  0  Click Element  ${OFFENDER_ALDERTON}

Personal Details Tab Displays
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${PERSONAL_DETAILS_TAB}

Select "Grid" View
    Capture Page Screenshot
    Wait Until Keyword Succeeds  20  0  Click Element   ${GRID_VIEW}

Sort By Names Displays
    Capture Page Screenshot
    Wait Until Keyword Succeeds  20  0  Page Should Contain Element    ${SORT_BY}
    Page Should Contain Element    ${A_TO_Z}
    Page Should Contain Element    ${Z_TO_A}

Select "List" View
    Capture Page Screenshot
    Wait Until Keyword Succeeds  20  0  Click Element   ${LIST_VIEW}

Sort By Names No Longer Display
    Capture Page Screenshot
    Wait Until Keyword Succeeds  20  0  Page Should Not Contain Element    ${SORT_BY}
    Page Should Not Contain Element    ${A_TO_Z}
    Page Should Not Contain Element    ${Z_TO_A}

Check "Grid" Toggle Link Is Available
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element   ${GRID_VIEW}

Check "List" Toggle Link Is Available
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element   ${LIST_VIEW}