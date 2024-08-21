/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 08-21-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public with sharing class testeRefatorado {
    @AuraEnabled(cacheable=false)
    public static List<ContactResponse> GetContato() {
        // Recupera o prospect associado ao recordIdPage
        HU7_Group_Lead__c cnpj = repositorGroupLead.getProspect(recordIdPage);
        
        // Converte o CNPJ para uma string numérica
        String cnpjConvertido = cnpj.FS1_Cnpj14__c.replaceAll('[^0-9]', '');
        
        // Realiza a chamada ao serviço para obter os contatos associados
        FS1_OutboundResponse response = service.getContactSocio(cnpjConvertido);
        
        // Verifica se a resposta do serviço foi bem-sucedida e se contém dados
        if (response.getResponse().getStatusCode() == 200 && String.isNotBlank(response.toString())) {
            List<FS1_ContactSocioResponse> apontamentos = (List<FS1_ContactSocioResponse>) JSON.deserialize(response.toString(), List<FS1_ContactSocioResponse>.class);
            
            if (!apontamentos.isEmpty()) {
                RecordType recordTypeFunction = [SELECT Id FROM RecordType WHERE DeveloperName = 'ProspectLead' LIMIT 1];
                
                for (FS1_ContactSocioResponse apontamento : apontamentos) {
                    processApontamento(apontamento, recordTypeFunction.Id);
                }
            }
        } else {
            return new List<ContactResponse>();
        }
        
        return null; // Retorne null caso não precise retornar nada
    }
    
    private static void processApontamento(FS1_ContactSocioResponse apontamento, Id recordTypeId) {
        List<Lead> existingLeads = [SELECT Id FROM Lead WHERE Prospect__c = :recordIdPage AND HU7_Cpf__c = :apontamento.cpf LIMIT 1];
        
        if (existingLeads.isEmpty()) {
            Lead newLead = new Lead(
                HU7_Cpf__c = apontamento.cpf,
            Email = apontamento.emails.size() == 1 ? apontamento.emails[0].valor_dado_cadastral.email : '',
            MobilePhone = apontamento.telefones.size() == 2 && (apontamento.optOutTelefone.data.indicador_possui_telefone_bloqueado == 'N' || apontamento.optOutTelefone.data.indicador_possui_telefone_bloqueado == null) ? apontamento.telefones[1].valor_dado_cadastral.ddi + apontamento.telefones[1].valor_dado_cadastral.ddd + apontamento.telefones[1].valor_dado_cadastral.numero : '',
            FirstName = apontamento.nome,
            LastName = apontamento.nome,
            Phone = apontamento.telefones.size() == 1 && (apontamento.optOutTelefone.data.indicador_possui_telefone_bloqueado == 'N' || apontamento.optOutTelefone.data.indicador_possui_telefone_bloqueado == null)  ? apontamento.telefones[0].valor_dado_cadastral.ddi + apontamento.telefones[0].valor_dado_cadastral.ddd + apontamento.telefones[0].valor_dado_cadastral.numero : '',
            RecordTypeId = recordTypeId,
            Prospect__c = recordIdPage
                );
            
            respositoryLead.insertLead(newLead);
        } else {
            Lead existingLead = existingLeads[0];
            existingLead.FirstName = apontamento.nome;
            existingLead.LastName = apontamento.nome;
            existingLead.Phone = apontamento.telefones.size() == 1 && (apontamento.optOutTelefone.data.indicador_possui_telefone_bloqueado == 'N' || apontamento.optOutTelefone.data.indicador_possui_telefone_bloqueado == null)  ? apontamento.telefones[0].valor_dado_cadastral.ddi + apontamento.telefones[0].valor_dado_cadastral.ddd + apontamento.telefones[0].valor_dado_cadastral.numero : '';
            existingLead.MobilePhone = apontamento.telefones.size() == 2 && (apontamento.optOutTelefone.data.indicador_possui_telefone_bloqueado == 'N' || apontamento.optOutTelefone.data.indicador_possui_telefone_bloqueado == null)  ? apontamento.telefones[0].valor_dado_cadastral.ddi + apontamento.telefones[0].valor_dado_cadastral.ddd + apontamento.telefones[0].valor_dado_cadastral.numero : '';
            RecordTypeId = recordTypeId;
            existingLead.Email = apontamento.emails.size() == 1 ? apontamento.emails[0].valor_dado_cadastral.email : '';
            existingLead.HU7_Cpf__c = apontamento.cpf;
            
            repositoryLead.updateLead(existingLead);
        }
    }
    
    
    public static Map<String, String> splitName(String fullName) {
        Map<String, String> nameParts = new Map<String, String>();
        
        if (String.isEmpty(fullName)) {
            nameParts.put('firstName', '');
            nameParts.put('lastName', '');
            return nameParts;
        }
        
        // Dividindo o nome completo por espaço
        List<String> nameArray = fullName.split(' ');
        
        if (nameArray.size() > 1) {
            // O primeiro elemento será o primeiro nome
            nameParts.put('firstName', nameArray[0]);
            
            // O restante será considerado como o sobrenome
            nameArray.remove(0);
            nameParts.put('lastName', String.join(nameArray, ' '));
        } else {
            // Se só houver um nome, assume que é o primeiro nome
            nameParts.put('firstName', fullName);
            nameParts.put('lastName', '');
        }
        
        return nameParts;
    }
    
}