*** Variables ***
#-------------------------------------------- signin --------------------------------------------#	
#path url signin
${URL_SIGNIN}    /api/v1/auth/signin

#header Signin
${HEADER_X_AIS_ORDERREF_SIGNIN}    Signin_
${HEADER_X_AIS_ORDERREF_SIGNIN_FAIL}    Signinfail_
${HEADER_X_AIS_ORDERDESC_SIGNIN}    User Authentication


#response description
${VALUE_DESCRIPTION_SINGNIN_SUCCESS}    SignInProcess is Success

#request name
${SINGNIN}    Signin
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- ValidateToken --------------------------------------------#	
#path url ValidateToken
${URL_VALIDATETOKEN}    /api/v1/auth/ValidateToken

#header ValidateToken
${HEADER_X_AIS_ORDERREF_VALIDATETOKEN}    ValidateToken_
${HEADER_X_AIS_ORDERREF_VALIDATETOKEN_FAIL}    ValidateTokenfail_
${HEADER_X_AIS_ORDERDESC_VALIDATETOKEN}    ValidateToken

#response description
${VALUE_DESCRIPTION_VALIDATETOKEN_SUCCESS}    ValidateTokenProcess is Success

#request name
${VALIDATETOKEN}    ValidateToken
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- Partner --------------------------------------------#	
#-------------------------------------------- CreatePartner --------------------------------------------#	
#path url CreatePartner
${URL_CREATEPARTNER}    /api/v1/Partner/CreatePartner

#header CreatePartner
${HEADER_X_AIS_ORDERREF_CREATEPARTNER}    CreatePartner_
${HEADER_X_AIS_ORDERREF_CREATEPARTNER_FAIL}    CreatePartnerfail_
${HEADER_X_AIS_ORDERDESC_CREATEPARTNER}    CreatePartner

#value Create Partner
${VALUE_PARTNERNAME}    SC_
${VALUE_MERCHANTCONTACT}    Jida_TestMerchantContact@ais.co.th
${VALUE_CPID}    Jida_TesCPID@ais.co.th
${VALUE_ACCOUNTNAME}    Jida_TestAccountname
# ${VALUE_CONFIGGROUPNAME}    Sensor_TestThingGroupName

#response description
${VALUE_DESCRIPTION_CREATEPARTNER_SUCCESS}    CreatePartner is Success

#request name
${CREATEPARTNER}    CreatePartner
${CREATEPARTNER_OTHERROLE}    CreatePartnerOtherRole

#-------------------------------------------- UpdatePartner --------------------------------------------#	
#path url UpdatePartner
${URL_UPDATEPARTNER}    /api/v1/Partner/UpdatePartner

#header UpdatePartner
${HEADER_X_AIS_ORDERREF_UPDATEPARTNER}    UpdatePartner_
${HEADER_X_AIS_ORDERREF_UPDATEPARTNER_FAIL}    UpdatePartnerfail_
${HEADER_X_AIS_ORDERDESC_UPDATEPARTNER}    UpdatePartner

#value Update Partner
${VALUE_PARTNERNAME_UPDATE}    Update_SC_
${VALUE_MERCHANTCONTACT_UPDATE}    Update_Jida_TestMerchantContact@ais.co.th
${VALUE_CPID_UPDATE}    Update_Jida_TesCPID@ais.co.th
${VALUE_ACCOUNTNAME_UPDATE}    Update_Jida_TestAccountname
${VALUE_CONFIGGROUPNAME_UPDATE}    Update_Sensor_TestThingGroupName

#response description
${VALUE_DESCRIPTION_UPDATEPARTNER_SUCCESS}    UpdatePartner is Success

#request name
${UPDATEPARTNER}    UpdatePartner
${UPDATEPARTNER_OTHERROLE}    UpdatePartnerOtherRole
#-------------------------------------------- InquiryPartner --------------------------------------------#
#path url InquiryPartner
${URL_INQUIRYPARTNER}    /api/v1/Partner/InquiryPartner

#header InquiryPartner
${HEADER_X_AIS_ORDERREF_INQUIRYPARTNER}    InquiryPartner_
${HEADER_X_AIS_ORDERREF_INQUIRYPARTNER_FAIL}    InquiryPartnerfail_
${HEADER_X_AIS_ORDERDESC_INQUIRYPARTNER}    InquiryPartner

#response description
${VALUE_DESCRIPTION_INQUIRYPARTNER_SUCCESS}    InquiryPartner is Success    

