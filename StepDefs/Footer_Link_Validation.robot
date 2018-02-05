*** Settings ***
Documentation    Checks to ensure page footer links are present and contain the correct data.

Resource   ../Resources/Common.robot

*** Keywords ***

Check User Is On The "Home" Page
  Toolbar.Check User Is On The "Home" Page

Check [T's and C's link&] is present
  FooterLinkValidation.Check for presence of T's & C's link
