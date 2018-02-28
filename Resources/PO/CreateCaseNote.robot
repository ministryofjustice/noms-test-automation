*** Settings ***
Resource  ../../Data/Global_Data.robot

*** Variables ***
${ADD_CASE_NOTE_LINK} =   //a[@href='/bookings/details/addCaseNote'][contains(.//text(), 'Add case note')]
${TYPE_FIELD} =   name=typeValue
${GENERAL} =      //select[@name='typeValue']/option[.='General']
${SUB_TYPE_FIELD} =   name=subTypeValue
${HISTORY_SHEET_ENTRY} =      //select[@name='subTypeValue']/option[.='History Sheet Entry']
${CASE_NOTE_TEXT} =  name=caseNoteText
${EDIT_LINK} =  //a[contains(.//text(), 'Edit')]
${CASE_NOTE_ERROR} =  //div[contains(.//text(), 'Required')]
${SAVE_CASE_NOTE_BUTTON} =  //button[contains(.//text(), 'Save case note')]



*** Keywords ***
Check "Add Case Note" Is Available
	Page Should Contain Element  ${ADD_CASE_NOTE_LINK}

Check "Case Note" Error Message
	Page Should Contain Element  ${CASE_NOTE_ERROR}

Select "Type" From Dropdown
    Wait Until Keyword Succeeds  10  0  Click Element   ${TYPE_FIELD}

Select "General" From Dropdown
    Wait Until Keyword Succeeds  10  0  Click Element   ${GENERAL}

Select "SubType" From Dropdown
    Wait Until Keyword Succeeds  10  0  Click Element   ${SUB_TYPE_FIELD}

Select "History Sheet Entry" From Dropdown
    Wait Until Keyword Succeeds  10  0  Click Element   ${HISTORY_SHEET_ENTRY}

Enter Case Note Text
    [Arguments]  ${text}
    Input Text  ${CASE_NOTE_TEXT}  ${text}

Select Edit Link
    Wait Until Keyword Succeeds  20  0  Click Element   ${EDIT_LINK}

Save Case Note
    Wait Until Keyword Succeeds  10  0  Click Element   ${SAVE_CASE_NOTE_BUTTON}

Get Current Hour
    Assign Id To Element    name=hours  hour_id
    ${hour_field_id}  set variable  hour_id
    ${hour}=   Get Current Date   result_format=%H
	Log  ${hour}
    Press Key  ${hour_field_id}     ${hour}

Check "Case Note" Tab Displays
	Wait Until Page Contains Element  ${ADD_CASE_NOTE_LINK}

Assign ID To Date Picker
    Assign Id To Element    //input[@class='form-control']  date_picker_id
    ${date_picker_element}  set variable  date_picker_id
    Set Suite Variable  ${date_picker_element}

Get 3 Days In The Future
    Assign ID To Date Picker
    ${date_to_select}=  Get Current Date    UTC     +3 days  ${DATE_FORMAT}
    Execute Javascript      document.getElementById('${date_picker_element}').value="${date_to_select}";
    Log  ${date_to_select}
    Capture Page Screenshot

Get 2 Days In The Past
    Assign ID To Date Picker
    ${date_to_select}=  Get Current Date    UTC     -2 days  ${DATE_FORMAT}
    Execute Javascript      document.getElementById('${date_picker_element}').value="${date_to_select}";
    Log  ${date_to_select}
    Capture Page Screenshot