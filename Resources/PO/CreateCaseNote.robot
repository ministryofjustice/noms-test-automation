*** Settings ***
Library  Selenium2Library
Resource  ../../Data/Global_Data.robot

*** Variables ***
${ADD_CASE_NOTE_LINK} =   //a[@href='/bookings/details/addCaseNote'][contains(.//text(), 'Add case note')]
${TYPE_FIELD} =   name=typeValue
${GENERAL} =      //select[@name='typeValue']/option[.='General']
${SUB_TYPE_FIELD} =   name=subTypeValue
${HISTORY_SHEET_ENTRY} =      //select[@name='subTypeValue']/option[.='History Sheet Entry']
${CASE_NOTE_TEXT} =  name=caseNoteText
${EDIT_LINK} =  //a[contains(.//text(), 'Edit')]
${PAST_DATE} =  xxxx

${SAVE_CASE_NOTE} =  //*[@id="app"]/div/main/div/div/form/div[5]/button[1]
${NEW_CASE_NOTE} =  <p>"hello"</p>


*** Keywords ***
Check "Add Case Note" Is Available
	Page Should Contain Element  ${ADD_CASE_NOTE_LINK}

Select "Type" From Dropdown
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${TYPE_FIELD}

Select "General" From Dropdown
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${GENERAL}

Select "SubType" From Dropdown
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${SUB_TYPE_FIELD}

Select "History Sheet Entry" From Dropdown
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${HISTORY_SHEET_ENTRY}

Enter case note text
    Input Text  ${CASE_NOTE_TEXT}  "hello"

Select Edit Link
    Wait Until Keyword Succeeds  20  0  Click Element   ${EDIT_LINK}

#Select past date
#    Wait Until Keyword Succeeds  20  0  Click Element   ${PAST_DATE}

Save case note
    Capture
    Wait Until Keyword Succeeds  10  0  Click Element   ${SAVE_CASE_NOTE}

#Check case note text is present
#    Get Text  ${NEW_CASE_NOTE}  "hello"