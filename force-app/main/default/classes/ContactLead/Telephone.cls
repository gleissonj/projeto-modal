/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-11-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class Telephone {
    @AuraEnabled public String id_telefone {get;set;}
    @AuraEnabled public TelephoneRegistrationData valor_dado_cadastral {get;set;}
}