#request name
${INQUIRYPARTNER}    InquiryPartner
${INQUIRYPARTNER_OTHERROLE}    InquiryPartnerOtherRole	

#-------------------------------------------- RemovePartner --------------------------------------------#	
#path url remove
${URL_REMOVEPARTNER}    /api/v1/Partner/RemovePartner

#header RemovePartner
${HEADER_X_AIS_ORDERREF_REMOVEPARTNER}    RemovePartner_
${HEADER_X_AIS_ORDERREF_REMOVEPARTNER_FAIL}    RemovePartnerfail_
${HEADER_X_AIS_ORDERDESC_REMOVEPARTNER}    RemovePartner

#request name
${REMOVEPARTNER}    RemovePartner
${REMOVEPARTNER_OTHERROLE}    RemovePartnerOtherRole

#response description
${VALUE_DESCRIPTION_REMOVEPARTNER_SUCCESS}    RemovePartner is Success
#-------------------------------------------------------------------------------------------------------#
#------------------------------------------------ Account ----------------------------------------------#	
#-------------------------------------------- CreateAccount --------------------------------------------#
#path url CreateAccount
${URL_CREATEACCOUNT}    /api/v1/Account/CreateAccount

#header CreateAccount
${HEADER_X_AIS_ORDERREF_CREATEACCOUNT}    CreateAccount_
${HEADER_X_AIS_ORDERREF_CREATEACCOUNT_FAIL}    CreateAccountfail_
${HEADER_X_AIS_ORDERDESC_CREATEACCOUNT}    CreateAccount

#value CreateAccount
${VALUE_ACCOUNTCODE}    AccountCode_

#response description
${VALUE_DESCRIPTION_CREATEACCOUNT_SUCCESS}    CreateAccount is Success

#request name
${CREATEACCOUNT}    CreateAccount
${CREATEACCOUNT_OTHERROLE}    CreateAccountOtherRole

#-------------------------------------------- UpdateAccont --------------------------------------------#
#path url UpdateAccount
${URL_UPDATEACCOUNT}    /api/v1/Account/UpdateAccount

#header UpdateAccount
${HEADER_X_AIS_ORDERREF_UPDATEACCOUNT}    UpdateAccount_
${HEADER_X_AIS_ORDERREF_UPDATEACCOUNT_FAIL}    UpdateAccountfail_
${HEADER_X_AIS_ORDERDESC_UPDATEACCOUNT}    UpdateAccount

#response description
${VALUE_DESCRIPTION_UPDATEACCOUNT_SUCCESS}    UpdateAccount is Success

#request name
${UPDATEACCOUNT}    UpdateAccount
${UPDATEACCOUNT_OTHERROLE}    UpdateAccountOtherRole


${VALUE_ACCOUNTCODE}    QATesterAcc01
${VALUE_EXPIREDATE}    2021-11-30T15:27:27.396+07:00   
${VALUE_EXPIREDATE_ERROR}    2020-11-30T15:27:27.396+07:00 
${VALUE_CLEAREXPIREDATE}    true

#-------------------------------------------- InquiryAccont --------------------------------------------#
#path url InquiryAccount
${URL_INQUIRYACCOUNT}    /api/v1/Account/InquiryAccount

#header InquiryAccount
${HEADER_X_AIS_ORDERREF_INQUIRYACCOUNT}    InquiryAccount_
${HEADER_X_AIS_ORDERREF_INQUIRYACCOUNT_FAIL}    InquiryAccountfail_
${HEADER_X_AIS_ORDERDESC_INQUIRYACCOUNT}    InquiryAccount

#response description
${VALUE_DESCRIPTION_INQUIRYACCOUNT_SUCCESS}    InquiryAccount is Success

#request name
${INQUIRYACCOUNT}    InquiryAccount
${INQUIRYACCOUNT_OTHERROLE}    InquiryAccountOtherRole

#-------------------------------------------- RemoveAccont --------------------------------------------#
#path url RemoveAccount
${URL_REMOVEACCOUNT}    /api/v1/Account/RemoveAccount

#header InquiryAccount
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT}    RemoveAccount_
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT_FAIL}    RemoveAccountfail_
${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNT}    RemoveAccount

#response description
${VALUE_DESCRIPTION_REMOVEACCOUNT_SUCCESS}    RemoveAccount is Success

#request name
${REMOVEACCOUNT}    RemoveAccount
${REMOVEACCOUNT_OTHERROLE}    RemoveAccountOtherRole

