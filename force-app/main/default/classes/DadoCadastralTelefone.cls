/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-08-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DadoCadastral {
    @AuraEnabled public String principal {get;set;}
    @AuraEnabled public String tipo {get;set;}
    @AuraEnabled public String ddi {get;set;}
    @AuraEnabled public String ddd {get;set;}
    @AuraEnabled public String numero {get;set;}
    @AuraEnabled public String ramal {get;set;}
}