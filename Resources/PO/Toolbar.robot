*** Settings ***
Documentation    This is a Page Object that holds all the keywords for the top menu items
Library  Selenium2Library
Library  DateTime
Library  Dialogs

*** Variables ***

${HOME} =  //h1[contains(.//text(), 'Hello')]
${UNBOUNDLE_CAPACITY_PAGE} =  //h1[contains(.//text(), 'Unbundled Capacity')]
${HAMBURGER} =  //span[contains(.//text(), '(HMP)')]
${LOGOUT_BUTTON} =  //a[contains(., 'Log out')]
${ADMIN_BUTTON} =  //a[contains(., 'Admin')]
${USERS_UNDER_ADMIN_TAB} =  //a[contains(., 'Users')]
${CUSTOMERS_UNDER_ADMIN_TAB} =  //a[contains(., 'Customers')]
${EXTRA_CAP_UNDER_ADMIN_TAB} =  //a[contains(., 'Extra Capacity')]
${DISPATCH_UNDER_ADMIN_TAB} =  //a[contains(., 'Dispatch')]
${SITE_DATA_UNDER_ADMIN_TAB} =  //a[contains(., 'Site Data')]
${CONTRACT_UNDER_ADMIN_TAB} =  //a[contains(., 'Contracts')]
${UNBUNDLE_CAPACITY_LINK} =  //a[contains(., 'Purchase unbundled capacity')]
${PLACE_NOMINATION_LINK} =  //a[contains(.//text(), 'Place nomination')]
${VIEW_BUTTON} =  //button[contains(@type, 'submit')]
${INJECTION_BOX} =  //input[contains(@class, 'form-control input-kwh nomination-inject')]
${WITHDRAWAL_BOX} =  //input[contains(@class, 'form-control input-kwh nomination-withdraw')]
${NOMINATE_BUTTON} =  //button[contains(.//text(), 'Nominate')]
${DATE_FIELD} =  id=date
${NO_CONTRACT_ERROR} =  //div[contains(.//text(), 'No contracts available for specified day. Please select a different date')]
${NOMINATION_SUCCESS_MESSAGE} =  //div[contains(.//text(), 'Your nomination was successfully placed.')]

*** Keywords ***

Check User Is On The "Home" Page
     Wait Until Keyword Succeeds  10  0  Page Should Contain Element  ${HOME}

Logout Of App
    Click Element  ${LOGOUT_BUTTON}

Select User Profile Dropdown
    Click Element   ${HAMBURGER}

Select "Admin" Dropdown Button
    click element  ${ADMIN_BUTTON}

Customer Option Should Not Be Present
    wait until keyword succeeds  10  0  page should not contain element  ${CUSTOMERS_UNDER_ADMIN_TAB}

User Option Should Not Be Present
    wait until keyword succeeds  10  0  page should not contain element  ${USERS_UNDER_ADMIN_TAB}

Extra Capacity Option Should Not Be Available
    wait until keyword succeeds  10  0  page should not contain element  ${EXTRA_CAP_UNDER_ADMIN_TAB}

Dispatch Option Should Not Be Available
    wait until keyword succeeds  10  0  page should not contain element  ${DISPATCH_UNDER_ADMIN_TAB}

Site Data Option Should Not Be Available
    wait until keyword succeeds  10  0  page should not contain element  ${SITE_DATA_UNDER_ADMIN_TAB}

Contract Option Should Be Available
    wait until keyword succeeds  10  0  Page Should Contain Element  ${CONTRACT_UNDER_ADMIN_TAB}

Select Unboundle Capacity Link
    click element  ${UNBUNDLE_CAPACITY_LINK}

Check You Are Unboundle Capacity Page
    wait until page contains element  ${UNBOUNDLE_CAPACITY_PAGE}

Select "Place Nomination" Link On The Home Page
    wait until keyword succeeds  10  0  click element  ${PLACE_NOMINATION_LINK}

Go To Previous Date
    ${date_to_select}=  Get Current Date  UTC    -6 days   %Y-%m-%d
#    execute javascript  $('#date').val("${my_date_to_select}" );  #return ""
    input text  ${DATE_FIELD}  ${date_to_select}
    log  ${date_to_select}

Go To Any Day Beyond Contract Start Date
    ${the_date_to_select}=  Get Current Date  UTC    -12 days   %Y-%m-%d
    input text  ${DATE_FIELD}  ${the_date_to_select}
    log  ${the_date_to_select}

Go To Any Day Beyond Contract End Date
    ${end_date_to_select}=  Get Current Date  UTC    +120 days   %Y-%m-%d
    input text  ${DATE_FIELD}  ${end_date_to_select}
    log  ${end_date_to_select}

Click "View" Button
    click element  ${VIEW_BUTTON}

Check "Injection" Field Is Disabled
    wait until page contains element  ${INJECTION_BOX}
    element should be disabled  ${INJECTION_BOX}

Check "Injection" Field Is Not Disabled
    element should be enabled  ${INJECTION_BOX}

Check "Withdrawal" Field Is Disabled
    wait until page contains element  ${WITHDRAWAL_BOX}
    element should be disabled  ${WITHDRAWAL_BOX}

Check "Withdrawal" Field Is Not Disabled
    element should be enabled  ${WITHDRAWAL_BOX}

Check "Nomination" Button Is Disabled
    element should be disabled  ${NOMINATE_BUTTON}

Select "Nominate" Button
    click element  ${NOMINATE_BUTTON}

No Contract Page Error Is Thrown
    page should contain element  ${NO_CONTRACT_ERROR}

Go To Future Contract Valid Period
    ${valid_date_to_select}=  Get Current Date  UTC    +4 days   %Y-%m-%d
    input text  ${DATE_FIELD}  ${valid_date_to_select}
    log  ${valid_date_to_select}

Check Nomination Success Message
    page should contain element  ${NOMINATION_SUCCESS_MESSAGE}

Check The Injection Field Is Empty
    textarea value should be  ${INJECTION_BOX}  ${EMPTY}

Check The Withdrawal Field Is Empty
    textarea value should be  ${WITHDRAWAL_BOX}  ${EMPTY}