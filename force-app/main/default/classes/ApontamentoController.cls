/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 08-04-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public with sharing class ApontamentoController {
    @AuraEnabled(cacheable=false)
    public static List<Apontamento> getApontamento(){
        // String jsonString = '[\n' +
        //     '    {\n' +
        //     '        "name": "John",\n' +
        //     '        "age": 30,\n' +
        //     '        "city": "New York"\n' +
        //     '    },\n' +
        //     '    {\n' +
        //     '        "name": "Jane",\n' +
        //     '        "age": 25,\n' +
        //     '        "city": "Los Angeles"\n' +
        //     '    }\n' +
        //     ']';
        
        String test = getResponse();
        System.debug('Teste : ' + test);

        try{
            Prospect__c pros = new Prospect__c();
            pros.Name = 'Teste';
            pros.CNPJ__c = '123456';
    
            upsert pros CNPJ__c;
            System.debug('Upsert operation successful.');
        }
        catch(DmlException e){
            System.debug('Exception: ' + e.getMessage());
        }
       
        
        List<Apontamento>
         apontamentos = (List<Apontamento>) JSON.deserialize(getResponse(), List<Apontamento>.class);
        System.debug('Adcionado o nome : ' + apontamentos);

        // Iterate over the list and print the details
        for (Apontamento p : apontamentos) {
            System.debug('TipoPessoa: ' + p.tipo_pessoa + ', ClassificacaoApontamento: ' + p.classificacao_apontamento);
        }
        return apontamentos;
    }
    
    
    
    public static String getResponse(){
        String te = '['+
            '{'+
                '"id_apontamento": "003605ce-b7b3-4956-904b-e7080bbbbb54d",'+
                '"tipo_pessoa": "F",'+
                '"valor_apontamento": "87,48",'+
                '"documento": "4a843b13-ea23-42d8-a905-64f44f350d36",'+
                '"tipo_apontamento": "002",'+
                '"nome_apontamento": "TESTE INSPETORIA",'+
                '"empresa_apontamento": "00",'+
                '"data_ocorrencia": "2022-09-26",'+
                '"data_inclusao": "2022-10-07T18:23:47",'+
                '"classificacao_apontamento": "S",'+
                '"descricao_inclusao":"",'+
                '"sequencia_apontamento": 0'+
            '},'+
            '{'+
                '"id_apontamento": "003605ce-b7b3-4956-904b-e7080bbbbb54d",'+
                '"tipo_pessoa": "J",'+
                '"valor_apontamento": "87,48",'+
                '"documento": "4a843b13-ea23-42d8-a905-64f44f350d36",'+
                '"tipo_apontamento": "002",'+
                '"nome_apontamento": "TESTE INSPETORIA",'+
                '"empresa_apontamento": "00",'+
                '"data_ocorrencia": "2022-09-26",'+
                '"data_inclusao": "2022-10-07T18:23:47",'+
                '"classificacao_apontamento": "N",'+
                '"descricao_inclusao":"",'+
                '"sequencia_apontamento": 0'+
            '}'+
        ']';
        
        return te;
    }
}