*** Variables ***
#-------------------------------------------- Start ENV Master --------------------------------------------#
#STAGING	
# ${ASGARD_COAPAPP_URL}    coap://52.139.231.235:5683
# ${ASGARD_COAPAPP_IMAGE_DDL}    ddl_Staging_CauldronAzue.png
# ${URL_GET_LOG}    https://mg-staging.siamimo.com:30380/elasticsearch/application*/_search?rest_total_hits_as_int=true&ignore_unavailable=true&ignore_throttled=true&preference=1620900474581&timeout=30000ms
# ${VALUE_APPLICATIONNAME_COAPAPP}    Asgard.Coap.APP
#IOT
#${ASGARD_COAPAPP_URL}    coap://52.139.225.243:5683
#${ASGARD_COAPAPP_IMAGE_DDL}    ddl_IoT_Cauldorn_Azure.png
#${URL_GET_LOG}    https://mg-iot.siamimo.com:30380/elasticsearch/application*/_search?rest_total_hits_as_int=true&ignore_unavailable=true&ignore_throttled=true&preference=1620900474581&timeout=30000ms
#applicationName : CoapAPP
#${VALUE_APPLICATIONNAME_COAPAPP}    CoapAPP

#IOT ProvisioningAPIs
${ASGARD_COAPAPP_URL}    coap://52.163.246.237:5685
${ASGARD_COAPAPP_IMAGE_DDL}    ddl_Centricts.png
${URL_GET_LOG}    https://mg-iot.siamimo.com:30380/elasticsearch/application*/_search?rest_total_hits_as_int=true&ignore_unavailable=true&ignore_throttled=true&preference=1620900474581&timeout=30000ms
# applicationName : CoapAPP
${VALUE_APPLICATIONNAME_PROVISIONING}    ProvisioningAPIs
${VALUE_APPLICATIONNAME_CENTRIC}    Magellan.Centric.APIs

#-------------------------------------------- Data Provisioning SignIn   --------------------------------------------#
#IOT
#RootAdmin
${SIGNIN_USERNAME_ROOTADMIN}    QA_SC
${SIGNIN_PASSOWORD_ROOTADMIN}    VGVzdDEyMzQ=
#SupplierAdmin
${SIGNIN_USERNAME_SUPPLIERADMIN}    sctest_supplierddmin
${SIGNIN_PASSOWORD_SUPPLIERADMIN}    dGVzdDEyMzQ=
#CustomerAdmin
${SIGNIN_USERNAME_CUSTOMERADMIN}    sctest_customeradmin
${SIGNIN_PASSOWORD_CUSTOMERADMIN}    dGVzdDEyMzQ=
#Supplier
${SIGNIN_USERNAME_SUPPLIER}    sctest_supplier
${SIGNIN_PASSOWORD_SUPPLIER}    dGVzdDEyMzQ=
#Customer
${SIGNIN_USERNAME_CUSTOMER}    sctest_customer
${SIGNIN_PASSOWORD_CUSTOMER}    dGVzdDEyMzQ=

${PROVISIONING_SIGNIN_VALUE_TST_F1_0_2_002_USERNAME}    MintQA_Test
${PROVISIONING_SIGNIN_VALUE_TST_F1_0_2_002_PASSWORD}    bWludHRlc3QwMDE=22

#-------------------------------------------- Data Provisioning ValidateToken   --------------------------------------------#
${VALUE_PROVISIONING_VALIDATETOKEN_VALUE_TST_F63_0_2_002_ACCESSTOKEN}    q9x4VPMnCSbuew/Upl/alsBv0CIT8Xe0h6rp4yLzvh0y2XuhjZri1SuQbTJfStXTbO1xF/y2XwO4WUEw4QDklpC2AZuTLoEqO8nRvV0Es48Mvd7H0b7I/wPVKmozFH94QTORo5ySgpmDeiChsGDtfNwse653j74297WJUfsCPwyaC0Oh385Wzce+v4D/0VcpEpmsKyR6ZGZvTclL5QVwSIlct59q9dj3GFOMBwL3yywixhHuNd9Oquvy4ct2VIse3uDXApOVVjvfGD/GQASNy4FLzbrW6E7a

