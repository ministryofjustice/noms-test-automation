*** Settings ***
Resource  ../../Data/Global_Data.robot

*** Variables ***
${SEARCH_BOX} =   name=keywords
${SEARCH_BUTTON} =   //button[contains(@class, 'button button-start desktop-button')]
${NO_MATCHING_RECORD} =   //span[contains(.//text(), 'No records found matching search criteria.')]
${ERROR_STATUS_CODE} =   //div[contains(.//text(), 'Request failed with status code 400')]
${FIRST_SEARCH_RESULTS} =   //span[contains(.//text(), '${SEARCH_RESULTS.a}')]/div/span
${SECOND_IN_SEARCH_RESULTS_LIST} =   //span[contains(.//text(), '${SEARCH_RESULTS.b}')]/div/span
${LOCATION_FIELD} =   name=locationPrefix
${LEEDS} =      //select[@name='locationPrefix']/option[.='LEEDS (HMP)']
${OFFENDER_DETAILS_PAGE} =      //div[contains(.//text(), 'Offender details')]
${404_ERROR_STATUS_CODE} =   //div[contains(.//text(), 'Request failed with status code 404')]

*** Keywords ***

Search Field Is Available
    Page Should Contain Element    ${SEARCH_BOX}

Enter Search Value
    Capture
   [Arguments]  ${search_value}
   Input Text  ${SEARCH_BOX}  ${search_value}

Click "Search" Button
    Capture
    Wait Until Keyword Succeeds  20  0  Press Key   ${SEARCH_BUTTON}  \\13

No Matching Message Displays
    Page Should Contain Element    ${NO_MATCHING_RECORD}

Error "400" Status Code Displays
    Page Should Contain Element    ${ERROR_STATUS_CODE}

Error "404" Status Code Displays
    Page Should Contain Element    ${404_ERROR_STATUS_CODE}

Search "Result" Returned With Offender
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${FIRST_SEARCH_RESULTS}

Second Offender Search "Result" In The List
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${SECOND_IN_SEARCH_RESULTS_LIST}

Select "Location" Dropdown
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${LOCATION_FIELD}

Select "LEEDS" From Dropdown
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${LEEDS}

Offender Details Page Displays
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${OFFENDER_DETAILS_PAGE}

Search "Result" Does Not Return With Offender
    Sleep  10s
    Page Should Not Contain Element    ${FIRST_SEARCH_RESULTS}

Capture
    Capture Page Screenshot