#-------------------------------------------- RemoveAcconts --------------------------------------------#
#path url RemoveAccounts
${URL_REMOVEACCOUNTS}    /api/v1/Account/RemoveAccounts

#header InquiryAccounts
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNTS}    RemoveAccounts_
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNTS_FAIL}    RemoveAccountsfail_
${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNTS}    RemoveAccounts

#response description
${VALUE_DESCRIPTION_REMOVEACCOUNTS_SUCCESS}    RemoveAccounts is Success

#request name
${REMOVEACCOUNTS}    RemoveAccounts
${REMOVEACCOUNTS_OTHERROLE}    RemoveAccountsOtherRole
#-------------------------------------------------------------------------------------------------------#

#-------------------------------------------- Thing --------------------------------------------#
#-------------------------------------------- CreateThing --------------------------------------------#	
#path url CreateThing
${URL_CREATETHING}    /api/v1/Thing/CreateThing

#header CreateThing
${HEADER_X_AIS_ORDERREF_CREATETHING}    CreateThing_
${HEADER_X_AIS_ORDERDESC_CREATETHING}    CreateThing

#value Create CreateThing
${VALUE_THINGNAME}    TestThingName
${VALUE_ROUTEURL}    ["http://10.12.3.4:2019/api/information/AddInformation"]
${VALUE_ROUTEINFO_MIMO_ID}    "606edada"
${VALUE_ROUTEINFO_MIMO_SERIALNO}    5466758878
${VALUE_ROUTEFLAG_THINGNAME}    "true"
${VALUE_ROUTEFLAG_THINGTOKEN}    "true"
${VALUE_ROUTEFLAG_IMEI}    "true"
${VALUE_ROUTEFLAG_ICCID}    "true"
${VALUE_ROUTEFLAG_ROUTEINFO}    "true"

#response description
${VALUE_DESCRIPTION_CREATETHING_SUCCESS}    CreateThing is Success    

#request name
${CREATETHING}    CreateThing

#-------------------------------------------- RemoveThing --------------------------------------------#	
#path url remove
${URL_REMOVETHING}    /api/v1/Thing/RemoveThing

#header RemoveThing
${HEADER_X_AIS_ORDERREF_REMOVETHING}    RemoveThing_
${HEADER_X_AIS_ORDERDESC_REMOVETHING}    RemoveThing

#request name
${REMOVETHING}    RemoveThing

#response description
${VALUE_DESCRIPTION_REMOVETHING_SUCCESS}    RemoveThing is Success

#-------------------------------------------- ActivateThing Core --------------------------------------------#	
#path url ActivateThing Core
${URL_ACTIVATETHING_CORE}    /api/v1/Thing/ActivateThing

#header ActivateThing
${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE}    ActivateThing_
${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE_FAIL}    ActivateThingfail_
${HEADER_X_AIS_ORDERDESC_ACTIVATETHING_CORE}    ActivateThing

#response description
${VALUE_DESCRIPTION_ACTIVATETHING_CORE_SUCCESS}    ActivateThing is Success

#request name
${ACTIVATETHING_CORE}    ActivateThingCore

#-------------------------------------------- CreateAThing --------------------------------------------#	
#path url CreateAThing
${URL_CREATEATHING}    /api/v1/Things

#header CreateAThing
${HEADER_X_AIS_ORDERREF_CREATEATHING}    CreateAThing_
${HEADER_X_AIS_ORDERDESC_CREATEATHING}    CreateAThing

#value Create CreateAThing
# ${VALUE_THINGNAME}    Sensor_TestThingName

#response description
${VALUE_DESCRIPTION_CREATEATHING_SUCCESS}    The requested operation was successfully.

#request name
${CREATEATHING}    CreateAThing

#request name
${VALUE_ATHINGNAME}    ThingName
${VALUE_SUPPLIERID}    SupplierId
${VALUE_SUPPLIERNAME}    SupplierName

${VALUE_THINGSTATE_IDLE}    Idle
${VALUE_THINGSTATE_PENDING}    Pending
${VALUE_THINGSTATE_MENUFACTURING}    Menufacturing
${VALUE_THINGSTATE_ACTIVATED}    Activated
${VALUE_CONNECTIVITYTYPE_NBIOT}    NBIOT
${VALUE_CONNECTIVITYTYPE_SIM3G}    SIM3G
${VALUE_CONNECTIVITYTYPE_SIM4G}    SIM4G
${VALUE_CONNECTIVITYTYPE_SIM5G}    SIM5G
${VALUE_CONNECTIVITYTYPE_WIFIOrWIMAX}    "WIFI or WIMAX
${VALUE_CONNECTIVITYTYPE_WIMAX}    WIMAX
${VALUE_CONNECTIVITYTYPE_WIFI}    WIFI

