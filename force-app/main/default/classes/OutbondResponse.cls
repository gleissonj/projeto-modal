/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-08-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OutbondResponse {
   private HttpResponse response;

   public OutbondResponse(HttpResponse response){
      this.response = response;
   }

   public HttpResponse getResponse(){
    return response;
   }

   override
   public String toString(){
    return response.getBody().toString();
   }

   
}