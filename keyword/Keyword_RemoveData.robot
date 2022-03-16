*** Keywords ***
Remove Partner
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEPARTNER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEPARTNER}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    ${data}=    Evaluate    {"PartnerId": "${PartnerId}"}   
    #Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_REMOVEPARTNER}    ${headers}    ${data}
	Log To Console    RemovePartner Response : ${res}
	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEPARTNER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    Log To Console    RemovePartner Result : ${result}
	[return]    ${result}

Remove Account
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}    ${AccountId}
	Log    ${url}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNT}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    ${data}=    Evaluate    {"PartnerID": "${PartnerId}","AccountId": "${AccountId}"}   
    Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_REMOVEACCOUNT}    ${headers}    ${data}
	Log To Console    RemoveAccount Response : ${res}

	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEACCOUNT}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    Log To Console    RemoveAccount Result : ${result}
	[return]    ${result}


Remove A Thing
    [Arguments]    ${url}    ${accessToken}    ${ThingId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEATHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEATHING}
	#Log To Console    ${headers}
		
    # ${data}=    Evaluate    {"ThingId": "${ThingId}"}  
	${data}=    Set Variable    ${EMPTY} 
    # Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${CENTRICAPIS}    ${URL_REMOVEATHING}${ThingId}    ${headers}    ${data}
	Log To Console    Remove A Thing Response : ${res}
	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEATHING}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	Log To Console    Remove A Thing Result : ${result}
	[return]    ${result}

Remove A Worker
    [Arguments]    ${url}    ${accessToken}    ${WorkerId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEAWORKER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEAWORKER}  
	#Log To Console    ${headers}
		
    # ${data}=    Evaluate    {"WorkerId": "${WorkerId}"}   
	${data}=    Set Variable    ${EMPTY}
    # Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${CENTRICAPIS}    ${URL_REMOVEAWORKER}${WorkerId}    ${headers}    ${data}
	Log To Console    Remove A Worker Response : ${res}
	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEAWORKER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	Log To Console    Remove A Worker Result : ${result}
	[return]    ${result}

Remove Thing
    [Arguments]    ${url}    ${accessToken}    ${ThingID}    ${AccountId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVETHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVETHING}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}        Accept=${HEADER_ACCEPT}  
	# Log To Console    ${headers}
		
    ${data}=    Evaluate    {"ThingId": "${ThingID}"}   
    # Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_REMOVETHING}    ${headers}    ${data}
	Log To Console    RemoveThing Response : ${res}

	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVETHING}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    # Log To Console    RemoveThing Result : ${result}
	[return]    ${result}



Partner Account and ThingArr Core Request RemoveData
    [Arguments]    ${accessToken}    ${PartnerId}    ${AccountId}    ${ThingIdArr}
		
	${data_count}=    Get Length    ${ThingIdArr}
	# Log To Console    data_count${data_count}  

	FOR    ${i}    IN RANGE    ${data_count}
        ${postRemoveThing}=    Remove Thing    ${URL}    ${accessToken}    ${ThingIdArr}[${i}]    ${AccountId}    
	END
	${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}    ${AccountId}
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}

	${result}=    Set Variable If    '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true' and '${postRemoveThing}'=='true'    true
    ...    '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true' and '${postRemoveThing}'!='true'    false
    # Log To Console    Partner Account and ThingArr Core Request RemoveData Result : ${result}
	[return]    ${result}