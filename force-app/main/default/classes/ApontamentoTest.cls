/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-08-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@isTest
public class ApontamentoTest {
    @isTest
    public static void myUnitTest() {
        
        ApontamentoRepository uni = new ApontamentoRepository();
        List<Account> acc = uni.getListTeste();

        String t = 'acc';
        Assert.isTrue(acc.isEmpty());
    }

    @isTest
    public static void myUnitTest2() {
        ApontamentoController.service = new ApontamentoMock();
        ApontamentoController.repository = new ApontamentoMockRepository();

        List<Apontamento> apontamentos = ApontamentoController.GetApontamento(10);
        
        Assert.isNotNull(apontamentos);
    }

    @isTest
    public static void myUnitTest3() {
        List<Apontamento> apontamentoFake = new List<Apontamento>();

        // Atribuindo valores às propriedades
        Apontamento apontamento = new Apontamento('001', 'Física', '12345678900', 'Débito', 'Pagamento Atrasado', 
        'Empresa X', '2023-08-08', '2023-08-09', '1000.00', 'Alta', 
        'Inclusão de débito por atraso', '1');

      
        apontamentoFake.add(apontamento);
        
        String apontamentos = ApontamentoController.GetCommaSeparatedApontamentoNames(apontamentoFake);
        
        Assert.areEqual('Pagamento Atrasado', apontamentos);
    }

    @isTest
    public static void myUnitTest4() {
        List<Apontamento> apontamentoFake = new List<Apontamento>();

        // Atribuindo valores às propriedades
        Apontamento apontamento = new Apontamento('001', 'Física', '12345678900', 'Débito', 'Pagamento Atrasado', 
        'Empresa X', '2023-08-08', '2023-08-09', '1000.00', 'Alta', 
        'Inclusão de débito por atraso', '1');

      
        apontamentoFake.add(apontamento);
        
        List<Apontamento> apontamentos = ApontamentoController.GetUniqueApontamento(apontamentoFake);
        
        Assert.isNotNull(apontamentos);
    }

    

    private class PostCalloutMock implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest req) {
            // Creating a mock HTTP response
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody(getResponse());
            return res;
        }
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

    public class ApontamentoMock extends ApontamentoService{
        String payload;

        override public OutbondResponse GetApontamento(String cnpj){
            // Set the mock callout
        Test.setMock(HttpCalloutMock.class, new PostCalloutMock());

        // Perform the HTTP callout
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.example.com/test');
        req.setMethod('GET');
        HttpResponse res = new Http().send(req);

        return new OutbondResponse(res);
        }

    }

    public class ApontamentoMockRepository extends ApontamentoRepository{
        
        override public List<Account> getListTeste(){
            return new List<Account>();
        }

        override public Account upadteAccount(Account a){
            return new Account();
        }

    }


    
    
}