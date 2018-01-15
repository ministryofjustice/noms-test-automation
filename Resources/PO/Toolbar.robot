*** Settings ***
Documentation    This is a Page Object that holds all the keywords for the top menu items
Library  Selenium2Library
Library  DateTime

*** Variables ***

${HOME} =  //h1[contains(.//text(), 'Hello')]
${UNBOUNDLE_CAPACITY_PAGE} =  //h1[contains(.//text(), 'Unbundled Capacity')]
${HAMBURGER} =  //span[contains(.//text(), '(HMP)')]
${LOGOUT_BUTTON} =  //a[contains(., 'Log out')]

${HOME_W} =  //h1[contains(.//text(), '')]

*** Keywords ***

Check User Is On The "Home" Page
    Wait Until Keyword Succeeds  10  0  Welcome User
    Wait Until Keyword Succeeds  10  0  Page Should Contain  ${hello_user}

Logout Of App
    Click Element  ${LOGOUT_BUTTON}

Select User Profile Dropdown
    Click Element   ${HAMBURGER}

Welcome User
    ${hello_user} =  Get Text     ${HOME_W}
    Log To Console  ${hello_user}
    Set Suite Variable  ${hello_user}