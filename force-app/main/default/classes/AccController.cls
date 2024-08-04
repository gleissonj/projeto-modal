/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-03-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccList(){

        List<Account> accList = [Select Id, name from Account limit 10];
        System.debug('Adcionado o nome : ' + accList);
        return accList;
    }
        // System.debug('Adcionado o nome : ' + name);
        // return [Select Id, name from Account limit 10];
    //}

    @AuraEnabled
    public static List<Account> findAccList(String keyword){
        String key='%'+keyword+'%';
        return[Select Id, Name from Account where Name Like:key limit 10];
    }
}