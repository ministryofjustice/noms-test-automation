*** Settings ***
Library  Selenium2Library
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

*** Keywords ***

Search Field Is Available
    Page Should Contain Element    ${SEARCH_BOX}

Enter Search Value
   [Arguments]  ${search_value}
   Input Text  ${SEARCH_BOX}  ${search_value}

Click "Search" Button
    Click Element   ${SEARCH_BUTTON}

No Matching Message Displays
    Page Should Contain Element    ${NO_MATCHING_RECORD}

Error "400" Status Code Displays
    Page Should Contain Element    ${ERROR_STATUS_CODE}

Search "Result" Returned With Offender
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${FIRST_SEARCH_RESULTS}

Second Offender Search "Result" In The List
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${SECOND_IN_SEARCH_RESULTS_LIST}

Select "Location" Dropdown
    Wait Until Keyword Succeeds  10  0  Click Element   ${LOCATION_FIELD}

Select "LEEDS" From Dropdown
    Wait Until Keyword Succeeds  10  0  Click Element   ${LEEDS}


