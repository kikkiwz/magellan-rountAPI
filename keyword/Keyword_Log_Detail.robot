*** Keywords ***	
################################################################-- Have EndPointName --################################################################
#-------------------------------------------- DB --------------------------------------------#	
Check ResponseObject Success DB
    [Arguments]    ${code}    ${description}    ${dataResponse}
	# ${replaceDescription}    Replace String    ${description}    20000:    ${EMPTY}    
	# Log To Console    replaceDescription : : :${replaceDescription}    
	${replaceCode}=    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_WHITELIST_DB}    [statusCode]    ${code}
	Log To Console    replaceCode : : :${replaceCode} 
	${replaceDescription}=    Replace String    ${replaceCode}    [description]    ${description}
	Log To Console    replaceDescription2 : : :${replaceDescription}
	${responseObject}=    Replace String To Object    ${replaceDescription}
	# Log To Console    responseObjectDelta${responseObject}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

##############################################################################################################################################################
		

################################################################-- Do Not Have EndPointName --################################################################
#==========
#Whitelist
#============================================================== RequestObject CreateWhitelist ===============================================================================================#
Check RequestObject App Success CreateWhitelist	
    [Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}


	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}


	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_CREATEWHITELIST}    [valuePathUrl]    ${pathUrl}    
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceAceesToken}=    Replace String    ${replaceTid}    [AccessToken]    ${FIELD_BEARER} ${accessToken}
	${replaceX_Request_Id}=    Replace String    ${replaceAceesToken}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_SpanId}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceBody}=    Replace String    ${replaceX_Ais_SessionId}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

#============================================================== ResponseObject CreateWhitelist Success ===============================================================================================#
Check ResponseObject App Success CreateAWhitelist	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${response}    ${body}    ${accessToken}

	${custom1}=    Set Variable    ${dataResponse['custom1']}   
	${DataresponseObject}=    Set Variable    ${custom1['responseObject']} 
	${responseInfo}=    Evaluate    json.loads(r'''${DataresponseObject}''')    json
	${Info}=    Set Variable    ${responseInfo}[0] 

	${OwnerType}=    Set Variable    ${Info['OwnerType']} 
	Log To Console    OwnerType :${OwnerType}    
	${OwnerId}=    Set Variable    ${Info['OwnerId']} 
	Log To Console    OwnerId :${OwnerId}
	${ThingIdentifier}=    Set Variable    ${Info['ThingIdentifier']} 
	Log To Console    ThingIdentifier :${ThingIdentifier}   
	${GetThingIden}=    Set Variable    ${ThingIdentifier}  
	Log To Console    GetThingIden :${GetThingIden}      
	${resp_json}=    Evaluate    json.loads(r'''${GetThingIden}''')    json
 	Log To Console    resp_json${resp_json}

	${ReplaceThingIdentifier}=    Set Variable    [\\"${resp_json[0]}\\"]

	${replaceDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CREATEWHITELIST}    [StatusDescription]    ${description}  
	${replaceCode}=    Replace String    ${replaceDescription}    [Status]    ${code}
	Log To Console    replaceCode :${replaceCode}
	${replaceThingIdentifier}=    Replace String    ${replaceCode}    [ThingIdentifier]    ${ReplaceThingIdentifier}
	Log To Console    replaceThingIdentifier :${replaceThingIdentifier}
	${replaceOwnerId}=    Replace String    ${replaceThingIdentifier}    [OwnerId]    ${OwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${OwnerType}
	${responseObject}=    Replace String To Object    ${replaceOwnerType}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


#=================================================================================================================================================================================================================================#


#============================================================== ResponseObject CreateWhitelist Error ===============================================================================================#
Check ResponseObject App Success CreateAWhitelist Error  	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}


	${custom1}=    Set Variable    ${dataResponse['custom1']}   
	${DataresponseObject}=    Set Variable    ${custom1['responseObject']} 
	${responseInfo}=    Evaluate    json.loads(r'''${DataresponseObject}''')    json
	${Info}=    Set Variable    ${responseInfo}[0] 
	${ThingIdentifierAlreadyExists}=    Set Variable    ${Info['ThingIdentifierAlreadyExists']} 
	Log To Console    ThingIdentifierAlreadyExists :${ThingIdentifierAlreadyExists}

	${OwnerType}=    Set Variable    ${Info['OwnerType']} 
	Log To Console    OwnerType :${OwnerType}    
	${OwnerId}=    Set Variable    ${Info['OwnerId']} 
	Log To Console    OwnerId :${OwnerId}
	${ThingIdentifier}=    Set Variable    ${Info['ThingIdentifier']} 
	Log To Console    ThingIdentifier :${ThingIdentifier}   
	${GetThingIden}=    Set Variable    ${ThingIdentifier}  
	Log To Console    GetThingIden :${GetThingIden}      
	${resp_json}=    Evaluate    json.loads(r'''${GetThingIden}''')    json
 	Log To Console    resp_json${resp_json}
	

	${ReplaceThingIdentifier}=    Set Variable If    '${ThingIdentifier}'!='null' and '${ThingIdentifier}'!='[]'     [\\"${resp_json[0]}\\"]  
	...    '${ThingIdentifier}'=='null'    null
	...    '${ThingIdentifier}'=='[]'    []
	Log To Console    ReplaceThingIdentifier:${ReplaceThingIdentifier}


	${ReplaceThingIdentifierAlreadyExists}=    Set Variable If    '${ThingIdentifierAlreadyExists}'=='None'    null 
	...    '${ThingIdentifierAlreadyExists}'!='None'    ${ThingIdentifierAlreadyExists}
	Log To Console    ReplaceThingIdentifierAlreadyExists:${ReplaceThingIdentifierAlreadyExists}

	${ReplaceOwnerId}=    Set Variable If    '${OwnerId}'=='None'    null 
	...    '${OwnerId}'!='None'    "${OwnerId}"
	Log To Console    ReplaceOwnerId:${ReplaceOwnerId}


	${ReplaceOwnerType}=    Set Variable If    '${OwnerType}'=='None'    null 
	...    '${OwnerType}'!='None'    "${OwnerType}"
	Log To Console    ReplaceOwnerType:${ReplaceOwnerType}



	${replaceStatusDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CREATEWHITELIST_ERROR}    [StatusDescription]    ${description}  
	${replaceStatus}=    Replace String    ${replaceStatusDescription}    [Status]    ${code}
	${replaceIden}=    Replace String    ${replaceStatus}    [ThingIdentifier]    ${ReplaceThingIdentifier} 
	${replaceIdentifierAlreadyExists}=    Replace String    ${replaceIden}    [ThingIdentifierAlreadyExists]    ${ReplaceThingIdentifierAlreadyExists} 
	${replaceOwnerId}=    Replace String    ${replaceIdentifierAlreadyExists}    [OwnerId]    ${ReplaceOwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${ReplaceOwnerType}
	${responseObject}=    Replace String To Object    ${replaceOwnerType}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}





