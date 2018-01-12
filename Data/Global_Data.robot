*** Settings ***

Documentation    Global data file for test agnostic data

*** Variables ***

${BROWSER} =  ff
${START_URL}=  https://notm-dev.hmpps.dsd.io/login
${VALID_ADMIN_USER} =  ZHAMMED
${VALID_ADMIN_PASSWORD} =  password123
${INVALID_PWORD} =  123456789@ttn
${INVALID_USER} =   IncorrectUser



&{SEARCH_VALUES}    a=*     b=%     c=#     d=+

&{SEARCH_RESULTS}    a=Alderton, John   b=Balog, Igor   offenderSurname=Alderton    offenderFirstName=John