*** Settings ***
Documentation    Checks to ensure page footer links are present and contain the correct data.

Resource  ../Resources/Footer_Link_Validation_Step_Def.robot
Resource  ../Resources/Common.robot

*** Keywords ***

user is on [NOMIS]
    FooterLinkValidation.Go To Home URL
    FooterLinkValidation.Check Page URL

Check [T's and C's link] is present
    FooterLinkValidation.Check for presence of Terms & Conditions link

user selects [T's and C's link]
    FooterLinkValidation.Click "T's & C's" Link

Check T's & C's page appears
    FooterLinkValidation.Check T's & C's page wording appears