#-------------------------------------------- Import Thing --------------------------------------------#	
#path url ImportThing
${URL_IMPORTTHING}    /api/v1/Things/Import

#header ImportThing
${HEADER_X_AIS_ORDERREF_IMPORTTHING}    ImportThing_
${HEADER_X_AIS_ORDERDESC_IMPORTTHING}    ImportThing

#response description
${VALUE_DESCRIPTION_IMPORTTHING_SUCCESS}    The requested operation was successfully.

#request name
${IMPORTTHING}    ImportThing

#-------------------------------------------- Mapping IMEI --------------------------------------------#	
#path url MappingIMEI
${URL_MAPPINGIMEI}    /api/v1/Things/Mapping/IMEI

#header MappingIMEI
${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}    MappingIMEI_
${HEADER_X_AIS_ORDERDESC_MAPPINGIMEI}    MappingIMEI

#response description
${VALUE_DESCRIPTION_MAPPINGIMEI_SUCCESS}    The requested operation was successfully.

#request name
${MAPPINGIMEI}    MappingIMEI





#-------------------------------------------- Save History --------------------------------------------#	
#path url MappingIMEI
${URL_SAVEHISTORY}    /routeapi/services/destination

#header MappingIMEI
${HEADER_X_AIS_ORDERREF_SAVEHISTORY}    SaveHistory_
${HEADER_X_AIS_ORDERREF_SAVEHISTORY_FAIL}    SaveHistoryfail_
${HEADER_X_AIS_ORDERDESC_SAVEHISTORY}    SaveHistory

#response description
${VALUE_DESCRIPTION_SAVEHISTORY_SUCCESS}    The requested operation was successfully.

#request name
${SAVESHISTORY}    SaveHistory

${VALUE_SAVEHISTORY_QUASARCONTENTTYPE}    None
${VALUE_SAVEHISTORY_EVENTTYPE}    Report
${VALUE_SAVEHISTORY_GPS}    13.7366717,100.526397
${VALUE_SAVEHISTORY_QUASARREFRESHTIME_0}    0
${VALUE_SAVEHISTORY_QUASARREFRESHTIME_1}    1
${VALUE_SAVEHISTORY_QUASARREFRESHTIME_2}    2
${VALUE_SAVEHISTORY_QUASARREFRESHTIME_3}    3
${VALUE_SAVEHISTORY_QUASARCONTENTTYPE_NONE}    None
${VALUE_SAVEHISTORY_QUASARCONTENTTYPE_REFRESH}    Refresh
${VALUE_SAVEHISTORY_EVENTTYPE_REPORT}    Report
${VALUE_SAVEHISTORY_EVENTTYPE_CONNECTED}    Connected
${VALUE_SAVEHISTORY_EVENTTYPE_DESIRE}    Desire
${VALUE_SAVEHISTORY_EVENTTYPE_TIMEOUT}    Timeout
${VALUE_SAVEHISTORY_EVENTTYPE_DISCONNECTED}    Disconnected
${VALUE_SAVEHISTORY_TIMESTAMP_XXXXXXXXXXX}    xxxxxxxxxxx
${VALUE_SAVEHISTORY_EVENTTYPE_XXXXX}    xxxxx
${VALUE_SAVEHISTORY_THINGIDINVALID}    xxxx






















