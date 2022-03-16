*** Variables ***
#STAGING
# mongodb://{$user}:{$pass}@{$ip}:${port}/mgcore?authSource=admin	
# ${CONNECT_TO_MONGODB}    mongodb://admin:ais.co.th@104.215.197.5:27018/mgcore?authSource=admin

#IOT
# mongodb://{$user}:{$pass}@{$ip}:${port}/mgcore?authSource=admin
${CONNECT_TO_MONGODB}    mongodb://admin:ais.co.th@52.163.210.190:27018/mgcore?authSource=admin


#----------------------------------------------------------------------------------------#
${MONGODB_TYPE_ALL}    All
${MONGODB_TYPE_SEARCHBYSELECTFIEDS}    SearchBySelectFields

#-------------------------------------- Table --------------------------------------------------#
${MONGODB_DBNAME_MGCORE}    mgcore
${MONGODB_DBNAME_MGCENTRIC}    mgcentric
${MONGODB_DBCOLLNAME_TB_THINGS}    things
${MONGODB_DBCOLLNAME_TB_GROUPS}    groups
${MONGODB_DBCOLLNAME_TB_TENANTS}    tenants
${MONGODB_DBCOLLNAME_TB_CUSTOMERS}    customers
${MONGODB_DBCOLLNAME_TB_ACCOUNTS}    accounts
${MONGODB_DBCOLLNAME_TB_CLIENTS}    clients
${MONGODB_DBCOLLNAME_TB_ONLINECONFFIGS}    onlineconfigs
${MONGODB_DBCOLLNAME_TB_PULLMESSAGES}    pullmessages
${MONGODB_DBCOLLNAME_TB_DESTINATIONS}    destinations
${MONGODB_DBCOLLNAME_TB_WHITELISTDEVICE}    whitelistdevice

#-------------------------------------- Detail Provisioning --------------------------------------------------#
${VALUE_DB_PROVISIONING_THING}    "{'_id': ObjectId('[ThingId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerId': ObjectId('[CustomerId]'), 'TenantId': ObjectId('[TenantId]'), 'AccountId': ObjectId('[AccountId]'), 'ThingToken': '[ThingToken]', 'ThingName': '[ThingName]', 'ConnectivityType': 'NBIot', 'ThingIdentifier': '[ThingIdentifier]', 'Protocols': ['CoAP', 'HTTP', 'MQTT'], 'IMEI': '[IMEI]', 'ThingSecret': '[ThingSecret]', 'ThingStatus': 'Active', 'ThingState': 'Active', 'ThingCondition': 'Enable', 'SupplierDetails': {'SupplierId': '[SupplierId]'}, 'StateInfo': {'Heartbeat': {'RefreshRate': None, 'ConnectedStatus': 'NONE', 'LastHeartbeatTimestamp': None}[CreateThingState], 'DeviceTimestamp': None}}"
${VALUE_DB_PROVISIONING_THING_TRANFERTHINGS}    "{'_id': ObjectId('[ThingId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerId': ObjectId('[CustomerId]'), 'TenantId': ObjectId('[TenantId]'), 'AccountId': ObjectId('[AccountId]'), 'ThingToken': '[ThingToken]', 'ThingName': '[ThingName]', 'ConnectivityType': 'NBIot', 'ThingIdentifier': '[ThingIdentifier]', 'Protocols': ['CoAP', 'HTTP', 'MQTT'], 'IMEI': '[IMEI]', 'ThingSecret': '[ThingSecret]', 'ThingStatus': 'Active', 'ThingState': 'Active', 'ThingCondition': 'Enable', 'SupplierDetails': {'SupplierId': '[SupplierId]'}, 'StateInfo': None, 'CustomDetails': None}"

${VALUE_DB_PROVISIONING_THING_CENTRIC}    "{'_id': ObjectId('[ThingId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'WorkerId': ObjectId([WorkerId]), 'ConnectivityType': '[ConnectivityType]', 'ThingName': '[ThingName]', 'ThingIdentifier': '[ThingIdentifier]', 'ThingSecret': '[ThingSecret]', 'IMEI': '[IMEI]', 'ThingState': '[ThingState]', 'CustomDetails': {}, 'SupplierDetail': {'SupplierId': None, 'SupplierName': None}}"

${VALUE_DB_PROVISIONING_GROUP}    "{'_id': ObjectId('[GroupId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'AccountId': ObjectId('[AccountId]'), 'GroupName': '[GroupName]', 'Things': [[Things]], 'CustomDetails': {'QuasarContentType': '[QuasarContentType]', 'QuasarRefreshTime': [QuasarRefreshTime]}}"

