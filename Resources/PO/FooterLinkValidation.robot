*** Settings ***
Documentation    This is the Page Object for the Footer links
Resource  ../../Data/Global_Data.robot
Library  Selenium2Library

*** Variables ***
${TERMS_&_CONDITIONS_LINK} = //a[contains(.//text(), 'Terms and conditions')]

*** Keywords ***
Load
   Go To  ${START_URL}

Check for presence of T's & C's link
  Wait Until Keyword Succeeds  10  0  Page Should Contain Element    ${TERMS_&_CONDITIONS_LINK}

Select T's & C's Link
  Wait Until Keyword Succeeds  20  0  Click Element   ${TERMS_&_CONDITIONS_LINK}

##Check T's & C's Page content
#  xxx
