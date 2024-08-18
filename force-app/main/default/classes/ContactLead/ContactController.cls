/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 08-18-2024
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

            Map<String, String> nameParts = splitName('Gleisson de Jesus Evangelista');

            System.debug('First Name: ' + nameParts.get('firstName')); // Output: John
            System.debug('Last Name: ' + nameParts.get('lastName'));  // Output: Doe

            System.debug('Nome : ' + nameParts);

        System.debug('Adcionado o nome : ' + apontamentos);

        System.debug('Adcionado o nome : ' + apontamentos.size());

        System.debug('Adcionado o nome : ' + apontamentos[0].optOutTelefone.data.indicador_possui_telefone_bloqueado);

        for (Integer i = 0; i < apontamentos.size(); i++){
            String telefone1 = apontamentos[i].telefones.size() > 0 && (apontamentos[i].optOutTelefone?.data?.indicador_possui_telefone_bloqueado == 'N'|| apontamentos[i].optOutTelefone?.data?.indicador_possui_telefone_bloqueado == null) ? apontamentos[i].telefones[0].valor_dado_cadastral.numero : '';
            String telefone2 = apontamentos[i].telefones.size() == 2 && (apontamentos[i].optOutTelefone?.data?.indicador_possui_telefone_bloqueado == 'N' || apontamentos[i].optOutTelefone?.data?.indicador_possui_telefone_bloqueado == null) ? apontamentos[i].telefones[1].valor_dado_cadastral.numero : '';
            System.debug('telefone 1 : ' + telefone1);
            System.debug('telefone 2 : ' + telefone2);
        }


        // for(Apontamento apontamento : apontamentos){
        //     Lead ac = new Lead(
        //         MobilePhone = '44444',
        //         CPF__c = '1234567',
        //         Phone = '342423424',
        //         Company = 'teste',
        //         FirstName = 'Gleisson',
        //         LastName = 'Evangelsta'
        //     );
        // }
        // upsert ac CPF__c ;
        //System.debug('Upsert ok : ' + ac);

        System.debug('Upsert ok : ');

        return new List<ContactResponse>();
    }

    // public static List<ContactResponse> GetMoreUpToDateContact(List<ContactResponse> apontamentos){
        
    //     List<ContactResponse> contactResponse = new List<ContactResponse>();
        
    //     for(Apontamento apontamento : apontamentos){
    //         ContactResponse contResponse = new ContactResponse();

    //     }

    //     return new List<ContactResponse>();
    // }

    public static Map<String, String> splitName(String fullName) {
        Map<String, String> nameParts = new Map<String, String>();

        if (String.isEmpty(fullName)) {
            nameParts.put('firstName', '');
            nameParts.put('lastName', '');
            return nameParts;
        }

        // Dividindo o nome completo por espaço
        List<String> nameArray = fullName.split(' ');

        if (nameArray.size() > 1) {
            // O primeiro elemento será o primeiro nome
            nameParts.put('firstName', nameArray[0]);

            // O restante será considerado como o sobrenome
            nameArray.remove(0);
            nameParts.put('lastName', String.join(nameArray, ' '));
        } else {
            // Se só houver um nome, assume que é o primeiro nome
            nameParts.put('firstName', fullName);
            nameParts.put('lastName', '');
        }

        return nameParts;
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
                        '"valor_dado_cadastral": {'+
                            '"principal": "false",'+
                            '"ddi": "87,48",'+
                            '"ddd": "87,48",'+
                            '"numero": "87,48",'+
                            '"ramal": "87,48",'+
                            '"data_atualizacao": "2022-10-07T18:23:47",'+
                            '"data_criacao": "2022-10-07T18:23:47"'+
                        '}'+
                    '},'+
                    '{'+
                        '"id_telefone": "2",'+
                        '"valor_dado_cadastral": {'+
                                '"principal": "false",'+
                                '"ddi": "87,48",'+
                                '"ddd": "87,48",'+
                                '"numero": "87,48",'+
                                '"ramal": "87,48",'+
                                '"data_atualizacao": "2022-10-07T18:23:47",'+
                                '"data_criacao": "2022-10-07T18:23:47"'+
                            '}'+
                    '}'+
                '],'+
                '"emails": [' +
                    '{' +
                        '"id_email": "123",'+
                        '"valor_dado_cadastral": {' +
                            '"principal": "false",'+
                            '"email": "87,48",'+
                            '"data_atualizacao": "2022-10-07T18:23:47"'+
                        '}'+
                    '},' +
                    '{' +
                        '"id_email": "456",'+
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
                '],' +
                '"optOutTelefone":' +
                    '{' +
                        '"data":{' +
                            '"indicador_possui_telefone_bloqueado": "S"'+
                            '}' +
                    '}' +
            '},' +
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
                        '"valor_dado_cadastral": {'+
                            '"principal": "false",'+
                            '"ddi": "87,48",'+
                            '"ddd": "87,48",'+
                            '"numero": "87,48",'+
                            '"ramal": "87,48",'+
                            '"data_atualizacao": "2022-10-07T18:23:47",'+
                            '"data_criacao": "2022-10-07T18:23:47"'+
                        '}'+
                    '},'+
                    '{'+
                        '"id_telefone": "2",'+
                        '"valor_dado_cadastral": {'+
                                '"principal": "false",'+
                                '"ddi": "87,48",'+
                                '"ddd": "87,48",'+
                                '"numero": "87,48",'+
                                '"ramal": "87,48",'+
                                '"data_atualizacao": "2022-10-07T18:23:47",'+
                                '"data_criacao": "2022-10-07T18:23:47"'+
                            '}'+
                    '}'+
                '],'+
                '"emails": [' +
                    '{' +
                        '"id_email": "123",'+
                        '"valor_dado_cadastral": {' +
                            '"principal": "false",'+
                            '"email": "87,48",'+
                            '"data_atualizacao": "2022-10-07T18:23:47"'+
                        '}'+
                    '},' +
                    '{' +
                        '"id_email": "456",'+
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
                '],' +
                '"optOutTelefone":' +
                    '{' +
                        '"data":{' +
                            '"indicador_possui_telefone_bloqueado": "N"'+
                            '}' +
                    '}' +
            '}' +
       ']';
        
        
        
        return te;
    }
}