${VALUE_DB_PROVISIONING_CONFIGGROUP}    "{'_id': ObjectId('[ConfigGroupId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'AccountId': ObjectId('[AccountId]'), 'OnlineConfigName': '[OnlineConfigName]', 'Things': [[Things]], 'CustomDetails': {'[RefreshTime]': '[valueRefreshTime]', '[Max]': '[valueMax]'}}"

${VALUE_DB_PROVISIONING_PULLMESSAGE}    "{'_id': ObjectId('[PullMessageId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'ThingId': ObjectId('[ThingId]'), 'AccountId': ObjectId('[AccountId]'), 'PullMessageName': '[PullMessageName]', 'PullMessageKey': '[PullMessageKey]', 'PullMessageStatus': '[PullMessageStatus]', 'ShareProperties': {'Type': '[Type]'}, 'ExpireDatetime': [ExpireDatetime]}"

${VALUE_DB_PROVISIONING_CUSTOMERS}    "{'_id': ObjectId('[CustomerId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerName': '[CustomerName]', 'CustomerType': '[CustomerType]'[PurchaseInfo], 'ChargingStatus': '[ChargingStatus]'[ReserveQuotaInfo]}"

${VALUE_DB_PROVISIONING_CREATEPARTNER}    "{'_id': ObjectId('[PartnerId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerId': ObjectId('[CustomerId]'), 'TenantName': '[PartnerName]', 'TenantType': [[PartnerType]], 'CustomDetails': {'MerchantContact': '[MerchantContact]', 'CPID': '[CPID]'}, 'CustomProperties': {'RouteEngine': '[RouteEngine]'}}"
${VALUE_DB_PROVISIONING_CREATEPARTNER_TABLECUSTOMERS}    "{'_id': ObjectId('[CustomerId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerName': '[CustomerName]', 'CustomerType': '[CustomerType]'}

${VALUE_DB_PROVISIONING_UPDATEPARTNER_TABLETENANTS}    "{'_id': ObjectId('[PartnerId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerId': ObjectId('[CustomerId]'), 'TenantName': '[PartnerName]', 'TenantType': [[PartnerType]], 'CustomDetails': {'MerchantContact': '[MerchantContact]', 'CPID': '[CPID]'}, 'CustomProperties': {'RouteEngine': '[RouteEngine]'}}"
${VALUE_DB_PROVISIONING_UPDATEPARTNER_TABLECUSTOMERS}    "{'_id': ObjectId('[CustomerId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerName': '[CustomerName]', 'CustomerType': '[CustomerType]'}

${VALUE_DB_PROVISIONING_DELETEPARTNER_TABLETENANTS}    "{'_id': ObjectId('[PartnerId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerId': ObjectId('[CustomerId]'), 'TenantName': '[PartnerName]', 'TenantType': [[PartnerType]], 'CustomDetails': {'MerchantContact': '[MerchantContact]', 'CPID': '[CPID]'}, 'CustomProperties': {'RouteEngine': '[RouteEngine]'}}"
${VALUE_DB_PROVISIONING_DELETEPARTNER_TABLECUSTOMERS}    "{'_id': ObjectId('[CustomerId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerName': '[CustomerName]', 'CustomerType': '[CustomerType]'}

${VALUE_DB_PROVISIONING_PARTNER_TABLETENANTS}    "{'_id': ObjectId('[PartnerId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerId': ObjectId('[CustomerId]'), 'TenantName': '[PartnerName]', 'TenantType': [[PartnerType]], 'CustomDetails': {'MerchantContact': '[MerchantContact]', 'CPID': '[CPID]'}, 'CustomProperties': {'RouteEngine': '[RouteEngine]'}}"
${VALUE_DB_PROVISIONING_PARTNER_TABLECUSTOMERS}    "{'_id': ObjectId('[CustomerId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'CustomerName': '[CustomerName]', 'CustomerType': '[CustomerType]'}

${VALUE_DB_PROVISIONING_ACCOUNTS}    "{'_id': ObjectId('[AccountId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'TenantId': ObjectId('[PartnerId]'), 'AccountName': '[AccountName]', 'CustomDetails': {}}"
${VALUE_DB_PROVISIONING_UPDATEACCOUNTS}    "{'_id': ObjectId('[AccountId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'TenantId': ObjectId('[PartnerId]'), 'AccountName': '[AccountName]', 'CustomDetails': {'AccountCode': '[AccountCode]'}, 'ExpireDatetime': [ExpireDatetime]}"