Check ResponseObject App Success CreateAWhitelist Error ThingIdentifierLessThan19 	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}


	${WhitelistInfo}=    Set Variable    ${response}[0]  
	${OwnerType}=    Set Variable    ${WhitelistInfo['OwnerType']}  
	${OwnerId}=    Set Variable    ${WhitelistInfo['OwnerId']} 
	${ThingIdentifierAlreadyExists}=    Set Variable    ${WhitelistInfo['ThingIdentifierAlreadyExists']} 
	${GetThingIden}=    Set Variable    ${ThingIdentifierAlreadyExists}      
	${resp_json}=    Evaluate    json.loads(r'''${GetThingIden}''')    json
 
	${ReplaceThingIdentifierAlreadyExists}=    Set Variable    [\\"${resp_json[0]}\\"]
	Log To Console    ReplaceThingIdentifierAlreadyExists${ReplaceThingIdentifierAlreadyExists}


	${replaceStatusDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_CREATEWHITELIST_ERRORTHINGIDENTIFIERLESSTHAN19}    [StatusDescription]    ${description}  
	${replaceStatus}=    Replace String    ${replaceStatusDescription}    [Status]    ${code}
	${replaceThingIdentifierAlreadyExists}=    Replace String    ${replaceStatus}    [ThingIdentifierAlreadyExists]    ${ReplaceThingIdentifierAlreadyExists}
	Log To Console    replaceStatus replaceStatus${replaceThingIdentifierAlreadyExists}
	${replaceOwnerId}=    Replace String    ${replaceThingIdentifierAlreadyExists}    [OwnerId]    ${OwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${OwnerType}
	${responseObject}=    Replace String To Object    ${replaceOwnerType}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}




