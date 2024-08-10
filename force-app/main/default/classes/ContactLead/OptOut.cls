/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-08-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OptOut {
    @AuraEnabled public String id_pessoa {get;set;}
    @AuraEnabled public String codigo_grupo {get;set;}
    @AuraEnabled public String nome_grupo {get;set;}
    @AuraEnabled public String codigo_assunto {get;set;}
    @AuraEnabled public String nome_assunto {get;set;}
    @AuraEnabled public String descricao_completa_assunto {get;set;}
    @AuraEnabled public String descricao_resumida_assunto {get;set;}
    @AuraEnabled public String codigo_meio_comunicacao {get;set;}
    @AuraEnabled public String nome_meio_comunicacao {get;set;}
    @AuraEnabled public String nome_meio_comunicacao_canais {get;set;}
    @AuraEnabled public String codigo_canal {get;set;}
    @AuraEnabled public String nome_canal {get;set;}
    @AuraEnabled public String codigo_aplicativo {get;set;}
    @AuraEnabled public String nome_aplicativo {get;set;}
    @AuraEnabled public String numero_funcional_colaborador {get;set;}
    @AuraEnabled public String indicador_preferencia {get;set;}
}