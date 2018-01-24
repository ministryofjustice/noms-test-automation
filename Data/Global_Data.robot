*** Settings ***

Documentation    Global data file for test agnostic data

*** Variables ***

${BROWSER} =  ff
${START_URL}=  https://notm-dev.hmpps.dsd.io/login
${REMOTE_URL}
&{CAPABILITIES}
${VALID_ADMIN_USER} =  ZHAMMED
${VALID_ADMIN_PASSWORD} =  password123
${VALID_KEYWORKER_USER} =  DBULL_KEYWORKER
${VALID_KEYWORKER_PASSWORD} =  password123456
${INVALID_PWORD} =  123456789@ttn
${INVALID_USER} =   IncorrectUser


#${REMOTE_URL}           http://127.0.0.1:4444/wd/hub
#@{CHROME_ARGS}          --headless
#&{CHROME_OPTIONS}       args=@{CHROME_ARGS}
#&{CAPABILITIES}         chromeOptions=&{CHROME_OPTIONS}



&{SEARCH_VALUES}    a=*     b=%     c=#     d=+

&{SEARCH_RESULTS}    a=Alderton, John   b=Balog, Igor   offenderSurname=Alderton    offenderFirstName=John

&{OFFENDER_HEADER_RECORD}    prisonerNo=A1572AE  keyWorker=Willis, Michael   name=Chtest, Api14.2  iep=Standard
    ...  alerts=1 active | 2 inactive   location=LEEDS (HMP)
