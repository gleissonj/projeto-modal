/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-04-2025
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

    // @isTest
    // public static void testEmptyFullName() {
    //     // Test when the fullName is empty
    //     String fullName = '';
    //     Map<String, String> result = ApontamentoController.splitName(fullName);
        
    //     Assert.areEqual('', result.get('firstName'), 'Primeiro nome deve ser vazio');
    //     Assert.areEqual('', result.get('lastName'), 'Ultimo nome deve ser vazio');
    // }

    @isTest
    public static void testFirstNameOnly() {
        // Test when the fullName contains only a first name
        String fullName = 'Jon';
        Map<String, String> result = ApontamentoController.splitName(fullName);
        
        Assert.areEqual('Jon', result.get('firstName'), 'Primeiro nome deve ser Jon');
        Assert.areEqual('', result.get('lastName'), 'Ultimo nome deve ser vazio');
    }

    // @IsTest
    // public static void testFirstAndLastName() {
    //     // Test when the fullName contains a first and last name
    //     String fullName = 'Jon Doe';
    //     Map<String, String> result = ApontamentoController.splitName(fullName);
        
    //     Assert.areEqual('Jon', result.get('firstName'), 'Primeiro nome deve ser Jon');
    //     Assert.areEqual('Doe', result.get('lastName'), 'Ultimo nome deve ser Doe');
    // }

    @IsTest
    static void testEmptyFullName() {
        // Test when fullName is an empty string
        Map<String, String> result = ContactController.splitName('');
        
        // Assertions
        Assert.areEqual('', result.get('firstName'), 'First name should be empty');
        Assert.areEqual('', result.get('lastName'), 'Last name should be empty');
        // System.assertEquals('', result.get('firstName'), 'First name should be empty');
        // System.assertEquals('', result.get('lastName'), 'Last name should be empty');
    }

    @IsTest
    static void testSingleName() {
        // Test when fullName contains only one name
        Map<String, String> result = ContactController.splitName('John');
        
        // Assertions
        Assert.areEqual('John', result.get('firstName'), 'First name should be John');
        Assert.areEqual('', result.get('lastName'), 'Last name should be empty');
    }

    @IsTest
    static void testFirstAndLastName() {
        // Test when fullName contains first and last name
        Map<String, String> result = ContactController.splitName('John Doe');
        
        // Assertions
        Assert.areEqual('John', result.get('firstName'), 'First name should be John');
        Assert.areEqual('Doe', result.get('lastName'), 'Last name should be Doe');
    }

    @IsTest
    static void testMultipleLastNames() {
        // Test when fullName contains first name and multiple last names
        Map<String, String> result = ContactController.splitName('John Michael Doe');
        
        // Assertions
        System.assertEquals('John', result.get('firstName'), 'First name should be John');
        System.assertEquals('Michael Doe', result.get('lastName'), 'Last name should be Michael Doe');
    }

    @IsTest
    static void testTrailingSpaces() {
        // Test when fullName contains trailing spaces
        Map<String, String> result = ContactController.splitName('  John Doe  ');
        
        // Assertions
        System.assertEquals('John', result.get('firstName'), 'First name should be John');
        System.assertEquals('Doe', result.get('lastName'), 'Last name should be Doe');
    }

    @IsTest
    static void getString(){
        // Arrange: create mock data (ContactResponse list)
        // Arrange: Create a list of ContactResponse with direct property assignment
        List<ContactResponse> leads = new List<ContactResponse>();

        ContactResponse lead1 = new ContactResponse();
        lead1.cpf = '123.456.789-00'; // Assign CPF directly

        ContactResponse lead2 = new ContactResponse();
        lead2.cpf = '987.654.321-00'; // Assign CPF directly

        leads.add(lead1);
        leads.add(lead2);


        // Act: Call the method to test
        Set<String> result = ContactController.getCPFs(leads);

        // Assert: Check that the Set contains the correct formatted CPF values
        System.assertEquals(2, result.size(), 'Should contain 2 CPF values');
    }

    @isTest
    static void testInvalidCPFs() {
        // Arrange: Create a list of ContactResponse with invalid CPFs
        List<ContactResponse> leads = new List<ContactResponse>();

        ContactResponse lead1 = new ContactResponse();
        lead1.cpf = ''; // Empty CPF

        ContactResponse lead2 = new ContactResponse();
        lead2.cpf = null; // Null CPF

        ContactResponse lead3 = new ContactResponse();
        lead3.cpf = '    '; // Whitespace CPF

        leads.add(lead1);
        leads.add(lead2);
        leads.add(lead3);

        // Act: Call the method to test
        Set<String> result = ContactController.getCPFs(leads);

        // Assert: Check that the Set is empty as there are no valid CPFs
        System.assertEquals(0, result.size(), 'Should not contain any valid CPF values');
    }

    // Test method: Creating a new Lead from a ContactResponse
    @isTest
    static void testCreateNewLead() {
        // Arrange: Create mock data for ContactResponse
        
        // Create mock email data
        EmailRegistrationData emailData = new EmailRegistrationData(
            principal = 'true',
            email = 'test@example.com',
            data_atualizacao = '2025-02-04'
        );
        
        Email mockEmail = new Email(
            id_email = 'email1',
            valor_dado_cadastral = emailData
        );
        
        // Create mock telephone data
        TelephoneRegistrationData phoneData1 = new TelephoneRegistrationData(
            principal = 'true',
            tipo = 'mobile',
            ddi = '55',
            ddd = '11',
            numero = '123456789',
            ramal = null
        );
        
        TelephoneRegistrationData phoneData2 = new TelephoneRegistrationData(
            principal = 'false',
            tipo = 'work',
            ddi = '55',
            ddd = '21',
            numero = '987654321',
            ramal = null
        );
        
        Telephone mockPhone1 = new Telephone(id_telefone = 'phone1', valor_dado_cadastral = phoneData1);
        Telephone mockPhone2 = new Telephone(id_telefone = 'phone2', valor_dado_cadastral = phoneData2);
        
        // Create a mock ContactResponse object
        ContactResponse newLead = new ContactResponse();
        newLead.emails = new List<Email>{ mockEmail };
        newLead.telefones = new List<Telephone>{ mockPhone1, mockPhone2 };
        newLead.optOutTelefone = new optOutTelefoneResponse(false); // Assuming optOutTelefone is some object or Boolean
        
        // Act: Call the createNewLead method
        Lead createdLead = ContactController.createNewLead(newLead);
        
        // Assert: Check that the Lead was created
        System.assertNotEquals(null, createdLead, 'The Lead should be created');

        // Assert: Check if the email was correctly set on the Lead
        System.assertEquals('test@example.com', createdLead.Email, 'The email should match the ContactResponse email');

        // Assert: Check if the first phone number was assigned correctly (depending on the logic in assignPhoneNumbers)
        // For simplicity, we will check if the Phone field is set, assuming assignPhoneNumbers assigns the phone numbers.
        System.assertNotEquals(null, createdLead.Phone, 'Phone number should be assigned to the Lead');
        
        // If the assignPhoneNumbers logic affects other fields, you can further assert them here.
    }

    // @IsTest
    // static void testValidCPF() {
    //     // Test with a valid CPF
    //     String cpf = '12345678909';
    //     String result = YourClassName.formatCPF(cpf);
    //     Assert.areEqual('123.456.789-09', result, 'The CPF should be formatted correctly');
    // }

    private class PostCalloutMock implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest req) {
            // Creating a mock HTTP response
            HttpResponse res = new HttpResponse();
            res.setStatusCode(200);
            res.setBody(getResponse());
            return res;
        }
    }

    // @IsTest
    // static void testCPFWithExtraCharacters() {
    //     // Test with a CPF that has additional non-numeric characters
    //     String cpf = 'abc123.456.789-09xyz';
    //     String result = YourClassName.formatCPF(cpf);
    //     Assert.areEqual('123.456.789-09', result, 'The CPF should be formatted correctly after removing all non-numeric characters');
    // }

    // @IsTest
    // static void testNewLeadCreation() {
    //     // Prepare mock data
    //     ContactResponse lead = new ContactResponse();
    //     lead.cpf = '12345678909';
    //     lead.nome = 'John Doe';
    //     lead.emails = new List<EmailType>{ new EmailType('john.doe@example.com') };
    //     lead.telefones = new List<TelefoneType>{
    //         new TelefoneType('55', '11', '999999999'),
    //         new TelefoneType('55', '11', '988888888')
    //     };
    //     lead.optOutTelefone = new OptOutTelefoneType('N');
        
    //     Id recordTypeId = Schema.SObjectType.Lead.getRecordTypeInfosByName().get('Record Type Name').getRecordTypeId();
    //     Id recordIdPage = '003000000000001';

    //     // Mock the repository methods
    //     Test.startTest();
    //     Test.setMock(LeadRepositoryMock.class, new LeadRepositoryMock(new List<Lead>()));
        
    //     // Call the method
    //     testeRefatorado.processApontamento(lead, recordTypeId, recordIdPage);
        
    //     // Verify the behavior
    //     Lead insertedLead = [SELECT FirstName, LastName, Email, MobilePhone, Phone, RecordTypeId, Prospect__c, HU7_Cpf__c 
    //                          FROM Lead WHERE HU7_Cpf__c = :formatCPF(lead.cpf)];
                             
    //     System.assertEquals('John', insertedLead.FirstName);
    //     System.assertEquals('Doe', insertedLead.LastName);
    //     System.assertEquals('john.doe@example.com', insertedLead.Email);
    //     System.assertEquals('+55 11 988888888', insertedLead.MobilePhone);
    //     System.assertEquals(recordTypeId, insertedLead.RecordTypeId);
    //     System.assertEquals(recordIdPage, insertedLead.Prospect__c);
    //     System.assertEquals(formatCPF(lead.cpf), insertedLead.HU7_Cpf__c);
    //     Test.stopTest();
    // }

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