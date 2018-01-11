*** Settings ***
Documentation    This Is Checking User Can Login With Valid Credentials & Denying Users With Invalid Credentials.

Resource   ../Resources/Common.robot

*** Keywords ***

User Enters Incorrect Credentials To Login Into [NOMIS]
    Login.Login With Incorrect Credentials

Check That User Can Log Out Successfully
   Login.Log Out All Users

User Attempts To Login With Valid [Username] & Invalid [Password]
    Login.Login With Valid "Username" & Incorrect "Password"

User Attempts To Login Into [NOMIS] Without Credentials
    Login.Login With Empty Credentials

Check User Is Not Allowed Access And An Error Message Is Displayed
    LoginPage.Error Message Is Shown

User Selects Submit Button
    LoginPage.Credentials

Check That Fields Are Highlighted As Required
    LoginPage.Check For "Required" Text Displays

Admin User Logs Into [NOMIS]
    Login.Login

Check That User Logs in Successfully
    Toolbar.Check User Is On The "Home" Page
