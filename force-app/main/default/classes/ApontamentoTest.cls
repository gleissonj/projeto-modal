/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-08-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@isTest
public class ApontamentoTest {

    // @isTest
    // public static void myUnitTest() {
    //     List<Apontamento> apt = new List<Apontamento>();

    //     Apontamento pt = new Apontamento(

    //         id_apontamento = '1',
    //         tipo_pessoa = '2',
    //         documento = '3',
    //         tipo_apontamento = '4',
    //         nome_apontamento = '5',
    //         empresa_apontamento = '6',
    //         data_ocorrencia = '6',
    //         data_inclusao = '6',
    //         valor_apontamento = '6',
    //         classificacao_apontamento = '6',
    //         descricao_inclusao = '6',
    //         sequencia_apontamento = '2'
    //     );
           
    //     apt.add(pt);
        
    //     ApontamentoController aptControler = new ApontamentoController();
    //     //String te = aptControler.getCommaSeparatedApontamentoNames(apt);

    //     String rere = 'rere';

    // }

    @isTest
    public static void myUnitTest() {
        
        ChamadaUnificadaRepository uni = new ChamadaUnificadaRepository();
        List<Account> acc = uni.getListTeste();

        String t = 'acc';
        Assert.isTrue(acc.isEmpty());
    }

    @isTest
    public static void myUnitTest2() {
        Test.setMock(HttpCalloutMock.class, new PostCalloutMock());

        //ApontamentoController apt = new ApontamentoController();

        List<Apontamento> po = ApontamentoController.getApontamento() ;
        Assert.isFalse(po.isEmpty());
        
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
    
}