*** Keywords ***	
Post Search Log
    [Arguments]    ${url}    ${valueSearch}    ${value_applicationName}    
	${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    Authorization=${HEADER_AUTHENTICATION}    kbn-version=7.5.1  
    #${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    Host=azmagellancd001-iot.southeastasia.cloudapp.azure.com:30380    kbn-version=7.5.1    Origin=http://azmagellancd001-iot.southeastasia.cloudapp.azure.com:30380    
	#Log To Console    ${headers}
	
	#return valueDateGte,valueDateLte (RANGE_SEARCH 15 minutes)
	${setRange}=    Rang Get Value Minus Time Current Date and Change Format    ${YYYYMMDDTHMSZ_FROM_NOW}    ${RANGE_SEARCH}    ${TIME_STRING_MINUTES}
	#${setRange}=    Rang Get Value Minus Time Current Date and Change Format    ${YYYYMMDDTHMSZ_FROM_NOW}    50    ${TIME_STRING_MINUTES}
	#Log To Console    setRange${setRange}
	${setRangeGTE}=    Set variable    ${setRange}[0]
	${setRangeLTE}=    Set variable    ${setRange}[1]
	#Log To Console    setRangeGTE${setRangeGTE}
	#Log To Console    setRangeLTE${setRangeLTE}

	# Log To Console    valueSearch${valueSearch}
	
	${multiMatchType}=    Set Variable    phrase
	# ${multiMatchType}=    Set Variable If    '${valueSearch}'=='${ASGARD_COAPAPI_VALUE_TST_F4_0_2_003_DATASEARCH}'    phrase
    # ...    '${value_applicationName}'=='${VALUE_APPLICATIONNAME_CHARGING}'    phrase	
	# ...    '${valueSearch}'!='${ASGARD_COAPAPI_VALUE_TST_F4_0_2_003_DATASEARCH}'    best_fields	
	
    ${data}=    Evaluate    {"version":"true","size":500,"sort":[{"@timestamp_es":{"order":"desc","unmapped_type":"boolean"}}],"_source":{"excludes":[]},"aggs":{"2":{"date_histogram":{"field":"@timestamp_es","fixed_interval":"30s","time_zone":"Asia/Bangkok","min_doc_count":1}}},"stored_fields":["*"],"script_fields":{},"docvalue_fields":[{"field":"@timestamp_es","format":"date_time"},{"field":"cauldron.custom1.activityLog.endTime","format":"date_time"},{"field":"cauldron.custom1.activityLog.startTime","format":"date_time"},{"field":"time","format":"date_time"}],"query":{"bool":{"must":[],"filter":[{"multi_match":{"type":"${multiMatchType}","query":"${valueSearch}","lenient":"true"}},{"range":{"@timestamp_es":{"format":"strict_date_optional_time","gte":"${setRangeGTE}","lte":"${setRangeLTE}"}}}],"should":[],"must_not":[]}},"highlight":{"pre_tags":["@kibana-highlighted-field@"],"post_tags":["@/kibana-highlighted-field@"],"fields":{"*":{}},"fragment_size":2147483647}}
    # Log To Console    ${data}
	#Log To Console    ${url}
    ${res}=    Post Api Request    ${url}    ${EMPTY}    ${headers}    ${data}
	Log    ${res}
	Sleep    10s
	[return]    ${res}


#==============================================================================================================================================================================================================================#
Get tid for Search Log
    [Arguments]    ${value_applicationName}    ${imsi_thingToken}    ${endPointName}
	#Log To Console    value_applicationName${value_applicationName}	
	#Log To Console    imsi_thingToken${imsi_thingToken}	
	${resLog}=    Post Search Log    ${URL_GET_LOG}    ${imsi_thingToken}    ${value_applicationName}
	Sleep    10s
	Log    resLog${resLog}	
	${total}=    Set variable    ${resLog['hits']['total']}
	# Log To Console    resLog${resLog}  
	# Log To Console    total${total}  
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${total}
        # Log To Console    ${i}  
	    ${valLog}=    Set variable    ${resLo g['hits']['hits'][${i}]['_source']['cauldron']}
        # Log To Console    applicationName${valLog['applicationName']}
        # Log To Console    valLog${valLog}
		
	    ${applicationName}=    Set variable    ${valLog['applicationName']}
        # Log To Console    applicationName${applicationName}
  
		Run Keyword If    '${applicationName}'=='${value_applicationName}'     Append To List    ${valArrData}    ${valLog}        #Add data to array set at valArrData
		# Run Keyword If    '${imsi_thingToken}'=='${ASGARD_COAPAPI_VALUE_TST_F4_0_2_003_DATASEARCH}'    Append To List    ${valArrData}    ${valLog}        #Add data to array set at valArrData
		
        # Exit For Loop
	END
	#Log To Console    tivalArrDatad${valArrData}
    ${tid}=    Set variable    ${valArrData[0]['tid']}
	Log To Console    tid${tid}
	${sessionId}=    Set variable    ${valArrData[0]['sessionId']}
	Log To Console    sessionId${sessionId}
    [return]    ${tid}    ${sessionId}


#==============================================================================================================================================================================================================================#
Data Log Response
    [Arguments]    ${value_applicationName}    ${imsi_thingToken}    ${endPointName}
	
	Sleep    4s
	${resTid}=    Get tid for Search Log    ${value_applicationName}    ${imsi_thingToken}    ${endPointName}
	
	${getTidSessionId}=    Set Variable If	'${value_applicationName}'=='${VALUE_APPLICATIONNAME_CHARGING}'    ${resTid}[1]    
	...    '${value_applicationName}'!='${VALUE_APPLICATIONNAME_CHARGING}'    ${resTid}[0]
	# ${resTid}=    Get tid for Search Log    ${value_applicationName}    ${imsi_thingToken}    ${endPointName}
	# Log To Console    resTid${resTid}	
	#Log To Console    getTidSessionId${getTidSessionId}	
   
	${resLog}=    Post Search Log    ${URL_GET_LOG}    ${getTidSessionId}    ${value_applicationName}
    Log    resLog${resLog}	
	Sleep    10s
		
	${total}=    Set variable    ${resLog['hits']['total']}
	# Log To Console    total${total}
	
    @{valArrData}=    Create List
	@{valArrDetail}=    Create List
	@{valArrSummary}=    Create List
	FOR    ${i}    IN RANGE    ${total}
        # Log To Console    ${i}  
	    ${valLog}=    Set variable    ${resLog['hits']['hits'][${i}]['_source']['log']}
        # Log To Console    valLog${valLog}

        # r use for parameter / have in data 
	    ${dataResponse}=    Evaluate    json.loads(r'''${valLog}''')    json
        # Log To Console    dataRespon/se${dataResponse}
	
	    ${applicationName}=    Set variable    ${dataResponse['applicationName']}
        # Log To Console    applicationName${applicationName}
		${logType}=    Set variable    ${dataResponse['logType']}
        # Log To Console    logType${logType}

	    Run Keyword If    '${applicationName}'=='${value_applicationName}'    Append To List    ${valArrData}    ${dataResponse}    #Add data to array set at valArrData
		Run Keyword If    '${applicationName}'=='${value_applicationName}' and '${logType}'=='${VALUE_DETAIL}'   Append To List    ${valArrDetail}    ${dataResponse}    #Add data to array set at valArrDetail
		Run Keyword If    '${applicationName}'=='${value_applicationName}' and '${logType}'=='${VALUE_SUMMARY}'   Append To List    ${valArrSummary}    ${dataResponse}    #Add data to array set at valArrSummary
		
    END
	# Log To Console    valArrData${valArrData}  
	Log To Console    valArrDetail${valArrDetail}  
	Log To Console    valArrSummary${valArrSummary}  
    [return]    ${valArrData}    ${valArrDetail}    ${valArrSummary}    ${resTid}[0]    ${resTid}[1]


#==============================================================================================================================================================================================================================#
Check Log Detail 
    [Arguments]    ${code}    ${description}     ${data}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${customDetailDB}    ${responseObjectDetail}   

   
	
	${dataLogDetail}=    Run keyword And Continue On Failure    Log Detail Check EndPointName    ${data}
    Log    ${dataLogDetail}    
	#value ArrDetail Have EndPointName
	${valArrDetailHaveEndPointName}=    Set Variable    ${dataLogDetail}[0]
	#value ArrDetail Not Have EndPointName
	${valArrDetailNotHaveEndPointName}=    Set Variable    ${dataLogDetail}[1]

	# Log To Console    valArrDetailHaveEndPointName${valArrDetailHaveEndPointName}  
	# Log To Console    valArrDetailNotHaveEndPointName${valArrDetailNotHaveEndPointName}  
	
	# ${thingToken}=    Check Log Detail Have EndPointName    ${code}    ${description}     ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${urlCmdName}    ${dataSearch}    ${ipAddress}    ${body}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}
    Run Keyword If    '${code}'!='${VALUE_LOG_CODE_40000}'    Check Log Detail Have EndPointName    ${code}    ${description}     ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
	
	# Run Keyword If    '${code}'!='${VALUE_LOG_CODE_40000}'    Check Log Detail Have EndPointName    ${code}    ${description}     ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
	# Run Keyword If    '${applicationName}'!='${VALUE_APPLICATIONNAME_COAPAPI}'    Check Log Detail Have EndPointName    ${code}    ${description}     ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${urlCmdName}    ${dataSearch}    ${ipAddress}    ${payload_body}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}
    Check Log Detail App Do Not Have EndPointName    ${code}    ${description}     ${valArrDetailNotHaveEndPointName}    ${tid}    ${applicationName}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${body}    ${accountId}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
                                                  
	#Log To Console    thingTokenthingToken${thingToken} 	
	# [Return]    ${thingToken}


#==============================================================================================================================================================================================================================#
Log Detail Check EndPointName
    [Arguments]    ${data}
	${data_count}=    Get Length    ${data}
	#Log To Console    data_count${data_count}
    @{valArrDetailHaveEndPointName}=    Create List
	@{valArrDetailNotHaveEndPointName}=    Create List
    FOR    ${i}    IN RANGE    ${data_count}
	    ${keyCustom1}=    Set Variable   @{data[${i}]['custom1']}
		# Log To Console    ${keyCustom1}    
		${checkKeyEndPointName}=    Get Matches    ${keyCustom1}    endPointName
		${countKeyEndPointName}=    Get Length    ${checkKeyEndPointName}
		#Log To Console    checkKeyEndPointName${checkKeyEndPointName} 
		#Log To Console    countKeyEndPointName${countKeyEndPointName} 
		Run Keyword If    ${countKeyEndPointName}==1    Append To List    ${valArrDetailHaveEndPointName}    ${data}[${i}]    #Add data to array set at valArrData
		Run Keyword If    ${countKeyEndPointName}==0    Append To List    ${valArrDetailNotHaveEndPointName}    ${data}[${i}]    #Add data to array set at valArrData
		
		#${data[${i}]['custom1']['endPointName']}
	END	
	# Log To Console    valArrDetailHaveEndPointName${valArrDetailHaveEndPointName}  
	# Log To Console    valArrDetailNotHaveEndPointName${valArrDetailNotHaveEndPointName}  
	[return]    ${valArrDetailHaveEndPointName}    ${valArrDetailNotHaveEndPointName}

#==============================================================================================================================================================================================================================#
#-------------------------------------------- Check Log Detail Have EndPointName --------------------------------------------#	

Check Log Detail Have EndPointName  
    [Arguments]    ${code}    ${description}    ${data}    ${tid}    ${applicationName}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
        

	
    ${data_count}=    Get Length    ${data}
	# Log To Console    data_count${data_count}  
	# Log To Console    data${data} 
	# ${thingToken}=    Set Variable


	FOR    ${i}    IN RANGE    ${data_count}
		#Log To Console    ${data[${i}]['custom1']['requestObject']}
		#Log To Console    ${data[${i}]['custom1']['endPointName']}
		#Log To Console    ${code}
	    ${dataResponse}=    Set Variable    ${data[${i}]}
		# Log To Console    dataResponse${dataResponse}  
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}']    ${data[${i}]['systemTimestamp']}    ${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGTYPE}']    ${VALUE_DETAIL}    ${FIELD_LOG_DETAIL_LOGTYPE} 
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGLEVEL}']    ${logLevel}    ${FIELD_LOG_DETAIL_LOGLEVEL} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_NAMESPACE}']    ${namespace}    ${FIELD_LOG_DETAIL_NAMESPACE}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_APPLICATIONNAME}']    ${applicationName}    ${FIELD_LOG_DETAIL_APPLICATIONNAME}
		#Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CONTAINERID}']    ${containerId}    ${FIELD_LOG_DETAIL_CONTAINERID}
        # Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SESSIONID}']    ${tid}    ${FIELD_LOG_DETAIL_SESSIONID}
		Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_TID}']    ${tid}    ${FIELD_LOG_DETAIL_TID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}']    ${data[${i}]['custom1']['activityLog']['startTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}']    ${data[${i}]['custom1']['activityLog']['endTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}']    ${data[${i}]['custom1']['activityLog']['processTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM2}']    ${VALUE_LOG_DETAIL_CUSTOM2}    ${FIELD_LOG_DETAIL_CUSTOM2}
    
		# Run Keyword If    '${data[${i}]['custom1']['endPointName']}'=='${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}' and '${custom}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}    ['endPointName']

		#Check endPointName
		#Check requestObject responseObjects
        ${json_customDetailDB}=    Convert String to JSON    ${customDetailDB}
		Log To Console    json_custom${json_customDetailDB}
		${json_endPointName}=    Convert String to JSON    ${endPointName}
		Log To Console    json_endPointName${json_endPointName}  
		  
		${dataCustomDetailDB}=    Set Variable    ${json_customDetailDB['endPointSummary'][${i}]}
		Log To Console    dataCustomDetailDB${dataCustomDetailDB}  
		${dataEndPointName}=    Set Variable    ${json_endPointName[${i}]}
		Log To Console    dataEndPointName${dataEndPointName}  
		Check Log Detail Custom RequestObject and ResponseObject DB    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${dataEndPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${dataCustomDetailDB}    ${responseObjectDetail} 
																	  
	END

#==============================================================================================================================================================================================================================#
#-------------------------------------------- Check Log Detail : RequestObject and ResponseObject Have EndPointName --------------------------------------------#		
Check Log Detail Custom RequestObject and ResponseObject DB
	[Arguments]    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${dataEndPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${dataCustomDetailDB}    ${responseObjectDetail} 
	
	

	#endPointName : Create A Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${dataEndPointName}    ['endPointName']
    #RequestObject : Create A Whitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['requestObject']    ${VALUE_LOG_DETAIL_REQUESTOBJECT_WHITELIST_DB}    requestObject    
    # #ResponseObject : Create A Whitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}'    Check ResponseObject Success DB    ${STATUS_CODE_SUCCESS}    ${VALUE_DESCRIPTION_SUCCESS}    ${dataResponse}


	#endPointName : Update A Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${dataEndPointName}    ['endPointName']
    #RequestObject : Update A Whitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['requestObject']    ${VALUE_LOG_DETAIL_REQUESTOBJECT_WHITELIST_DB}    requestObject    
    # #ResponseObject : Update A Whitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}'    Check ResponseObject Success DB    ${STATUS_CODE_SUCCESS}    ${VALUE_DESCRIPTION_SUCCESS}    ${dataResponse}


	#endPointName :  Update A Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${dataEndPointName}    ['endPointName']
    #RequestObject : Update A Whitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['requestObject']    ${VALUE_LOG_DETAIL_REQUESTOBJECT_WHITELIST_DB}    requestObject    
    # #ResponseObject : Update A Whitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}'    Check ResponseObject Success DB    ${STATUS_CODE_SUCCESS}    ${VALUE_DESCRIPTION_SUCCESS}    ${dataResponse}



	#endPointName: Return a list of Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWHITELIST}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${dataEndPointName}    ['endPointName']
    #RequestObject: Return a list of Whitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWHITELIST}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['requestObject']    ${VALUE_LOG_DETAIL_REQUESTOBJECT_WHITELIST_DB}    requestObject    
    #ResponseObject: Return a list of Whitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWHITELIST}'    Check ResponseObject Success DB    ${STATUS_CODE_SUCCESS}    ${VALUE_DESCRIPTION_SUCCESS}    ${dataResponse}


	#endPointName: Get a Whitelist by Thingidentifier
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${dataEndPointName}    ['endPointName']
    #RequestObject: Get a Whitelist by Thingidentifier
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['requestObject']    ${VALUE_LOG_DETAIL_REQUESTOBJECT_WHITELIST_DB}    requestObject    
    #ResponseObject: Get a Whitelist by Thingidentifier
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}'    Check ResponseObject Success DB    ${STATUS_CODE_SUCCESS}    ${VALUE_DESCRIPTION_SUCCESS}    ${dataResponse}



	#endPointName: DeleteAWhitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${dataEndPointName}    ['endPointName']
    #RequestObject: DeleteAWhitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['requestObject']    ${VALUE_LOG_DETAIL_REQUESTOBJECT_WHITELIST_DB}    requestObject    
    #ResponseObject: DeleteAWhitelist
    Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}'    Check ResponseObject Success DB    ${STATUS_CODE_SUCCESS}    ${VALUE_DESCRIPTION_SUCCESS}    ${dataResponse}





#==============================================================================================================================================================================================================================#
#-------------------------------------------- Check Log Detail Do Not Have EndPointName --------------------------------------------#		
Check Log Detail App Do Not Have EndPointName
    [Arguments]    ${code}    ${description}     ${data}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${body}    ${accountId}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

	

    ${data_count}=    Get Length    ${data}
	#Log To Console    data_count${data_count}  
	FOR    ${i}    IN RANGE    ${data_count}
	 
	    ${dataResponse}=    Set Variable    ${data[${i}]}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}']    ${data[${i}]['systemTimestamp']}    ${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGTYPE}']    ${VALUE_DETAIL}    ${FIELD_LOG_DETAIL_LOGTYPE}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGLEVEL}']    ${logLevel}    ${FIELD_LOG_DETAIL_LOGLEVEL}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_NAMESPACE}']    ${namespace}    ${FIELD_LOG_DETAIL_NAMESPACE}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_APPLICATIONNAME}']    ${applicationName}    ${FIELD_LOG_DETAIL_APPLICATIONNAME}
		#Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CONTAINERID}']    ${containerId}    ${FIELD_LOG_DETAIL_CONTAINERID}
		## Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SESSIONID}']    ${tid}    ${FIELD_LOG_DETAIL_SESSIONID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_TID}']    ${tid}    ${FIELD_LOG_DETAIL_TID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}']    ${data[${i}]['custom1']['activityLog']['startTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}']    ${data[${i}]['custom1']['activityLog']['endTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}']    ${data[${i}]['custom1']['activityLog']['processTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM2}']    ${VALUE_LOG_DETAIL_CUSTOM2}    ${FIELD_LOG_DETAIL_CUSTOM2}

		Check Log Detail Custom RequestObject and ResponseObject App    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${EndPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
		                                                               
	END

#==============================================================================================================================================================================================================================#

#-------------------------------------------- Check Log Detail : RequestObject and ResponseObject --------------------------------------------#		
Check Log Detail Custom RequestObject and ResponseObject App
	[Arguments]    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${endPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${customDetailDB}    ${responseObjectDetail}

	${GetLength_Des}=    Get Length    ${responseObjectDetail}        
	Log To Console    GetLength_Des:::${GetLength_Des}  

	#-------------------------------------------- Create Whitelist --------------------------------------------#
    #RequestObject : Create Whiitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}'    Check RequestObject App Success CreateWhitelist    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	# # #ResponseObject : Create Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_40000}' and '${GetLength_Des}'=='4'    Check ResponseObject App Success CreateAWhitelist Error    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}    
	# # #ResponseObject : Create Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_40400}' and '${GetLength_Des}'=='4'    Check ResponseObject App Success CreateAWhitelist Error ThingIdentifierLessThan19     ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}    
	#ResponseObject : Create Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_20000}' and '${GetLength_Des}'=='4'    Check ResponseObject App Success CreateAWhitelist    ${code}    ${description}    ${dataResponse}    ${response}    ${body}    ${accessToken}    

	#RequestObject : Update Whiitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}'    Check RequestObject App Success UpdateAWhitelist    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	#ResponseObject : Update Whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success UpdateAWhitelist    ${code}    ${description}    ${dataResponse}    ${response}    ${accessToken}    
    
	
	#RequestObject : RouteNotFound
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'!='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'    Check RequestObject App Success RouteNotFound    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	#RequestObject : RouteNotFound
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}' and '${pathUrl}'=='${URL_GETAWHITELISTBYTHINGIDENTIFIER_NULLTHINGIDENTIFIER}'     Check RequestObject RouteNotFound Get A Whitelist By Thing Identifier    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}


	#RequestObject : Return a list of whitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_RETURNSALISTOFWHITELIST}'    Check RequestObject App Success Return A list Of Whitelist    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	
	
	#RequestObject : Get A Whitelist By Thing Identifier
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}'    Check RequestObject App Success Get A Whitelist By Thing Identifier    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	#ResponseObject : Get A Whitelist By Thing Identifier
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAWHITELISTBYTHINGIDENTIFIER}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Get A Whitelist By Thing Identifier    ${code}    ${description}    ${dataResponse}    ${response}    ${accessToken}
	

	#RequestObject : Delete Whiitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}'    Check RequestObject App Success DeleteAWhitelist    ${dataResponse}    ${pathUrl}    ${accessToken}    ${tid}    ${body}
	#RequestObject : Delete Whiitelist
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}' and '${code}'=='${VALUE_LOG_CODE_20000}' and '${GetLength_Des}'=='4'    Check ResponseObject Success    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    ${code}    ${description}    ${dataResponse}
	
	
	# # #ResponseObject : [Error !20000]
    Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${code}'!='${VALUE_LOG_CODE_40000}' and '${code}'!='${VALUE_LOG_CODE_40400}' and '${GetLength_Des}'=='4'    Check ResponseObject Error    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}
    Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${code}'!='${VALUE_LOG_CODE_40000}' and '${code}'!='${VALUE_LOG_CODE_40400}' and '${GetLength_Des}'!='4'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	
	
	Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${GetLength_Des}'=='4' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}'    Check ResponseObject Error    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}
	Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${GetLength_Des}'=='4' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_ROUTENOTFOUND}'    Check ResponseObject Error    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}
	Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${GetLength_Des}'!='4' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAWHITELIST}'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}

	Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${GetLength_Des}'!='4' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${GetLength_Des}'=='4' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAWHITELIST}'    Check ResponseObject Error    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}

