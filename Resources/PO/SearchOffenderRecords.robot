*** Settings ***
Library  Selenium2Library


*** Variables ***
${SEARCH_BOX} =   name=keywords
${SEARCH_BUTTON} =   //button[contains(@class, 'button button-start desktop-button')]
${NO_MATCHING_RECORD} =   //span[contains(.//text(), 'No records found matching search criteria.')]
${ERROR_STATUS_CODE} =   //div[contains(.//text(), 'Request failed with status code 400')]


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