${VALUE_DB_PROVISIONING_SYSTEMUSER}    "{'_id': ObjectId('[SystemUserId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'ClientStatus': '[ClientStatus]', 'ClientId': '[ClientId]', 'ProtocolType': 'oidc', 'ClientSecrets': [{'Description': None, 'Value': '[Value]', 'Expiration': None, 'Type': 'SharedSecret'}], 'RequireClientSecret': True, 'ClientName': '[ClientName]', 'Description': None, 'ClientUri': None, 'LogoUri': None, 'RequireConsent': False, 'AllowRememberConsent': True, 'AllowedGrantTypes': ['client_credentials'], 'RequirePkce': False, 'AllowPlainTextPkce': False, 'AllowAccessTokensViaBrowser': False, 'RedirectUris': [], 'PostLogoutRedirectUris': [], 'FrontChannelLogoutUri': None, 'FrontChannelLogoutSessionRequired': True, 'BackChannelLogoutUri': None, 'BackChannelLogoutSessionRequired': True, 'AllowOfflineAccess': False, 'AllowedScopes': ['Profiles', 'Things', 'MessageSharing'], 'AlwaysIncludeUserClaimsInIdToken': True, 'IdentityTokenLifetime': 300, 'AccessTokenLifetime': 3600, 'AuthorizationCodeLifetime': 300, 'AbsoluteRefreshTokenLifetime': 2592000, 'SlidingRefreshTokenLifetime': 1296000, 'ConsentLifetime': None, 'RefreshTokenUsage': 'ReUse', 'UpdateAccessTokenClaimsOnRefresh': False, 'RefreshTokenExpiration': 'Sliding', 'AccessTokenType': 'Jwt', 'EnableLocalLogin': True, 'IdentityProviderRestrictions': [], 'IncludeJwtId': False, 'Claims': {'Role': 'SuperAdmin', 'Customer': [], 'Tenant': [], 'Account': []}, 'AlwaysSendClientClaims': False, 'ClientClaimsPrefix': 'client_', 'PairWiseSubjectSalt': None, 'UserSsoLifetime': None, 'UserCodeType': None, 'DeviceCodeLifetime': 0, 'AllowedCorsOrigins': [], 'AuthenInfo': {'Username': '[Username]', 'Password': '[Password]', 'SecretKey': '[SecretKey]', 'UserRole': [[UserRole]], 'PartnerId': ObjectId('[PartnerId]'), 'AccountId': [ObjectId('[AccountId]')]}}"
${VALUE_DB_PROVISIONING_UPDATESYSTEMUSER}    "{'_id': ObjectId('[SystemUserId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'ClientStatus': '[ClientStatus]', 'ClientId': '[ClientId]', 'ProtocolType': 'oidc', 'ClientSecrets': [{'Description': None, 'Value': '[Value]', 'Expiration': None, 'Type': 'SharedSecret'}], 'RequireClientSecret': True, 'ClientName': '[ClientName]', 'Description': None, 'ClientUri': None, 'LogoUri': None, 'RequireConsent': False, 'AllowRememberConsent': True, 'AllowedGrantTypes': ['client_credentials'], 'RequirePkce': False, 'AllowPlainTextPkce': False, 'AllowAccessTokensViaBrowser': False, 'RedirectUris': [], 'PostLogoutRedirectUris': [], 'FrontChannelLogoutUri': None, 'FrontChannelLogoutSessionRequired': True, 'BackChannelLogoutUri': None, 'BackChannelLogoutSessionRequired': True, 'AllowOfflineAccess': False, 'AllowedScopes': ['Profiles', 'Things', 'MessageSharing'], 'AlwaysIncludeUserClaimsInIdToken': True, 'IdentityTokenLifetime': 300, 'AccessTokenLifetime': 3600, 'AuthorizationCodeLifetime': 300, 'AbsoluteRefreshTokenLifetime': 2592000, 'SlidingRefreshTokenLifetime': 1296000, 'ConsentLifetime': None, 'RefreshTokenUsage': 'ReUse', 'UpdateAccessTokenClaimsOnRefresh': False, 'RefreshTokenExpiration': 'Sliding', 'AccessTokenType': 'Jwt', 'EnableLocalLogin': True, 'IdentityProviderRestrictions': [], 'IncludeJwtId': False, 'Claims': {'Role': 'Account', 'Customer': [], 'Tenant': ['[Tenant]'], 'Account': ['[Account]']}, 'AlwaysSendClientClaims': False, 'ClientClaimsPrefix': 'client_', 'PairWiseSubjectSalt': None, 'UserSsoLifetime': None, 'UserCodeType': None, 'DeviceCodeLifetime': 0, 'AllowedCorsOrigins': [], 'AuthenInfo': {'Username': '[Username]', 'Password': '[Password]', 'SecretKey': '[SecretKey]', 'UserRole': [[UserRole]], 'PartnerId': ObjectId('[PartnerId]'), 'AccountId': [ObjectId('[AccountId]')]}}"