#==============================================================================================================================================================================================================================#
#--------------------------------------------  ResponseObject Success Have Code and Description --------------------------------------------#
Check ResponseObject Success
    [Arguments]    ${value}    ${code}    ${description}    ${dataResponse}
	
	# ${code}=    Set Variable    ${code}

	${replaceCodeCmdName}=    Replace String    ${value}    [Code]    ${code}
	${replaceDescriptionCmdName}=    Replace String    ${replaceCodeCmdName}    [DeveloperMessage]    ${description}

	${responseObject}=    Replace String To Object    ${replaceDescriptionCmdName}
	# Log To Console    responseObjectError${responseObject}
			
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


#--------------------------------------------  ResponseObject Error Not Have EndPointName --------------------------------------------#
Check ResponseObject Error  
    [Arguments]    ${value}    ${code}    ${description}    ${dataResponse}

	Log To Console    ResponseObject Error
	
	# ${code}=    Set Variable    ${code}
	# ${code} =	Set Variable If    '${code}'=='${VALUE_LOG_CODE_40300}'    ${VALUE_LOG_CODE_40400}
	# ...    '${code}'!='${VALUE_LOG_CODE_40300}'    ${code}
	# Log To Console    code${code}
	# Log To Console    description${description}
	# Log To Console    dataResponse${dataResponse}

	${replaceCodeCmdName}=    Replace String    ${value}    [Code]    ${code}
	${replaceDescriptionCmdName}=    Replace String    ${replaceCodeCmdName}    [DeveloperMessage]    ${description}

	${responseObject}=    Replace String To Object    ${replaceDescriptionCmdName}
	# Log To Console    responseObjectError${responseObject}
			
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

