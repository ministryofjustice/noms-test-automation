*** Settings ***
Documentation  This is the common keyword file holding keywords to elements of the application that are used in many tests


Library  Selenium2Library
Library  OperatingSystem

Resource  ../Data/Global_Data.robot
Resource  ../Resources/PO/Toolbar.robot
Resource  ../Resources/PO/LoginPage.robot
Resource  ../Resources/Login.robot
Resource  ../Resources/PO/SearchOffenderRecords.robot
Resource  ../Resources/PO/SearchOffenderResults.robot
Resource  ../Resources/PO/ViewAssignments.robot
Resource  ../Resources/PO/ViewOffenderHeaderRecord.robot




*** Keywords ***

#Setup gecko driver
#  Set Environment Variable  webdriver.geckodriver.driver  ./${EXECDIR}/StandAloneDrivers/geckodriver  -headless

Firefox true headless
    ${firefox options}=     Evaluate    sys.modules['selenium.webdriver'].firefox.webdriver.Options()    sys, selenium.webdriver
    Call Method    ${firefox options}   add_argument    -headless
    Create Webdriver    Firefox    firefox_options=${firefox options}
    Set Window Size    1920    1080
#  ${ff default caps}    Evaluate    sys.modules['selenium.webdriver'].common.desired_capabilities.DesiredCapabilities.FIREFOX    sys,selenium.webdriver
#Set To Dictionary    ${ff default caps}    marionette=${True}
#Open Browser    https://www.stackoverflow.com    ff

Begin Web Test
#    Setup gecko driver

    Firefox true headless
#    Open Browser  about:blank  ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=&{CAPABILITIES} -headless
#    Maximize Browser Window

End Web Test
    Close All Browsers


Enter Search Value
    [arguments]  ${injection_value}
    input text  ${SEARCH_BOX}  ${injection_value}


Wait Until Page Is Fully Loaded
    Wait for Ajax

Wait for Ajax
    Wait for Condition  return $(':animated').length == 0;
    Wait for Condition  return document.readyState == 'complete';
    Wait for Condition  return $('img[src*="loading.gif"]:visible').length == 0;