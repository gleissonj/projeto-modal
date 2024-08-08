/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 08-08-2024
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

    public Apontamento(String idAp, String tpPessoa, String doc, String tpApo, String nomeApo, String empApo, String dtOcor, String dtInclusao, String vlApo, String clApo, String dsApo, String seqAp){

        this.id_apontamento = idAp;
        this.tipo_pessoa = tpPessoa;
        this.documento = doc;
        this.tipo_apontamento = tpApo;
        this.nome_apontamento = nomeApo;
        this.empresa_apontamento = empApo;
        this.data_ocorrencia = dtOcor;
        this.data_inclusao = dtInclusao;
        this.valor_apontamento = vlApo;
        this.classificacao_apontamento = clApo;
        this.descricao_inclusao = dsApo;
        this.sequencia_apontamento = seqAp;
    }

}