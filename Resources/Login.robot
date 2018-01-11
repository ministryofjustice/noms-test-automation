*** Settings ***

Documentation    This has all methods/keywords relating to login and logout activities.

Resource   ../Resources/Common.robot
Resource   ../Resources/PO/LoginPage.robot



*** Keywords ***

Login
    Login "Admin" Valid User

Login "Admin" Valid User
    Load Login Page
    EnterUserName  ${VALID_ADMIN_USER}
#    Execute Javascript  $('#email').val("${VALID USER}" ); return ""
    EnterPassword  ${VALID_ADMIN_PASSWORD}

Log Out User
    Toolbar.Select User Profile Dropdown
    Toolbar.Logout Of App

Load Login Page
     LoginPage.Load

EnterUserName
    [Arguments]  ${username}
    LoginPage.Input Username   ${username}

EnterPassword
    [Arguments]  ${password}
    LoginPage.Input Password   ${password}

PressSubmitButton
    LoginPage.Submit Credentials

Login With Incorrect Credentials
    Load Login Page
    EnterUserName  ${INVALID_USER}
    EnterPassword  ${INVALID_PWORD}

Login With Valid "Username" & Incorrect "Password"
    Load Login Page
    EnterUserName  ${VALID_ADMIN_USER}
    EnterPassword  ${INVALID_PWORD}

Login With Empty Credentials
    Load Login Page
    EnterUserName  ${EMPTY}
    EnterPassword  ${EMPTY}

Login Valid User
    Load Login Page
    EnterUserName  ${VALID_ADMIN_USER}
    EnterPassword  ${VALID_ADMIN_PASSWORD}
    LoginPage.Credentials