/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-02-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactUpdateInfo {
    @AuraEnabled public String value { get; set; }
    @AuraEnabled public String type { get; set; }

    public ContactUpdateInfo(String value, String type) {
        this.value = value;
        this.type = type;
    }
}