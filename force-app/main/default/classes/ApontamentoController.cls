/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 08-07-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public with sharing class ApontamentoController {
    public static chamadaUnificadaRepository repository;

    static {
        repository = new chamadaUnificadaRepository();
    }

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
        

        System.debug('Teste Payload : ' + getPayload('cnpj', 'xfdfd'));


        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/37200006/json/');
        request.setMethod('GET');

        HttpResponse response = http.send(request);
        
        System.debug('Teste : ' + response.getStatusCode());
        System.debug('Teste2 : ' + response.getBody());
        cnpj = cnpj.replaceAll('[^0-9]', '');

        Object tes = JSON.deserializeUntyped(response.getBody());
        if (tes instanceof Map<String, Object>) {
            Map<String, Object> resultMap = (Map<String, Object>) tes;

            String testes = (String) resultMap.get('bairroer');
            System.debug('Teste3 : ' + testes);
            

            return new List<Apontamento>();
        }

        System.debug('tes : ' + tes);

       


        String test = getPayload('r434242342342', 'teste');
        System.debug('Teste : ' + test);
        
        // try{
        //     Prospect__c pros = new Prospect__c();
        //     pros.Id = 'a00bm00000BMfCgAAL';
        //     pros.Name = 'Testeee';
        //     pros.CNPJ__c = '12345678';
            
        //     repository.save(pros);
            
        //     //update pros;
        //     //upsert pros CNPJ__c;
        //     System.debug('Upsert operation successful.');
        // }
        // catch(DmlException e){
        //     System.debug('Exception: ' + e.getMessage());
        // }
        
        
        List<Apontamento>
            apontamentos = (List<Apontamento>) JSON.deserialize(getPayload('32323','rerrere'), List<Apontamento>.class);
        System.debug('Adcionado o nome : ' + apontamentos);
        
        Set<String> seenApontamento = new Set<String>();
        List<Apontamento> uniqueApontamentos = new List<Apontamento>();
        
        for (Apontamento a : apontamentos) {
            if(!seenApontamento.contains(a.tipo_apontamento)){
                
                seenApontamento.add(a.tipo_apontamento);
                uniqueApontamentos.add(a);
            }
        }
        
        String resultApontamentos = getCommaSeparatedApontamentoNames(uniqueApontamentos);
        // Iterate over the list and print the details
        for (Apontamento p : uniqueApontamentos) {
            System.debug('TipoPessoa: ' + p.tipo_pessoa + ', ClassificacaoApontamento: ' + p.classificacao_apontamento);
        }
        
        
        return uniqueApontamentos;
    }
    
    public static String getCommaSeparatedApontamentoNames(List<Apontamento> apontamentos){
        // Create a list to hold the names
        List<String> apontamentoNames = new List<String>();
        
        // Iterate through the list of products and collect the names
        for (Apontamento apontamento : apontamentos) {
            apontamentoNames.add(apontamento.nome_apontamento);
        }
        
        // Join the list of names with a comma separator
        String tes = String.join(apontamentoNames, ',');
        System.debug('String nome : ' + tes);
        
        
        return tes;
        
    }

    public static String getPayload(String cnpj, String nome){

        return '{'+
            '"cpf_cnpj":"'+cnpj+'", '+
            '"nome":' +nome+', '+
            '"tipo_pessoa": "J" ,'+
            '"codigo_produto": "MIDDLE_PRINCIPAL",'+
            '"opera_cambio": false,'+
            '"ibba": "ULTRA"' +
            '}';
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
            '},'+
            '{'+
            '"id_apontamento": "003605ce-b7b3-4956-904b-e7080bbbbb54d",'+
            '"tipo_pessoa": "J",'+
            '"valor_apontamento": "87,48",'+
            '"documento": "4a843b13-ea23-42d8-a905-64f44f350d36",'+
            '"tipo_apontamento": "003",'+
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