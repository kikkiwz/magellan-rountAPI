*** Settings ***
Resource    ../../variables/Variables.robot    
Resource    ../../keyword/Keyword.robot

#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
SaveHistory_TST_F1_0_3_007_Error_TimestampInvalidFormat 
    [Documentation]    Step is :    
	...		1.Signin
	...		2.Create Partner
	...		3.Create Account
	...		4.Create Thing
	...		5.SaveHistory
	...		6.Remove Thing
	...		7.Remove Account
	...	    8.Remove Partner

	#====== Start Prepare data ==========
    
    # Prepare data for create thing
	${valArrData}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore    1
	Log To Console    valArrData is : ${valArrData}
	${GetData}=    Set Variable    ${valArrData}[0]   
	Log To Console    GetData is : ${GetData} 


	${ThingName}=    Set Variable    ${GetData['ThingName']}  
	${ICCID}=    Set Variable    ${GetData['ThingIdentifier']}  
	${IMEI}=    Set Variable    ${GetData['IMEI']}  

	# Prepare data for Request CreateData
	# [accessToken,PartnerId,AccountId,AccountName,ThingIdArr]
	${createResponse}=    Request CreateData for Signin Partner Account ImportThing MappingIMEI and ActivateThingCore    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}    ${valArrData}
	Log To Console    createResponse is : ${createResponse}

	${accessToken}=    Set Variable    ${createResponse}[0]
    Log To Console    AccessToken is : ${accessToken}

	${AccountId}=    Set Variable    ${createResponse}[2]
    Log To Console    AccountId is : ${AccountId}

    ${ThingIdArr}=    Set Variable    ${createResponse}[4]
    Log To Console    ThingId is : ${ThingIdArr}[0]

    #====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_SAVEHISTORY_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_SAVEHISTORY}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
	

	#Body
    ${body}=    Evaluate    {"ThingInfo":{"ThingId":"${ThingIdArr}[0]","ThingName":"${ThingName}","ICCID":"${ICCID}","IMEI":"${IMEI}","QuasarContentType":"${VALUE_SAVEHISTORY_QUASARCONTENTTYPE_REFRESH}","QuasarRefreshTime":"${VALUE_SAVEHISTORY_QUASARREFRESHTIME_0}"},"EventType":"${VALUE_SAVEHISTORY_EVENTTYPE_REPORT}","Sensors":{"GPS":"${VALUE_SAVEHISTORY_GPS}"},"Timestamp":"${VALUE_SAVEHISTORY_TIMESTAMP_XXXXXXXXXXX}"}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${QUASAR}    ${URL_SAVEHISTORY}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${SAVESHISTORY}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}
   
    
    [Teardown]    Generic Test Case Teardown    ${PARTNERACCOUNTTHINGARRCORE}    ${createResponse}    null
    