#============================================================== RequestObject UpdateAWhitelist ===============================================================================================#
Check RequestObject App Success UpdateAWhitelist	
    [Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}


	${routeParamteters}=    Set Variable If    '${pathUrl}'=='${URL_UPDATEAWHITELIST_MISSINGOWNERID}'    ${EMPTY}         
	...    '${pathUrl}'!='${URL_UPDATEAWHITELIST_MISSINGOWNERID}'    "routeParamteters":{"OwnerId":"[OwnerId]"},     


 
	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${OwnerId}=    Set Variable    ${resp_jsonReq['routeParamteters']['OwnerId']}


	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_UPDATEAWHITELIST}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceAceesToken}=    Replace String    ${replaceTid}    [AccessToken]    ${FIELD_BEARER} ${accessToken}
	${replaceX_Request_Id}=    Replace String    ${replaceAceesToken}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_SpanId}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceRouteParamteters}=    Replace String    ${replaceX_Ais_SessionId}    [routeParamteters]    ${routeParamteters}
	${replaceOwnerId}=    Replace String    ${replaceRouteParamteters}    [OwnerId]    ${OwnerId}
	${replaceBody}=    Replace String    ${replaceOwnerId}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}




#============================================================== ResponseObject UpdateAWhitelist ===============================================================================================#
Check ResponseObject App Success UpdateAWhitelist	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${response}    ${accessToken}


	${WhitelistInfo}=    Set Variable    ${response['WhitelistInfo']} 
	${ThingIdentifier}=    Set Variable    ${WhitelistInfo['ThingIdentifier']}     
	${OwnerId}=    Set Variable    ${WhitelistInfo['OwnerId']}    
	${OwnerType}=    Set Variable    ${WhitelistInfo['OwnerType']} 
	${WhitelistId}=    Set Variable    ${WhitelistInfo['WhitelistId']} 


	${replaceDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_UPDATEAWHITELIST}    [DeveloperMessage]    ${description}  
	${replaceCode}=    Replace String    ${replaceDescription}    [Code]    ${code}
	${replaceThingIdentifier}=    Replace String    ${replaceCode}    [ThingIdentifier]    ${ThingIdentifier}[0]
	${replaceOwnerId}=    Replace String    ${replaceThingIdentifier}    [OwnerId]    ${OwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${OwnerType}
	${replaceWhitelistId}=    Replace String    ${replaceOwnerType}    [WhitelistId]    ${WhitelistId}
	${responseObject}=    Replace String To Object    ${replaceWhitelistId}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


#=================================================================================================================================================================================================================================#







#============================================================== RequestObject DeleteAWhitelist ===============================================================================================#

Check RequestObject App Success DeleteAWhitelist	
    [Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}

	${ForReplacerouteParamteters}=    Set Variable If    '${pathUrl}'=='${URL_DELETEAWHITELIST_MISSINGOWNERID}'    ${EMPTY}         
	...    '${pathUrl}'!='${URL_DELETEAWHITELIST_MISSINGOWNERID}'    "routeParamteters":{"OwnerId":"[OwnerId]"},     

	
	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${OwnerId}=    Set Variable    ${resp_jsonReq['routeParamteters']['OwnerId']}



	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_DELETEAWHITELIST}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}   
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for} 
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceAceesToken}=    Replace String    ${replaceTid}    [AccessToken]    ${FIELD_BEARER} ${accessToken}
	${replaceX_Request_Id}=    Replace String    ${replaceAceesToken}    [x-request-id]    ${X_Request_Id}   
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_SpanId}    [x-ais-SessionId]    ${X_Ais_SessionId} 
	${replaceRouteParamteters}=    Replace String    ${replaceX_Ais_SessionId}    [routeParamteters]    ${ForReplacerouteParamteters} 
	${replaceOwnerId}=    Replace String    ${replaceRouteParamteters}    [OwnerId]    ${OwnerId}
	${replaceBody}=    Replace String    ${replaceOwnerId}    [body]    ${body} 
	${requestObject}=    Replace String To Object    ${replaceBody}
	Log To Console    requestObject:${requestObject}   
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}


#=================================================================================================================================================================================================================================#


