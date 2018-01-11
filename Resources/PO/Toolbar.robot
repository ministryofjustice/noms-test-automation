*** Settings ***
Documentation    This is a Page Object that holds all the keywords for the top menu items
Library  Selenium2Library
Library  DateTime

*** Variables ***

${HOME} =  //h1[contains(.//text(), 'Hello')]
${UNBOUNDLE_CAPACITY_PAGE} =  //h1[contains(.//text(), 'Unbundled Capacity')]
${HAMBURGER} =  //span[contains(.//text(), '(HMP)')]
${LOGOUT_BUTTON} =  //a[contains(., 'Log out')]


*** Keywords ***

Check User Is On The "Home" Page
     Wait Until Keyword Succeeds  10  0  Page Should Contain Element  ${HOME}

Logout Of App
    Click Element  ${LOGOUT_BUTTON}

Select User Profile Dropdown
    Click Element   ${HAMBURGER}

