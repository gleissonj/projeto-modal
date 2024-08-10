/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 08-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public with sharing class ContactController {

    //public static ApontamentoRepository repository;
    public static ContactService service;
    static {
       // repository = new ApontamentoRepository();
        service = new ContactService();
    }


    @AuraEnabled(cacheable=false)
    public static List<ContactResponse> GetContato(){

        OutbondResponse response = service.getContact('212121');
        
        List<ContactResponse>
            apontamentos = (List<ContactResponse>) JSON.deserialize(GetResponse().toString(), List<ContactResponse>.class);
        System.debug('Adcionado o nome : ' + apontamentos);
        
        return new List<ContactResponse>();
    }

    public static List<ContactResponse> GetMoreUpToDateContact(List<Apontamento> apontamentos){
        
        List<ContactResponse> contactResponse = new List<ContactResponse>();
        
        for(Apontamento apontamento : apontamentos){
            ContactResponse contResponse = new ContactResponse();

        }

        return new List<ContactResponse>();
    }
    
    public static String GetResponse(){
        String te = '['+
            '{'+
            '"nome": "003605ce-b7b3-4956-904b-e7080bbbbb54d",'+
            '"origem": "F",'+
            '"cpf": "87,48",'+
            '"cnpjEmpresa": "4a843b13-ea23-42d8-a905-64f44f350d36",'+
            '"descricaoCargo": "002",'+
            '"tipoPessoa": "TESTE INSPETORIA",'+
            '"ideq3": "00",'+
            '"telefones": ['+
            '{'+
            '"id_telefone": "1",'+
            '"numero_telefone": "87,48",'+
            '"ddi": "87,48",'+
            '"ddd": "87,48",'+
            '"numero": "87,48",'+
            '"ramal": "87,48",'+
            '"data_atualizacao": "2022-10-07T18:23:47",'+
            '"data_criacao": "2022-10-07T18:23:47"'+
            '}'+
            '],'+
            '"emails": [' +
            '{' +
            '"id_email": "434",'+
            '"valor_dado_cadastral": {' +
            '"principal": "false",'+
            '"email": "87,48",'+
            '"data_atualizacao": "2022-10-07T18:23:47"'+
            '}'+
            
        '}' +
            '],'+
            '"optOut": [' +
            '{' +
            '"id_pessoa": "434",'+
            '"codigo_grupo": "1",'+
            '"nome_grupo": "TESTE INSPETORIA",'+
            '"codigo_assunto": "002",'+
            '"nome_assunto": "teste",'+
            '"descricao_resumida_assunto": "434",'+
            '"descricao_completa_assunto": "434",'+
            '"codigo_meio_comunicacao": "434",'+
            '"nome_meio_comunicacao": "434",'+
            '"nome_meio_comunicacao_canais": "434",'+
            '"codigo_canal": "434",'+
            '"nome_canal": "434",'+
            '"codigo_aplicativo": "434",'+
            '"nome_aplicativo": "434",'+
            '"numero_funcional_colaborador": "434",'+
            '"indicador_preferencia": "434",'+
            '"data_atualizacao": "434"'+
            
        '}' +
            ']' +
            
        '}' +
            ']';
        
        
        
        return te;
    }
}