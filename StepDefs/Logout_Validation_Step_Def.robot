*** Settings ***
Documentation    This Is Checking User Can Logout After Logged in With Valid Credentials.

Resource   ../Resources/Common.robot

*** Keywords ***
Admin User Logs Into [NOMIS]
    Login.Login

User Selects Submit Button
    LoginPage.Credentials

Check That User Logs in Successfully
    Toolbar.Check User Is On The "Home" Page

Selects Breadcrumb
    Toolbar.Select User Profile Dropdown

Selects [Logout] Button
    Toolbar.Logout Of App

Check That [Signin] Page Displays
    Toolbar.Signin Page "Displays"