#-------------------------------------------- Data Provisioning Group   --------------------------------------------#
${VALUE_PROVISIONING_CREATEGROUP_TST_F19_0_2_004_THINGID_INVALID}    60094094f950f30001413dd6xx
${VALUE_PROVISIONING_UPDATEGROUP_TST_F20_0_2_002_THINGID_INVALID}    60094094f950f30001413dd6xx
# ${VALUE_PROVISIONING_UPDATEGROUP_VALUE_TST_F20_0_2_005_GROUPID_NOTFOUND}    60111f9c2bd0d00001a3b7e0
${VALUE_PROVISIONING_INQUIRYGROUP_TST_F22_0_2_005_GROUPID_NOTFOUND}    60094094f950f30001413dd6

#-------------------------------------------- Data Provisioning Thing   --------------------------------------------#
${VALUE_PROVISIONING_REMOVETHINGFROMACCOUNT_TST_F18_0_2_002_THINGID_INVALID}    60094094f950f30001413dd6xx

#-------------------------------------------- Data Provisioning ConfigGroup   --------------------------------------------#
${VALUE_PROVISIONING_CREATECONFIGGROUP_TST_F25_0_2_004_THINGID_NOTFOUND}    60094094f950f30001413dd6
${VALUE_PROVISIONING_CREATECONFIGGROUP_TST_F25_0_2_005_THINGID_INVALID}    60094094f950f30001413dd6xx
${VALUE_PROVISIONING_INQUIRYCONFIGGROUP_TST_F28_0_2_004_CONFIGGROUPID_INVALID}    60094094f950f30001413dd6xx

#-------------------------------------------- Data Provisioning PullMessage   --------------------------------------------#
${VALUE_PROVISIONING_GENERATEPULLMESSAGE_TST_F59_0_2_004_EXPIREDATE}    2020-12-31T07:58:47.815Z
${VALUE_PROVISIONING_GENERATEPULLMESSAGE_TST_F59_0_2_007_SENSORS}    xx123

${VALUE_PROVISIONING_UPDATEPULLMESSAGE_TST_F60_0_2_004_EXPIREDATE}    2020-12-31T08:08:46.679Z

#-------------------------------------------- Data Provisioning Purchase   --------------------------------------------#
${VALUE_PROVISIONING_CREATEPURCHASE_TST_F70_0_2_007_CUSTOMERID_INVALID}    xx
${VALUE_PROVISIONING_UPDATEPURCHASE_TST_F71_0_2_004_CUSTOMERID_INVALID}    xx
${VALUE_PROVISIONING_INQUIRYPURCHASE_TST_F72_1_1_003_PURCHASEVALUE}    940000240
${VALUE_PROVISIONING_INQUIRYPURCHASE_TST_F72_1_1_004_PURCHASEVALUE}    940000240

#-------------------------------------------- Data Provisioning Customer   --------------------------------------------#
${VALUE_PROVISIONING_CUSTOMER_TST_F73_0_2_002_CUSTOMERID_NOTFOUND}    601b978e53777200011124ca
${VALUE_PROVISIONING_CUSTOMER_TST_F73_0_2_004_CUSTOMERID_INVALID}    xx


#-------------------------------------------- Data Other   --------------------------------------------#
${VALUE_ACCOUNTID_OTHERROLE}    609b822cb7ae1f00014b82d1 
${VALUE_PARTNERID_OTHERROLE}    609b822cb7ae1f00014b82cd
${VALUE_CUSTOMERID_OTHERROLE}    609b822cb7ae1f00014b82cc
${VALUE_PARTNERNAME_OTHERROLE}    SC918365

${VALUE_ACCESSTOKENEXPIRE}    ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBx4jWgDSdjc43yKZfEzo4Tys7tfqpFLnOlKVegMrc8SMg==