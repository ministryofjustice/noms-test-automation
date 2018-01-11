*** Settings ***
Documentation  This is the common keyword file holding keywords to elements of the application that are used in many tests


Library  Selenium2Library

Resource  ../Data/Global_Data.robot
Resource  ../Resources/PO/Toolbar.robot
Resource  ../Resources/PO/LoginPage.robot
Resource  ../Resources/Login.robot
#Resource  ../Resources/PO/Dashboard.robot
Resource  ../Resources/PO/SearchOffenderRecords.robot

*** Variables ***




*** Keywords ***


Begin Web Test
    Open Browser  about:blank  ${BROWSER}
#    Maximize Browser Window

End Web Test
    Close All Browsers


Enter Search Value
    [arguments]  ${injection_value}
    input text  ${SEARCH_BOX}  ${injection_value}

Enter Whithdrawal Value
    [arguments]   ${whithdrawal_value}
    input text  ${WITHDRAWAL_BOX}  ${whithdrawal_value}

Wait Until Page Is Fully Loaded
    Wait for Ajax

Wait for Ajax
    Wait for Condition  return $(':animated').length == 0;
    Wait for Condition  return document.readyState == 'complete';
    Wait for Condition  return $('img[src*="loading.gif"]:visible').length == 0;