#==============================================================================================================================================================================================================================#
Check ResponseObject Error Detail  
    [Arguments]    ${value}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	Log To Console    ResponseObject Error Detail 
	
	# ${code}=    Set Variable    ${code}
	# ${code} =	Set Variable If    '${code}'=='${VALUE_LOG_CODE_40300}'    ${VALUE_LOG_CODE_40400}
	# ...    '${code}'!='${VALUE_LOG_CODE_40300}'    ${code}
	# Log To Console    code${code}
	# Log To Console    description${description}


	${replaceCodeCmdName}=    Replace String    ${value}    [Code]    ${code}
	${replaceDescriptionCmdName}=    Replace String    ${replaceCodeCmdName}    [DeveloperMessage]    ${description}
	${replaceDetail}=    Replace String    ${replaceDescriptionCmdName}    [Detail]    ${responseObjectDetail}
	${responseObject}=    Replace String To Object    ${replaceDetail}
	Log To Console    responseObjectError${responseObject}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}


#==============================================================================================================================================================================================================================#
Check Log Response 
    #resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName,pathUrl,dataSearch,accessToken,accountId,body[request],response[response],namespace,containerId,identity,cmdName,endPointName,logLevel,custom,customDetailDB,responseObjectDetail
    [Arguments]    ${resultCode_summary}    ${resultDesc_summary}    ${code_detail}    ${description_detail}    ${applicationName}    ${pathUrl}     ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${endPointName}    ${logLevel}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 


	${dataLogResponse}=    Data Log Response    ${applicationName}    ${dataSearch}    ${endPointName}
	Log    Log is :${dataLogResponse}
	
	Check Log Detail    ${code_detail}    ${description_detail}    ${dataLogResponse}[1]    ${dataLogResponse}[3]    ${applicationName}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
    Check Log Summary    ${resultCode_summary}    ${resultDesc_summary}    ${dataLogResponse}[2]    ${dataLogResponse}[3]    ${applicationName}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${custom}

#==============================================================================================================================================================================================================================#
Replace String To Object
    [Arguments]    ${string}
    
	${replStringToJsonStart}=    Replace String    ${string}    "{    {
	${replStringToJsonEnd}=    Replace String    ${replStringToJsonStart}    }"    }
	[RETURN]    ${replStringToJsonEnd}
	
#Check Json Data Should Be Equal
#	[Arguments]    ${JsonData}    ${field}    ${expected}
	
	#json.dumps use for parameter convert ' to "
#	${listAsString}=    Evaluate    json.dumps(${JsonData})    json
	#r use for parameter / have in data
#	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
	#Log To Console    resp_json${resp_json}	
    #Should Be Equal    ${resp_json['${field}']}    ${expected}
	#Log To Console    resp_json${resp_json${field}}	
	#Log To Console    expected${expected}	
#    Should Be Equal    ${resp_json${field}}    ${expected}    error=${field}
