*** Keywords ***
Signin
    [Arguments]    ${url}    ${username}    ${password}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_SIGNIN}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_SIGNIN}    Accept=${HEADER_ACCEPT}  
    ${data}=    Evaluate    {"username": "${username}","password": "${password}"}   
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_SIGNIN}    ${headers}    ${data}
	#Log To Console    Response Signin : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${SINGNIN}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	#accessToken
	${accessToken}=    Get From Dictionary    ${res}     ${FIELD_ACCESSTOKEN}
	#Log To Console    ${accessToken}
	[return]    ${accessToken}

#=====================================================================================================================================================#

Create Partner
    [Arguments]    ${url}    ${accessToken}
    #Generate Random number
    ${random_number}=    generate random string    6    [NUMBERS]
	#PartnerName
	${PartnerName}=    Set Variable    ${VALUE_PARTNERNAME}${random_number}
	#MerchantContact
	${MerchantContact}=    Set Variable    ${VALUE_MERCHANTCONTACT}
	#CPID
	${CPID}=    Set Variable    ${VALUE_CPID}
	
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEPARTNER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEPARTNER}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    ${data}=    Evaluate    {"PartnerName": "${PartnerName}","PartnerType": ["Supplier","Customer"],"PartnerDetail": {"MerchantContact": "${MerchantContact}","CPID": "${CPID}"},"Property": {"RouteEngine": "false"}}   
    #Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_CREATEPARTNER}    ${headers}    ${data}
    Log To Console    Response Create Partner : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEPARTNER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
	#GetResponse_PartnerId
    ${PartnerInfo}=    Get From Dictionary    ${res}     ${FIELD_PARTNERINFO}   
    # Log To Console    ${PartnerInfo}	
	${GetResponse_PartnerId}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_PARTNERID}    
	# Log To Console    ${GetResponse_PartnerId}	
	${GetResponse_CustomerId}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_CUSTOMERID}
    ${PartnerType}=    Set Variable     ${PartnerInfo['PartnerType']}
	${setPartnerTypeArr}=    Set Variable    '${PartnerType}[0]', '${PartnerType}[1]' 
    ${Property}=    Set Variable     ${PartnerInfo['Property']}
	${RouteEngine}=    Set Variable    ${Property['RouteEngine']}
    #AccountName
    ${AccountName}=    Set Variable    ${VALUE_ACCOUNTNAME}${random_number}
    #Log To Console    ${AccountName}
    #ConfigGroupName
    #Log To Console    ${ConfigGroupName}
    [Return]    ${GetResponse_PartnerId}    ${AccountName}    ${PartnerName}    ${GetResponse_CustomerId}    ${setPartnerTypeArr}    ${RouteEngine}    ${MerchantContact}    ${CPID}   


#=====================================================================================================================================================#

Create Account
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}    ${AccountName}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEACCOUNT}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEACCOUNT}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}
    #Log To Console    ${headers}
    ${randomSensorApp}=    Evaluate    random.randint(100, 999)    random
    ${data}=    Evaluate    {"PartnerID": "${PartnerId}","AccountName": "${AccountName}${randomSensorApp}"}

    #Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_CREATEACCOUNT}    ${headers}    ${data}
	Log To Console    Response Create Account : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEACCOUNT}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
	#GetResponse_AccountName
    ${PartnerInfo}=    Get From Dictionary    ${res}     ${FIELD_PARTNERINFO}   
    #Log To Console    ${PartnerInfo}	
	${AccountInfo}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_ACCOUNTINFO}  
	#Log To Console    ${AccountInfo}	
	${GetResponse_AccountName}=    Get From Dictionary    ${AccountInfo}[0]     ${FIELD_ACCOUNTNAME}    
	#Log To Console    ${GetResponse_AccountName}
	#GetResponse_AccountId
	${GetResponse_AccountId}=        Get From Dictionary    ${AccountInfo}[0]     ${FIELD_ACCOUNTID}    
    #Log To Console    ${GetResponse_AccountId} 
	
	[return]    ${GetResponse_AccountId}     ${GetResponse_AccountName}    

#=====================================================================================================================================================#

