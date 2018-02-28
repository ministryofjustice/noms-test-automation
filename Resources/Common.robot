*** Settings ***
Documentation  This is the common keyword file holding keywords to elements of the application that are used in many tests

Resource  ../Data/Global_Data.robot
Resource  ../Resources/PO/Toolbar.robot
Resource  ../Resources/PO/LoginPage.robot
Resource  ../Resources/Login.robot
Resource  ../Resources/PO/SearchOffenderRecords.robot
Resource  ../Resources/PO/SearchOffenderResults.robot
Resource  ../Resources/PO/ViewAssignments.robot
Resource  ../Resources/PO/ViewOffenderHeaderRecord.robot
Resource  ../Resources/PO/OffenderRecordTabs.robot
Resource   ../Resources/PO/CreateAppointment.robot
Resource   ../Resources/PO/CreateCaseNote.robot

*** Keywords ***


Firefox true headless
    ${firefox options}=     Evaluate    sys.modules['selenium.webdriver'].firefox.webdriver.Options()    sys, selenium.webdriver
    Call Method    ${firefox options}   add_argument    -headless
    Create Webdriver    Firefox    firefox_options=${firefox options}
    Set Window Size    1920    1080

Chrome true Headless
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}   add_argument    headless
    Call Method    ${chrome options}   add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Set Window Size    1920    1080



Begin Web Test

    Firefox true headless
#    Chrome true Headless

#    Open Browser  about:blank  ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=&{CAPABILITIES}
#    Maximize Browser Window

End Web Test
    Close All Browsers




Wait Until Page Is Fully Loaded
    Wait for Ajax

Wait for Ajax
    Wait for Condition  return $(':animated').length == 0;
    Wait for Condition  return document.readyState == 'complete';
    Wait for Condition  return $('img[src*="loading.gif"]:visible').length == 0;