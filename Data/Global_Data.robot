*** Settings ***

Documentation    Global data file for test agnostic data

*** Variables ***

${BROWSER} =  ff
#${BROWSER} =  phantomjs
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

#&{firefox options}       args=@{FIREFOX_ARGS}



&{SEARCH_VALUES}    a=*     b=%     c=#     d=+

&{SEARCH_RESULTS}    a=Alderton, John   b=Balog, Igor   offenderSurname=Alderton    offenderFirstName=John

&{OFFENDER_HEADER_RECORD}    prisonerNo=A1418AE  keyWorker=Notm, Test_user   name=Child, Andrew  iep=Standard
    ...  alerts=0 active | 0 inactive   location=LEEDS (HMP)

&{OFFENDER_WITH_NO_KEYWORKER}    prisonerNo=A1588AE  keyWorker=--   name=Ricardson, Jeffery  iep=Standard
    ...  alerts=0 active | 0 inactive   location=LEEDS (HMP)    noKeyWorkerAssigned=Ricardson, Jeffery

