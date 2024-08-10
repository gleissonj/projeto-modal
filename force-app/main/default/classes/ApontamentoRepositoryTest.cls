/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public with sharing class ApontamentoRepositoryTest {
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

    public class ApontamentoMockRepository extends ApontamentoRepository{
        
        override public List<Account> getListTeste(){
            return new List<Account>();
        }

    }

}