/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 08-05-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public with sharing class Apontamento {
    @AuraEnabled public String id_apontamento {get;set;}
    @AuraEnabled public String tipo_pessoa {get;set;}
    @AuraEnabled public String documento {get;set;}
    @AuraEnabled public String tipo_apontamento {get;set;}
    @AuraEnabled public String nome_apontamento {get;set;}
    @AuraEnabled public String empresa_apontamento {get;set;}
    @AuraEnabled public String data_ocorrencia {get;set;}
    @AuraEnabled public String data_inclusao {get;set;}
    @AuraEnabled public String valor_apontamento {get;set;}
    @AuraEnabled public String classificacao_apontamento {get;set;}
    @AuraEnabled public String descricao_inclusao {get;set;}
    @AuraEnabled public String sequencia_apontamento {get;set;}
}