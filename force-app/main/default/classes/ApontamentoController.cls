/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 08-12-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public with sharing class ApontamentoController {
    public static ApontamentoRepository repository;
    public static ApontamentoService service;
    static {
        repository = new ApontamentoRepository();
        service = new ApontamentoService();
    }
    
    @AuraEnabled(cacheable=false)
    public static List<Apontamento> getApontamento(Integer Id){
        
        try{
            
            List<Account> account = repository.getListTeste();

            OutbondResponse response = service.GetApontamento('212121');
            System.debug('Teste : ' + response.toString());
            
            System.debug('Teste : ' + response);
          
            List<Apontamento>
                apontamentos = (List<Apontamento>) JSON.deserialize(response.toString(), List<Apontamento>.class);
            System.debug('Adcionado o nome : ' + apontamentos);
            
            List<Apontamento> uniqueApontamentos = GetUniqueApontamento(apontamentos);
            
            String resultApontamentos = GetCommaSeparatedApontamentoNames(uniqueApontamentos);
            // Iterate over the list and print the details
            for (Apontamento p : uniqueApontamentos) {
                System.debug('TipoPessoa: ' + p.tipo_pessoa + ', ClassificacaoApontamento: ' + p.classificacao_apontamento);
            }
            
            Account acc = repository.upadteAccount(new Account());

            System.debug('Terminou : ' + apontamentos);

            return uniqueApontamentos;
        }
        catch(Exception e){
            System.debug('Exception: ' + e.getMessage());
            System.debug('Exception: ' + e.getLineNumber());
            System.debug('Exception: ' + e.getCause());
            return null;
        }
        
        
    }
    
    public static String GetCommaSeparatedApontamentoNames(List<Apontamento> apontamentos){
        List<String> apontamentoNames = new List<String>();
        
        for (Apontamento apontamento : apontamentos) {
            apontamentoNames.add(apontamento.nome_apontamento);
        }
        return String.join(apontamentoNames, ',');
    }

    

    public static List<Apontamento> GetUniqueApontamento(List<Apontamento> apontamentos){
        Set<String> seenApontamento = new Set<String>();
            List<Apontamento> uniqueApontamentos = new List<Apontamento>();
            
            for (Apontamento a : apontamentos) {
                if(!seenApontamento.contains(a.tipo_apontamento)){
                    
                    seenApontamento.add(a.tipo_apontamento);
                    uniqueApontamentos.add(a);
                }
            }

            return uniqueApontamentos;
    }
    
    public static String GetPayload(String cnpj, String nome){
        
        return '{'+
            '"cpf_cnpj":"'+cnpj+'", '+
            '"nome":' +nome+', '+
            '"tipo_pessoa": "J" ,'+
            '"codigo_produto": "MIDDLE_PRINCIPAL",'+
            '"opera_cambio": false,'+
            '"ibba": "ULTRA"' +
            '}';
    }
    
    public static String GetResponse(){
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