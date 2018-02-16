*** Settings ***
Resource  ../../Data/Global_Data.robot

*** Variables ***
${OFFENDER_SEARCH_RESULT_PAGE} =   //h1[contains(.//text(), ' Search results ')]
${OFFENDER_SEARCH_RESULT_TABLE} =   //div[contains(@class, 'booking-table')]
${PERSONAL_DETAILS_PAGE} =   //h3[contains(.//text(), 'Personal details')]   #//div[contains(.//text(), 'Offender details')]/div[1]
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
	Wait Until Keyword Succeeds  10  0  Wait Until Page Contains Element  ${OFFENDER_SEARCH_RESULT_TABLE}  timeout=1 minutes

Select Offender "Alderton"
    Capture Page Screenshot
    Wait Until Keyword Succeeds  10  0  Click Element  ${OFFENDER_ALDERTON}

Personal Details Page Displays
    Wait Until Keyword Succeeds  10  0  Wait Until Page Contains Element    ${PERSONAL_DETAILS_PAGE}  timeout=1 minutes

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
    Wait Until Keyword Succeeds  20  0  Wait Until Page Does Not Contain Element      ${SORT_BY}  timeout=1 minutes
    Page Should Not Contain Element    ${A_TO_Z}
    Page Should Not Contain Element    ${Z_TO_A}

Check "Grid" Toggle Link Is Available
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element   ${GRID_VIEW}

Check "List" Toggle Link Is Available
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element   ${LIST_VIEW}