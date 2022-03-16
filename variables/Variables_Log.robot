*** Variables ***

#log
${VALUE_LOG_URL}    mg-iot.siamimo.com

#applicationName : Charging
${VALUE_APPLICATIONNAME_CHARGING}    Insight.Charging.APIs
#applicationName : Centric
# ${VALUE_APPLICATIONNAME_COAP_CENTRIC}    asgardcoap
# ${VALUE_APPLICATIONNAME_MQTT_CENTRIC}    asgardmqtt

# ${VALUE_APPLICATIONNAME_CHARGING}    Insight.Charging.APIs

#namespace
# ${VALUE_LOG_NAMESPACE}    Magellan 
${VALUE_LOG_NAMESPACE}    magellan 

# ${VALUE_LOG_NAMESPACE}    mgcentric 
${VALUE_LOG_NAMESPACE_CENTRIC}    mgcentric 

#containerId : ProvisioningAPIs
${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    provisioningapis-v132



#containerId : centricapis
${VALUE_LOG_CONTAINERID_CENTRIC}    centricapis-v326



#-------------------------------------------- Detail Log --------------------------------------------#
#endPointName : ProvisioningAPIs
${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}    ProvisioningAPIs

#${Api}

#endPointName : Asgard MQTT
${DETAIL_ENDPOINTNAME_RABBITMQ}    RabbitMQ

#endPointName : Charging
${DETAIL_ENDPOINTNAME_ROCSSERVICE}    RocsService

#log Detail
${VALUE_DETAIL}    Detail  
#field log Detail
${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}    systemTimestamp   
${FIELD_LOG_DETAIL_LOGTYPE}    logType  
${FIELD_LOG_DETAIL_LOGLEVEL}    logLevel  
${FIELD_LOG_DETAIL_NAMESPACE}    namespace  
${FIELD_LOG_DETAIL_APPLICATIONNAME}    applicationName  
${FIELD_LOG_DETAIL_CONTAINERID}    containerId
${FIELD_LOG_DETAIL_SESSIONID}    sessionId  
${FIELD_LOG_DETAIL_TID}    tid 
${FIELD_LOG_DETAIL_CUSTOM1}    custom1   
${FIELD_LOG_DETAIL_CUSTOM2}    custom2   
${FIELD_LOG_DETAIL_ENDPOINTNAME}    endPointName
${FIELD_LOG_DETAIL_REQUESTOBJECT}    requestObject
${FIELD_LOG_DETAIL_URL}    url
${FIELD_LOG_DETAIL_HEADERS}    headers
${FIELD_LOG_DETAIL_XAISORDERREF}    x-ais-OrderRef
${FIELD_LOG_DETAIL_BODY}    body
${FIELD_LOG_DETAIL_IMSI}    Imsi
${FIELD_LOG_DETAIL_IPADDRESS}    IpAddress        
${FIELD_LOG_DETAIL_RESPONSEOBJECT}    responseObject
${FIELD_LOG_DETAIL_THINGTOKEN}    ThingToken
${FIELD_LOG_DETAIL_OPERATIONSTATUS}    OperationStatus
${FIELD_LOG_DETAIL_OPERATIONSTATUS_CODE}    Code
${FIELD_LOG_DETAIL_OPERATIONSTATUS_DESCRIPTION}    Description
${FIELD_LOG_DETAIL_ACTIVITYLOG}    activityLog
${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}    startTime
${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}    endTime
${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}    processTime

${FIELD_LOG_DETAIL_QUERYSTRING}    queryString

${VALUE_LOG_DETAIL_LOGLEVEL}    INFO  
${VALUE_LOG_DETAIL_CUSTOM2}    ${NONE}
${VALUE_LOG_DETAIL_VERSION}    v1




#-------------------------------------------- Detail Provisioning --------------------------------------------#
#-------------------------------------------- requestObject and responseObject Signin --------------------------------------------#
# "requestObject":"{ \"url\":\"mg-iot.siamimo.com/api/v1/auth/signin\", \"method\":\"POST\", \"headers\":{ \"x-ais-username\":\"AisPartner\", \"x-ais-orderref\":\"Signin_202107131407620\", \"x-ais-orderdesc\":\"User Authentication\" }, \"body\":{ \"Username\":\"QA_SC\", \"Password\":\"VGVzdDEyMzQ=\" } }"
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_SIGNIN}    "{\"url\":\"[valuePathUrl]\",\"method\":\"POST\",\"headers\":{\"x-ais-username\":\"AisPartner\",\"x-ais-orderref\":\"[tid]\",\"x-ais-orderdesc\":\"User Authentication\"},\"body\":[body]}"








#-------------------------------------------- responseObject Success --------------------------------------------#
# 'responseObject': '{ "OperationStatus":{ "Code":"20000", "Description":"ValidateTokenProcess is Success" } }'
${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    "{"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]"}}"

#-------------------------------------------- responseObject Error --------------------------------------------#
# #{ \"OperationStatus\":{ \"Code\":\"40000\", \"DeveloperMessage\":\"The client request missing or invalid format\" }, \"Detail\":[ { \"Target\":\"ThingIdentifier\", \"DeveloperMessage\":\"The length of ThingIdentifier must be 13 or 19 characters. You entered 20 characters.\" } ] }
# ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    "{\"OperationStatus\":{\"Code\":\"[Code]\",\"Description\":\"[Description]\"},\"Details\":[Detail]}"