${VALUE_DB_PROVISIONING_ROUTE}    {'_id': ObjectId('[RouteId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'AccountId': ObjectId('[AccountId]'), 'DestinationName': '[RouteName]', 'DestinationUrl': 'http://203.150.243.51/message777', 'DestinationStatus': 'Enabled', 'Mode': 'Custom', 'EventType': ['Report'], 'CustomHeaders': {'PartnerRef': '[PartnerRef]'}, 'Things': [[Things]], 'QueueStorageStatus': 'Enabled', 'PickOutSensor': ['AA'], 'ErrorCount': 0, 'CustomProperties': {'ForwardDetail': {'ThingId': False, 'ThingName': True, 'ThingToken': True, 'ThingIdentifier': True, 'IMEI': True, 'ThingCustomDetails': True}}, 'Authentications': {'AuthenType': '[AuthenType]'}}

${VALUE_DB_PROVISIONING_UPDATEROUTE}    {'_id': ObjectId('[RouteId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'AccountId': ObjectId('[AccountId]'), 'DestinationName': '[RouteName]', 'DestinationUrl': 'http://203.150.243.51/message777', 'DestinationStatus': 'Enabled', 'Mode': 'Custom', 'EventType': ['Report'], 'CustomHeaders': {'PartnerRef': '[PartnerRef]'}, 'Things': [ObjectId('[Things]')], 'QueueStorageStatus': 'Enabled', 'PickOutSensor': ['AA'], 'ErrorCount': 0, 'CustomProperties': {'ForwardDetail': {'ThingId': False, 'ThingName': True, 'ThingToken': True, 'ThingIdentifier': True, 'IMEI': True, 'ThingCustomDetails': True}}, 'Authentications': {'AuthenType': '[AuthenType]', 'BasicAuthProperty': None, 'oAuth2Property': None}, 'LastQueueStorageStatusTimestamp': datetime.datetime([LastQueueStorageStatusTimestamp])}

${VALUE_DB_PROVISIONING_REMOVETHINGFROMROUTE}    {'_id': ObjectId('[RouteId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'AccountId': ObjectId('[AccountId]'), 'DestinationName': '[RouteName]', 'DestinationUrl': 'http://203.150.243.51/message777', 'DestinationStatus': 'Enabled', 'Mode': 'Custom', 'EventType': ['Report'], 'CustomHeaders': {'PartnerRef': '[PartnerRef]'}, 'Things': [], 'QueueStorageStatus': 'Enabled', 'PickOutSensor': ['AA'], 'ErrorCount': 0, 'CustomProperties': {'ForwardDetail': {'ThingId': False, 'ThingName': True, 'ThingToken': True, 'ThingIdentifier': True, 'IMEI': True, 'ThingCustomDetails': True}}, 'Authentications': {'AuthenType': '[AuthenType]'}}

${VALUE_DB_PROVISIONING_ADDTHINGTOROUTE_STATUSNOTFOUND}    {'_id': ObjectId('[RouteId]'), 'RemoveStatus': [RemoveStatus], 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'AccountId': ObjectId('[AccountId]'), 'DestinationName': '[RouteName]', 'DestinationUrl': 'http://203.150.243.51/message777', 'DestinationStatus': 'Enabled', 'Mode': 'Custom', 'EventType': ['Report'], 'CustomHeaders': {'PartnerRef': '[PartnerRef]'}, 'Things': [], 'QueueStorageStatus': 'Enabled', 'PickOutSensor': ['AA'], 'ErrorCount': 0, 'CustomProperties': {'ForwardDetail': {'ThingId': False, 'ThingName': True, 'ThingToken': True, 'ThingIdentifier': True, 'IMEI': True, 'ThingCustomDetails': True}}, 'Authentications': {'AuthenType': '[AuthenType]'}}









#=========================Centric=================================#

${VALUE_DB_CENTRICS_WHITELIST}    {'_id': ObjectId([WhitelistId]), 'RemoveStatus': False, 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'OwnerType': '[OwnerType]', 'OwnerId': ObjectId('[OwnerId]'), 'ThingIdentifier': ['[ThingIdentifier]']}