#============================================================== RequestObject Return A list Of Whitelist ===============================================================================================#
Check RequestObject App Success Return A list Of Whitelist 	
	[Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}

	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${queryString}=    Set Variable    ${resp_jsonReq['queryString']}

	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_RETURNSALISTOFWHITELIST}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceAceesToken}=    Replace String    ${replaceTid}    [AccessToken]    ${FIELD_BEARER} ${accessToken}
	${replaceX_Request_Id}=    Replace String    ${replaceAceesToken}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_SpanId}    [x-ais-SessionId]    ${X_Ais_SessionId}
	# ${replaceBody}=    Replace String    ${replaceX_Ais_SessionId}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceX_Ais_SessionId}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}




Check RequestObject App Success RouteNotFound	
    [Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}


	${GetLength_Tid}=    Get Length    ${tid}  
	Log To Console    GetLength_Tid${GetLength_Tid} 

	${VALUE_LOG}=    Set Variable If    '${GetLength_Tid}'=='34'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_DELETEAWHITELIST_MISSING}    
	...    '${GetLength_Tid}'=='35'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_UPDATEAWHITELIST_MISSING}    



	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	

	${replaceUrl}=    Replace String    ${VALUE_LOG}    [valuePathUrl]    ${pathUrl}  
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for} 
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceAceesToken}=    Replace String    ${replaceTid}    [AccessToken]    ${FIELD_BEARER} ${accessToken}
	${replaceX_Request_Id}=    Replace String    ${replaceAceesToken}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_SpanId}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceBody}=    Replace String    ${replaceX_Ais_SessionId}    [body]    ${body}
	${requestObject}=    Replace String To Object    ${replaceBody}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}




#============================================================== RequestObject Get A Whitelist By Thing Identifier ===============================================================================================#


Check RequestObject App Success Get A Whitelist By Thing Identifier 	
	[Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}


	${routeParamteters}=    Set Variable If    '${pathUrl}'=='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'    ${EMPTY}         
	...    '${pathUrl}'!='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'    ,"routeParamteters":{"ThingIdentifier":"[ThingIdentifier]"} 

	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
 

	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${queryString}=    Set Variable    ${resp_jsonReq['queryString']}
	${ThingIdentifier}=    Set Variable If    '${pathUrl}'!='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'     ${resp_jsonReq['routeParamteters']['ThingIdentifier']}
	...    '${pathUrl}'=='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'    ${EMPTY}    


	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_GETAWHITELISTBYTHINGIDENTIFIER}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceAceesToken}=    Replace String    ${replaceTid}    [AccessToken]    ${FIELD_BEARER} ${accessToken}
	${replaceX_Request_Id}=    Replace String    ${replaceAceesToken}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_SpanId}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${replaceRouteParamteters}=    Replace String    ${replaceX_Ais_SessionId}    [routeParamteters]    ${routeParamteters}
	${replaceThingIdentifier}=    Replace String    ${replaceRouteParamteters}    [ThingIdentifier]    ${ThingIdentifier}
	${requestObject}=    Replace String To Object    ${replaceThingIdentifier}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}