Import Thing
    [Arguments]    ${url}    ${accessToken}    ${data}

	#Ex. ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }
	# Log To Console    ${data}

    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_IMPORTTHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_IMPORTTHING}  
        #Log To Console    ${headers}

        # #SupplierId SupplierName
        # ${random_number}=    generate random string    6    [NUMBERS]
        # ${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number}
        # #Log To Console    ${SupplierId}
        # ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number}
        # #Log To Console    ${SupplierName}

        ${body}=    Evaluate    { "ConnectivityType": "${data[${i}]['ConnectivityType']}", "ThingName": "${data[${i}]['ThingName']}", "ThingIdentifier": "${data[${i}]['ThingIdentifier']}", "ThingSecret": "${data[${i}]['ThingSecret']}"}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END
    
	Log To Console    ${valArrData}
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_IMPORTTHING}    ${headers}    ${valArrData}
	Log To Console    Response Import Thing : ${res}
	
	${data_countRes}=    Get Length    ${res}
    # Log To Console    ${data_countRes}
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${res}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		${StatusDespcription}=    Set Variable   ${res}[${i}][${FIELD_STATUSDESCRIPTION}]
		# Log To Console    StatusDespcription${StatusDespcription}
	    Run keyword And Continue On Failure    Response ResultCode Should Have Success    ${status}    ${StatusDespcription}    ${IMPORTTHING}
	#Exit For Loop
	END
	[return]    ${res}


#=====================================================================================================================================================#
Mapping IMEI
    [Arguments]    ${url}    ${accessToken}    ${data}

	#Ex. ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }
	# Log To Console    ${data}

    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_MAPPINGIMEI}  
        #Log To Console    ${headers}

        #SupplierId SupplierName
        # ${random_number}=    generate random string    6    [NUMBERS]
        # ${SupplierId}=    Set Variable    ${VALUE_SUPPLIERID}${random_number}
        #Log To Console    ${SupplierId}
        # ${SupplierName}=    Set Variable    ${VALUE_SUPPLIERNAME}${random_number}
        #Log To Console    ${SupplierName}

        ${body}=    Evaluate    { "ConnectivityType": "${data[${i}]['ConnectivityType']}", "ThingName": "${data[${i}]['ThingName']}", "ThingIdentifier": "${data[${i}]['ThingIdentifier']}", "ThingSecret": "${data[${i}]['ThingSecret']}", "IMEI": "${data[${i}]['IMEI']}"}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END
    
	# Log To Console    ${valArrData}
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_MAPPINGIMEI}    ${headers}    ${valArrData}
	Log To Console    Response Mapping IMEI : ${res}
    
	${data_countRes}=    Get Length    ${res}
    # Log To Console    ${data_countRes}
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${res}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		${StatusDespcription}=    Set Variable   ${res}[${i}][${FIELD_STATUSDESCRIPTION}]
		# Log To Console    StatusDespcription${StatusDespcription}
	    Run keyword And Continue On Failure    Response ResultCode Should Have Success    ${status}    ${StatusDespcription}    ${MAPPINGIMEI}
	#Exit For Loop
	END
	[return]    ${res}

 
Activate Thing Core
    [Arguments]    ${url}    ${accessToken}    ${AccountId}    ${data}

	#Ex. ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }
	# Log To Console    ${data}
	# Log To Console    ${data[0]['ThingIdentifier']}
    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_ACTIVATETHING_CORE}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}  
        #Log To Console    ${headers}

        ${body}=    Evaluate    { "ICCID": "${data[${i}]['ThingIdentifier']}", "IMSI": "${data[${i}]['ThingSecret']}", "IMEI": "${data[${i}]['IMEI']}"}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END
    
	# Log To Console    ${valArrData}
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_ACTIVATETHING_CORE}    ${headers}    ${valArrData}
	Log To Console    Response Activate Thing : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${ACTIVATETHING_CORE}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    
	${resActivateThing}=    Set Variable    ${res['${FIELD_ACTIVATETHING}']}
	${data_countRes}=    Get Length    ${resActivateThing}
    # Log To Console    ${data_countRes}
    @{GetResponse_ThingIDArr}=    Create List
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${resActivateThing}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		Run keyword And Continue On Failure    Should Be Equal As Strings    ${status}    ${VALUE_STATUS_SUCCESS}

		#GetResponse_ThingIDArr
		${resThingId}=    Set Variable   ${resActivateThing}[${i}][${FIELD_THINGID}]
		Append To List    ${GetResponse_ThingIDArr}    ${resThingId}        #Add data to array set at valArrData
		# Log To Console    GetResponse_ThingIDArr${GetResponse_ThingIDArr}

	#Exit For Loop
	END
	[return]    ${GetResponse_ThingIDArr}    ${res} 
   




  
Request CreateData for Signin Partner Account ImportThing MappingIMEI and ActivateThingCore
    [Arguments]        ${username}    ${password}    ${data}
	${accessToken}=    Signin    ${URL}    ${username}    ${password}
	${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
	${postCreateAccount}=	Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]
	${postImportThing}=	   Import Thing    ${URL_CENTRIC}    ${accessToken}    ${data}
	${postMappingIMEI}=	   Mapping IMEI    ${URL_CENTRIC}    ${accessToken}    ${data}
	${postActivateThingCore}=    Activate Thing Core    ${URL}    ${accessToken}    ${postCreateAccount}[0]    ${data}

	#accessToken,PartnerId,AccountId,AccountName,ThingIdArr
    [return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postActivateThingCore}[0]