#-------------------------------------------- Other --------------------------------------------#	
#Other field
${FIELD_OPERATIONSTATUS}    OperationStatus
${FIELD_CODE}    Code
${FIELD_DESCRIPTION}    Description
${FIELD_ACCESSTOKEN}    AccessToken    
${FIELD_PARTNERINFO}    PartnerInfo
${FIELD_PARTNERINFO_LOWWERCASE}    partnerInfo   
${FIELD_PARTNERID}    PartnerId  
${FIELD_PARTNERNAME}    PartnerName
${FIELD_ACCOUNTINFO}    AccountInfo  
${FIELD_ACCOUNTNAME}    AccountName  
${FIELD_ACCOUNTID}    AccountId  
${FIELD_ACCOUNTCODE}    AccountCode 
${FIELD_THINGINFO}    ThingInfo  
${FIELD_THINGID}    ThingId 
${FIELD_THINGIDENTIFIER}    ThingIdentifier  
${FIELD_THINGSECRET}    ThingSecret  
${FIELD_IMSI}    IMSI  
${FIELD_IMEI}    IMEI
${FIELD_THINGTOKEN}    ThingToken   
${FIELD_CONFIGGROUPINFO}    ConfigGroupInfo   
${FIELD_CONFIGGROUPID}    ConfigGroupId   
${FIELD_WORKERSINFO}    WorkersInfo 
${FIELD_WORKERID}    WorkerId
${FIELD_ACTIVATETHING}    ActivateThing
${FIELD_GROUPINFO}    GroupInfo  
${FIELD_GROUPID}    GroupId 
${FIELD_BACKUPDATAINFO}    BackupDataInfo 
${FIELD_PULLMESSAGEID}    PullMessageId 
${FIELD_ROUTEINFO}    RouteInfo
${FIELD_ROUTEID}    RouteId 
${FIELD_ROUTENAME}    RouteName
${FIELD_PURCHASEINFO}    PurchaseInfo 
${FIELD_CUSTOMERID}    CustomerId
${FIELD_SYSTEMUSERINFO}    SystemUserInfo
${FIELD_HEADER}    header

${FIELD_ICCIDPRE}    896603
${ACCOUNTID_NULL}    Null
${ACCOUNTKEY_INVALID}    xx

#used flow ActivateThing and TransferThings for Crate WhiteList
${TYPE_CUSTOMER}    Customer 
${TYPE_TENANT}    Tenant 
${TYPE_ACCOUNT}    Account 

#used for Remove
${PARTNERACCOUNTTHINGARRCORE}    PartnerAccountThingArrCore
${PARTNERACCOUNTTHINGCORE}    PartnerAccountThingCore
${PARTNERACCOUNTTHINGARRCORE_OTHERROLE}    PartnerAccountThingArrCore_OtherRole
${PARTNERACCOUNTTHINGARRCORE_ACTIVATETHING}    PartnerAccountThingArrCore_ActivateThing
${PARTNERACCOUNTTHINGARRCORE_ACTIVATETHING_OTHERROLE}    PartnerAccountThingArrCore_Activatething_OtherRole
${PARTNERACCOUNTTHINGARRCORE_ACTIVATETHING_WHITELIST}    PartnerAccountThingArrCore_ActivateThing_WhiteList
${PARTNERACCOUNTTHINGARRCORE_ACTIVATETHING_WHITELIST_OTHERROLE}    PartnerAccountThingArrCore_ActivateThing_WhiteList_OtherRole
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS}    PartnerAccountThingArrCore_TransferThings
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_ACCOUNTCODE}    PartnerAccountThingArrCore_TransferThings_AccountCode
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_OTHERROLE}    PartnerAccountThingArrCore_TransferThings_OtherRole
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_ACCOUNTCODE_OTHERROLE}    PartnerAccountThingArrCore_TransferThings_AccountCode_OtherRole
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_WHITELIST}    PartnerAccountThingArrCore_TransferThings_WhiteList
${PARTNERACCOUNTTHINGARRCORE_TRANSFERTHINHS_ACCOUNTCODE_WHITELIST}    PartnerAccountThingArrCore_TransferThings_AccountCode_WhiteList
${PARTNERACCOUNTACCOUNT2}    PartnerAccountAccount2
${PARTNERACCOUNTACCOUNT2_OTHERROLE}    PartnerAccountAccount2_OtherRole
${PARTNERACCOUNTACCOUNT2_WHITELIST}    PartnerAccountAccount2_WhiteList

${PARTNERACCOUNT}    PartnerAccount
${PARTNERACCOUNT_OTHERROLE}    PartnerAccountOtherRole
${PARTNERACCOUNT_WHITELIST_TRANSFERTHINHS}    PartnerAccount_WhiteList_TransferThings
${PARTNERACCOUNT_WHITELIST_ACTIVATETHING_CORE}    PartnerAccount_WhiteList_ActivateThing
${GENERATEPULLMESSAGE_REMOVETHINGSTATEINFO}    GeneratePullMessage_RemoveThingStateInfo
${UPDATEPULLMESSAGE_REMOVETHINGSTATEINFO}    UpdatePullMessage_RemoveThingStateInfo
${REMOVEPULLMESSAGE_REMOVETHINGSTATEINFO}    RemovePullMessage_RemoveThingStateInfo
${REMOVEPULLMESSAGE_REMOVETHINGSTATEINFO_OTHERROLE}    RemovePullMessage_RemoveThingStateInfo_OtherRole



${PARTNERACCOUNTATHING}    PartnerAccountAThing