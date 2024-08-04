/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-04-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class FarolPldController {
    @AuraEnabled(cacheable=true)
    public static FarolPld getFarolPld(){
        
        String test = getResponse();
        System.debug('Testeeee : ' + test);
        
        FarolPldData pld = (FarolPldData) JSON.deserialize(getResponse(), FarolPldData.class);
        System.debug('Adcionado o nome : ' + pld);

        System.debug('risco: ' + pld.data.risco);
        // Iterate over the list and print the details
        // for (Apontamento p : apontamentos) {
        //     System.debug('TipoPessoa: ' + p.tipo_pessoa + ', ClassificacaoApontamento: ' + p.classificacao_apontamento);
        // }
        return pld.data;
    }
    
    
    
    public static String getResponse(){
        String te = '{'+
            '"data":'+
                '{'+
                    '"id_analise": "003605ce-b7b3-4956-904b-e7080bbbbb54d",'+
                    '"risco": "MEDIO",'+
                    '"situacao_processamento": "SUCESSO"'+
                '}'+
        '}';
        
        return te;
    }
}