#{ \"OperationStatus\":{ \"Code\":\"40000\", \"DeveloperMessage\":\"The client request missing or invalid format\" }, \"Detail\":[ { \"Target\":\"ThingIdentifier\", \"DeveloperMessage\":\"The length of ThingIdentifier must be 13 or 19 characters. You entered 20 characters.\" } ] }
${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    "{"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[DeveloperMessage]","Details":[Detail]}}"

#{"OperationStatus":{"Code":"40400","DeveloperMessage":"The requested operation could not be found."}}
${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    "{\"OperationStatus\":{\"Code\":\"[Code]\",\"DeveloperMessage\":\"[DeveloperMessage]\"}}"

#{"OperationStatus":{"Code":"40400","DeveloperMessage":"The requested operation could not be found."}}
${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR2}    "{\"ModelState":null\,"OperationStatus\":{\"Code\":\"[Code]\",\"Description\":\"[Description]\"}}"

#-------------------------------------------- Detail DB--------------------------------------------#
# "responseObject":"{"statusCode":"20000","description":"inquiry worker is success"}"
${VALUE_LOG_DETAIL_REQUESTOBJECT_COAPAPP_DB}    {}    
${VALUE_LOG_DETAIL_RESPONSEOBJECT_COAPAPP_DB}    {"statusCode":"[statusCode]","description":"[description]"}   


${VALUE_LOG_DETAIL_REQUESTOBJECT_WHITELIST_DB}    {}    
${VALUE_LOG_DETAIL_RESPONSEOBJECT_WHITELIST_DB}    {"StatusCode":[statusCode],"Description":"[description]"}






#-------------------------------------------- Summary Log --------------------------------------------#
${VALUE_SUMMARY}    Summary 
#field log Summary
${FIELD_LOG_SUMMARY_SYSTEMTIMESTAP}    systemTimestamp   
${FIELD_LOG_SUMMARY_LOGTYPE}    logType  
${FIELD_LOG_SUMMARY_NAMESPACE}    namespace
${FIELD_LOG_SUMMARY_APPLICATIONNAME}    applicationName
${FIELD_LOG_SUMMARY_CONTAINERID}    containerId
${FIELD_LOG_SUMMARY_SESSIONID}    sessionId
${FIELD_LOG_SUMMARY_TID}    tid 
${FIELD_LOG_SUMMARY_IDENTITY}    identity 
${FIELD_LOG_SUMMARY_CMDNAME}    cmdName  
${FIELD_LOG_SUMMARY_RESULTCODE}    resultCode  
${FIELD_LOG_SUMMARY_RESULTDESC}    resultDesc
${FIELD_LOG_SUMMARY_CUSTOM}    custom
${FIELD_LOG_SUMMARY_CUSTOMDATA}    customData
${FIELD_LOG_SUMMARY_ENDPOINTSUMMARY}    endPointSummary
${FIELD_LOG_SUMMARY_REQTIMESTAP}    reqTimestamp 
${FIELD_LOG_SUMMARY_RESTIMESTAMP}    resTimestamp  
${FIELD_LOG_SUMMARY_USAGETIME}    usageTime 



#value log summary  cmdName: Partner
${VALUE_LOG_SUMMARY_CMDNAME_CREATEPARTNER}    CreatePartner



${VALUE_LOG_SUMMARY_IDENTITY}    ${NONE}
${VALUE_LOG_SUMMARY_CUSTOM}    ${NONE}
${VALUE_LOG_SUMMARY_IDENTITY_EMPTY}    ${EMPTY}

${VALUE_LOG_CODE_20000}    20000
${VALUE_LOG_CODE_20100}    20100
${VALUE_LOG_CODE_40000}    40000
${VALUE_LOG_CODE_40300}    40300
${VALUE_LOG_CODE_40400}    40400
${VALUE_LOG_CODE_40301}    40301
${VALUE_LOG_CODE_40305}    40305
${VALUE_LOG_CODE_40010}    40010
${VALUE_LOG_CODE_40308}    40308
${VALUE_LOG_CODE_40103}    40103

${VALUE_LOG_SUMMARY_RESULTDESC_OK}    OK


# ${VALUE_LOG_SUMMARY_RESULTDESC_20000_REQUESTED_OPERATION_SUCCESSFULLY}    The requested operation was successfully
${VALUE_DESCRIPTION_REQUESTED_OPERATION_SUCCESSFULLY}    The requested operation was successfully

#status
${VALUE_STATUS_SUCCESS}     Success
${VALUE_STATUS_WHITELISTALREADY}     WhitelistAlready

#response description
${VALUE_DESCRIPTION_REGISTER_SUCCESS}    Register is Success
${VALUE_DESCRIPTION_REPORT_SUCCESS}     Report is Success
${VALUE_DESCRIPTION_IS_SUCCESS}     is Success

${VALUE_DESCRIPTION_SUCCESS}     Success

#Error
#The ThingIdentifier could not be found.
${VALUE_DESCRIPTION_THETHINGIDENTIFIERCOULDNOTBEFOUND_ERROR}    The ThingIdentifier could not be found.


#The client requested missing or invalid format.
${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    The client requested missing or invalid format.

