/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-05-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class chamadaUnificadaRepository {
    
    virtual
    public List<Prospect__c> save(List<Prospect__c> prospects){
        update prospects;
        return prospects;
    }

    virtual
    public Prospect__c save(Prospect__c prospect){
        return save(new List<Prospect__c>{prospect})[0];
    }
    
}