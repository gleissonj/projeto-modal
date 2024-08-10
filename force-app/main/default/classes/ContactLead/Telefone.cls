/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class Telefone {
    @AuraEnabled public String id_telefone {get;set;}
    @AuraEnabled public TelephoneRegistrationData dado_cadastral {get;set;}
}