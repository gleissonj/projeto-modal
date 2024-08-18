/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-18-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class classeteste {
    @AuraEnabled(cacheable=false)
    public static List<ContactResponse> GetContato(){

        HU7_Group_Lead__c cnpj = repositorGroupLead.getProspect(recordIdPage);

        String cnpjConvertido = cnpj.FS1_Cnpj14__c.replaceAll('[^0-9]', '').toString();

        FS1_OutboundResponse response = service.getContactSocio(cnpjConvertido);

        if (response.getResponse().getStatusCode() == 200 && response.toString() != ''){

            List<FS1_ContactSocioResponse> apontamentos = (List<FS1_ContactSocioResponse>) JSON.deserialize(GetResponse.toString(), List<FS1_ContactSocioResponse>.class);

            if(apontamentos.size() > 0){
                for (Integer i=0; i< apontamentos.size(); i++){
                    List<Lead> existingLead = [Select id from Lead where Prospect__c =:recordIdPage and HU7_Cpf__c =:apontamentos[i].cpf Limit 1];
                    RecordType recordTypeFunction = [Select id, name developerName from RecordType where developerName = 'ProspectLead'];

                    if(existingLead.isEmpty()){
                        Lead newLead = new Lead(
                            HU7_Cpf__c = apontamentos[i].cpf,
                            Email = apontamentos[i].emails.size() == 1 ?apontamentos[i].emails[0].valor_dado_cadastral : '',
                            MobilePhone = apontamentos[i].telefones.size() == 2 ? apontamentos[i].telefones[1].valor_dado_cadastral.numero : '',
                            FirstName = apontamentos[i].nome,
                            LastName = apontamentos[i].nome,
                            Phone = apontamentos[i].telefones.size()== 1 ? apontamentos[i].telefones[0].valor_dado_cadastral.numero: '',
                            RecordType = recordTypeFunction.Id,
                            Prospect__c = recordIdPage);

                            respositoryLead.insertLead(newLead);
                            
                    }
                    else {

                        existingLead[0].FirstName  = apontamentos[i].nome;
                        existingLead[0].LastName = apontamentos[i].nome;
                        existingLead[0].Phone = apontamentos[i].telefones.size()== 1 ? apontamentos[i].telefones[0].valor_dado_cadastral.numero: '';
                        existingLead[0].MobilePhone = apontamentos[i].telefones.size() == 2 ? apontamentos[i].telefones[1].valor_dado_cadastral.numero : '';
                        existingLead[0].Email = apontamentos[i].emails.size() == 1 ? apontamentos[i].emails[0].valor_dado_cadastral.email : '';
                        existingLead[0].HU7_Cpf__c = apontamentos[i].cpf;

                        repositoryLead.updateLead(existingLead[0]);
                    }

                }
            }
        }
        
        else{
            return new List<ContactResponse>();
        }
       
        
    }

}