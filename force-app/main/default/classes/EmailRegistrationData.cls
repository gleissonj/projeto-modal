/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class EmailRegistrationData {
    @AuraEnabled public String principal {get;set;}
    @AuraEnabled public String email {get;set;}
    @AuraEnabled public String data_atualizacao {get;set;}
}