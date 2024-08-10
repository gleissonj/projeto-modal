/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-09-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactResponse {
    @AuraEnabled public String nome {get;set;}
    @AuraEnabled public String origem {get;set;}
    @AuraEnabled public String cpf {get;set;}
    @AuraEnabled public String cnpjEmpresa {get;set;}
    @AuraEnabled public String descricaoCargo {get;set;}
    @AuraEnabled public String tipoPessoa {get;set;}
    @AuraEnabled public String idqq3 {get;set;}
    @AuraEnabled public List<Telefone> telefones {get;set;}
    @AuraEnabled public List<Email> emails {get;set;}
    @AuraEnabled public List<OptOut> optOut {get;set;}


}