Check RequestObject RouteNotFound Get A Whitelist By Thing Identifier 	
	[Arguments]    ${dataResponse}    ${pathUrl}   ${accessToken}    ${tid}    ${body}
 

	${listAsString}=    Evaluate    json.dumps(${dataResponse})    json
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
    ${resp_jsonReq}=    Evaluate    ${resp_json['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
	Log To Console    resp_jsonReq:${resp_jsonReq}    

	${X_Request_Id}=    Set Variable    ${resp_jsonReq['headers']['x-request-id']}
	${X_B3_TraceId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-traceid']}
	${X_B3_SpanId}=    Set Variable    ${resp_jsonReq['headers']['x-b3-spanid']}
	${X_Ais_SessionId}=    Set Variable    ${resp_jsonReq['headers']['x-ais-SessionId']}
	${Content_Length}=    Set Variable    ${resp_jsonReq['headers']['Content-Length']}
	${X_Real_Ip}=    Set Variable    ${resp_jsonReq['headers']['x-real-ip']}
	${X_ForWarded_for}=    Set Variable    ${resp_jsonReq['headers']['x-forwarded-for']}
	${queryString}=    Set Variable    ${resp_jsonReq['queryString']}


	${replaceUrl}=    Replace String    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_GETAWHITELISTBYTHINGIDENTIFIER_ROUNTNOTFOUND}    [valuePathUrl]    ${pathUrl}
	${replaceContent_Length}=    Replace String    ${replaceUrl}    [Content-Length]    ${Content_Length}
	${replaceX_Real_Ip}=    Replace String    ${replaceContent_Length}    [x-real-ip]    ${X_Real_Ip}
	${replaceX_ForWarded_for}=    Replace String    ${replaceX_Real_Ip}    [x-forwarded-for]    ${X_ForWarded_for}
	${replaceTid}=    Replace String    ${replaceX_ForWarded_for}    [tid]    ${tid}
	${replaceAceesToken}=    Replace String    ${replaceTid}    [AccessToken]    ${FIELD_BEARER} ${accessToken}
	${replaceX_Request_Id}=    Replace String    ${replaceAceesToken}    [x-request-id]    ${X_Request_Id}
	${replaceX_B3_TraceId}=    Replace String    ${replaceX_Request_Id}    [x-b3-traceid]    ${X_B3_TraceId}
	${replaceX_B3_SpanId}=    Replace String    ${replaceX_B3_TraceId}    [x-b3-spanid]    ${X_B3_SpanId}
	${replaceX_Ais_SessionId}=    Replace String    ${replaceX_B3_SpanId}    [x-ais-SessionId]    ${X_Ais_SessionId}
	${requestObject}=    Replace String To Object    ${replaceX_Ais_SessionId}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}




Check ResponseObject App Get A Whitelist By Thing Identifier	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${response}    ${accessToken}


	${custom1}=    Set Variable    ${dataResponse['custom1']}   
	${DataresponseObject}=    Set Variable    ${custom1['responseObject']} 
	Log To Console  DataresponseObject : ${DataresponseObject}
	${responseInfo}=    Evaluate    json.loads(r'''${DataresponseObject}''')    json
 	Log To Console    responseInfo${responseInfo}
	${WhitelistInfo}=    Set Variable    ${responseInfo['WhitelistInfo']} 
	Log To Console  WhitelistInfo : ${WhitelistInfo}
	${CreatedDatetime}=    Set Variable    ${WhitelistInfo['CreatedDatetime']} 
	Log To Console  CreatedDatetime : ${CreatedDatetime}
	${LastUpdatedTimestamp}=    Set Variable    ${WhitelistInfo['LastUpdatedTimestamp']} 
	Log To Console  LastUpdatedTimestamp : ${LastUpdatedTimestamp}

	

	${WhitelistInfo}=    Set Variable    ${response['WhitelistInfo']} 
	${ThingIdentifier}=    Set Variable    ${WhitelistInfo['ThingIdentifier']}   
	Log To Console    ThingIdentifier:${ThingIdentifier}      
	${OwnerId}=    Set Variable    ${WhitelistInfo['OwnerId']}  
	Log To Console    OwnerId:${OwnerId}   
	${OwnerType}=    Set Variable    ${WhitelistInfo['OwnerType']} 
	Log To Console    OwnerType:${OwnerType} 
	${WhitelistId}=    Set Variable    ${WhitelistInfo['WhitelistId']} 
	Log To Console    WhitelistId:${WhitelistId} 
 


	${replaceDescription}    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_GETAWHITELISTBYTHINGIDENTIFIER}    [DeveloperMessage]    ${description}  
	${replaceCode}=    Replace String    ${replaceDescription}    [Code]    ${code}
	${replaceCreatedDatetime}=    Replace String    ${replaceCode}    [CreatedDatetime]    ${CreatedDatetime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDatetime}    [LastUpdatedTimestamp]    ${LastUpdatedTimestamp}
	${replaceThingIdentifier}=    Replace String    ${replaceLastUpdatedTimestamp}    [ThingIdentifier]    ${ThingIdentifier}[0]
	${replaceOwnerId}=    Replace String    ${replaceThingIdentifier}    [OwnerId]    ${OwnerId}
	${replaceOwnerType}=    Replace String    ${replaceOwnerId}    [OwnerType]    ${OwnerType}
	${replaceWhitelistId}=    Replace String    ${replaceOwnerType}    [WhitelistId]    ${WhitelistId}
	${responseObject}=    Replace String To Object    ${replaceWhitelistId}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

#=================================================================================================================================================================================================================================#

Converting a JSON File
	[Arguments]    ${payload}
    ${MY_DATA_TABLE_VALUES}    evaluate  json.loads('''${payload}''')    json
    [Return]  ${MY_DATA_TABLE_VALUES}

Delta Case1
    [Arguments]    ${payload}
    ${requestObject}=    Convert JSON To String    ${payload}
	[Return]  ${requestObject}