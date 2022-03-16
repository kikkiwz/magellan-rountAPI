*** Keywords ***
####################################################
Rollback Data Remove Partner Account and ThingArr Core
	# [accessToken,PartnerId,AccountId,AccountName,ThingIdArr]
	[Arguments]    ${Flow}    ${getData}    ${id}

	${accessToken}=    Set Variable    ${getData}[0]
	${PartnerId}=    Set Variable    ${getData}[1]
	${AccountId}=    Set Variable    ${getData}[2]
	${ThingIdArr}=    Set Variable    ${getData}[4]
    # Log To Console    ThingIdArr${ThingIdArr}
    ${result}=    Run Keyword And Return Status    Partner Account and ThingArr Core Request RemoveData    ${accessToken}    ${PartnerId}    ${AccountId}    ${ThingIdArr}
	# Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}