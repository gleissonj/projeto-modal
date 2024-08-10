/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public virtual with sharing class ContactService {
    virtual
    public OutbondResponse getContact(string cnpj) {
        Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://viacep.com.br/ws/37200006/json/');
            request.setMethod('GET');
            
            //OutbondResponse response = http.send(request);

            return new OutbondResponse(new HttpResponse());
    }
}