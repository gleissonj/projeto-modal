/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-08-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public virtual with sharing class ApontamentoRepository {
    virtual
    public List<Prospect__c> save(List<Prospect__c> prospects){
        update prospects;
        return prospects;
    }

    virtual
    public Prospect__c save(Prospect__c prospect){
        return save(new List<Prospect__c>{prospect})[0];
    }

    virtual 
    public List<Account> getListTeste(){
        return [Select Id, name from Account limit 10];
    } 
    
    virtual
    public Account upadteAccount(Account e){
        update e;
        return e;
    }
}