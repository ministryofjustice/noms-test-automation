*** Settings ***
Documentation    This is a Page Object that holds all the keywords for the top menu items
Library  DateTime

*** Variables ***

${HOME} =  //h1[contains(.//text(), 'Hello')]
${UNBOUNDLE_CAPACITY_PAGE} =  //h1[contains(.//text(), 'Unbundled Capacity')]
${HAMBURGER} =  //span[contains(.//text(), '(HMP)')]
${LOGOUT_BUTTON} =  //a[contains(., 'Log out')]
${VIEW_ASSIGNMENTS_TEXT} =  //h1[contains(.//text(), ' View your assignments ')]
${HOME_W} =  //h1[contains(.//text(), '')]
${HMPPS_HOME} =  xpath=//a[contains(.//text(), 'Home')]  #//a[contains(.//text(), 'HMPPS')]
${SIGNIN_TEXT} =    //span[contains(.//text(), 'Sign in to ')]
*** Keywords ***

Check User Is On The "Home" Page
    Capture Page Screenshot
    Wait Until Page Contains Element  ${VIEW_ASSIGNMENTS_TEXT}  timeout=1 minutes

Logout Of App
    Wait Until Keyword Succeeds  10  0  Click Element  ${LOGOUT_BUTTON}

Select User Profile Dropdown
    Wait Until Keyword Succeeds  10  0  Click Element   ${HAMBURGER}

Welcome User
    ${hello_user} =  Get Text     ${HOME_W}
    Log To Console  ${hello_user}
    Set Suite Variable  ${hello_user}

Select The "Home" Link
    Wait Until Keyword Succeeds  20  0  Click Element    ${HMPPS_HOME}

Signin Page "Displays"
    Wait Until Page Contains Element  ${SIGNIN_TEXT}  timeout=1 minutes
