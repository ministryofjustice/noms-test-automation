*** Settings ***
Library  Selenium2Library
Resource  ../../Data/Global_Data.robot


*** Variables ***
${VIEW_ASSIGNMENTS} =   //h1[contains(.//text(), ' View your assignments ')]
${KEY_WORKER_LINK} =   //a[contains(.//text(), 'As Key Worker')]

${ASSIGNMENT_PAGE} =   //a[contains(.//text(), 'Assignments')]
${WORKER_FULL_NAME} =   //div[@class='fMHyRU'][contains(.//text(), '')]

*** Keywords ***

View Assignments Section Displays
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${VIEW_ASSIGNMENTS}

As Key Worker Link Is Available
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${KEY_WORKER_LINK}

Click "As Key Worker" Link
    Click Element   ${KEY_WORKER_LINK}

Check 'Assignments' Page Displays
    Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${ASSIGNMENT_PAGE}


Check Worker Full Name Displays On The Page
    Wait Until Keyword Succeeds  10  0  Get Key Worker Full Name
    Wait Until Keyword Succeeds  10  0  Page Should Contain  ${worker_name}


Get Key Worker Full Name
    ${worker_name} =  Get Text     ${WORKER_FULL_NAME}
    Log To Console  ${worker_name}
    Set Suite Variable  ${worker_name}
