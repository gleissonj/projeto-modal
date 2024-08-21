/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-21-2024
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
    public static void ShouldRetunrListAppointment() {
        ApontamentoController.service = new ApontamentoMock();
        ApontamentoController.repository = new ApontamentoMockRepository();

        List<Apontamento> apontamentos = ApontamentoController.GetApontamento(10);
        
        Assert.isNotNull(apontamentos);
    }

    @isTest
    public static void ShouldReturnSeparateNote() {
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
    public static void ShouldReturnUniqueNote() {
        List<Apontamento> apontamentoFake = new List<Apontamento>();

        // Atribuindo valores às propriedades
        Apontamento apontamento = new Apontamento('001', 'Física', '12345678900', 'Débito', 'Pagamento Atrasado', 
        'Empresa X', '2023-08-08', '2023-08-09', '1000.00', 'Alta', 
        'Inclusão de débito por atraso', '1');

      
        apontamentoFake.add(apontamento);
        
        List<Apontamento> apontamentos = ApontamentoController.GetUniqueApontamento(apontamentoFake);
        
        Assert.isNotNull(apontamentos);
    }

    @isTest
    public static void testValidCPF() {
        String inputCPF = '12345678909';
        String expectedCPF = '123.456.789-09';
        Test.startTest();
        String result = ApontamentoController.formatCPF(inputCPF);
        Test.stopTest();
        Assert.areEqual(expectedCPF, result, 'O CPF deve ser formatado corretamente.');
        //System.assertEquals(expectedCPF, result, 'The CPF should be formatted correctly.');
    }

    @isTest
    static void testCPFWithNonNumericCharacters() {
        String inputCPF = '123.456.789-09';
        String expectedCPF = '123.456.789-09';
        Test.startTest();
        String result = ApontamentoController.formatCPF(inputCPF);
        Test.stopTest();
        Assert.areEqual(expectedCPF, result, 'O CPF deve estar formatado corretamente, mesmo com caracteres não numéricos.');
    }

    // @isTest
    // public static void testCPFWithIncorrectLength() {
    //     String inputCPF = '12345678'; // 8 digits instead of 11
    //     try {
    //         Test.startTest();
    //         ApontamentoController.formatCPF(inputCPF);
    //         Test.stopTest();
    //         System.assert(false, 'O método deve lançar uma exceção para um comprimento de CPF incorreto.');
    //     } catch (IllegalArgumentException e) {
    //         Assert.areEqual('CPF deve ter 11 dígitos.', e.getMessage(), 'A mensagem de exceção deverá indicar que o CPF deve ter 11 dígitos.');
    //     }
    // }

    @isTest
    static void testEmptyCPF() {
        String inputCPF = ''; // Empty string
        try {
            Test.startTest();
            ApontamentoController.formatCPF(inputCPF);
            Test.stopTest();
            System.assert(false, 'The method should throw an exception for an empty CPF.');
        } catch (IllegalArgumentException e) {
            System.assertEquals('CPF must have 11 digits.', e.getMessage(), 'The exception message should indicate the CPF must have 11 digits.');
        }
    }

    @isTest
    public static void testEmptyFullName() {
        // Test when the fullName is empty
        String fullName = '';
        Map<String, String> result = ApontamentoController.splitName(fullName);
        
        Assert.areEqual('', result.get('firstName'), 'Primeiro nome deve ser vazio');
        Assert.areEqual('', result.get('lastName'), 'Ultimo nome deve ser vazio');
    }

    @isTest
    public static void testFirstNameOnly() {
        // Test when the fullName contains only a first name
        String fullName = 'Jon';
        Map<String, String> result = ApontamentoController.splitName(fullName);
        
        Assert.areEqual('Jon', result.get('firstName'), 'Primeiro nome deve ser Jon');
        Assert.areEqual('', result.get('lastName'), 'Ultimo nome deve ser vazio');
    }

    @IsTest
    public static void testFirstAndLastName() {
        // Test when the fullName contains a first and last name
        String fullName = 'Jon Doe';
        Map<String, String> result = ApontamentoController.splitName(fullName);
        
        Assert.areEqual('Jon', result.get('firstName'), 'Primeiro nome deve ser Jon');
        Assert.areEqual('Doe', result.get('lastName'), 'Ultimo nome deve ser Doe');
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