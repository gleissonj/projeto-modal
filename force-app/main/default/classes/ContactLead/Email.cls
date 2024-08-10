/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class Email {
    @AuraEnabled public String id_email {get;set;}
    @AuraEnabled public EmailRegistrationData valor_dado_cadastral {get;set;}
}