/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 08-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public with sharing class testeRefatorado {
    @AuraEnabled(cacheable=false)
    public static List<ContactResponse> GetContato() {
        // Recupera o prospect associado ao recordIdPage
        try{
            HU7_Group_Lead__c cnpj = repositorGroupLead.getProspect(recordIdPage);
        
            // Converte o CNPJ para uma string numérica
            String cnpjConvertido = cnpj.FS1_Cnpj14__c.replaceAll('[^0-9]', '');
            
            // Realiza a chamada ao serviço para obter os contatos associados
            FS1_OutboundResponse response = service.getContactSocio(cnpjConvertido);
            
            // Verifica se a resposta do serviço foi bem-sucedida e se contém dados
            if (response.getResponse().getStatusCode() == 200 && String.isNotBlank(response.toString())) {
                List<FS1_ContactSocioResponse> apontamentos = (List<FS1_ContactSocioResponse>) JSON.deserialize(response.toString(), List<FS1_ContactSocioResponse>.class);
                
                if (!apontamentos.isEmpty()) {
                    Id recordTypeFunction = FS1_LeadRecordType.prospectId();
                    
                    for (FS1_ContactSocioResponse apontamento : apontamentos) {
                        processApontamento(apontamento, recordTypeFunctionId, recordIdPage);
                    }
                }
            } else {
                return new List<ContactResponse>();
            }
            
            return null; // Retorne null caso não precise retornar nada
        }
        catch(JSONException ex){
            Log log = new Log();
            log.setSigla('FS1');
            log.setClass('FS1_ProposalTrackingController');
            log.setMethod('GetContato');
            log.addAttributes('Server', response.toString());
            log.warn('Outbound tracking request');
            throw new AuraHandledException('exceptionText');
        } catch (AuraHandledException ex){
            throw ex;
        } catch (Exception ex){
            Log log = new Log();
            log.setSigla('FS1');
            log.setClass('FS1_ProposalTrackingController');
            log.setMethod('GetContato');
            log.addAttributes('Server', response.toString());
            log.error('Outbound tracking request');
            throw new AuraHandledException(ex.getMessage() + '\n' + ex.getStackTraceString());
        }
    }
    
    private static void processApontamento(FS1_ContactSocioResponse apontamento, Id recordTypeId, Id recordIdPage) {
        if (apontamento.codigo_sap != '') {
        }
        }
    }
    
    public static void processApontamento(FS1_ContactSocioResponse lead, Id recordTypeId, Id recordIdPage) {
        List<Lead> existingLeads = repositoryLead.findLeadByLeadCPF(recordIdPage, lead.cpf);
		Map<String, String>nameParts = splitName(lead.nome);
        
        if (existingLeads.isEmpty()) {
            Lead newLead = new Lead(
                HU7_Cpf__c = format(lead.cpf),
            Email = lead.emails.size() == 1 ? lead.emails[0].valor_dado_cadastral.email : '',
            MobilePhone = lead.telefones.size() >1 && (lead.optOutTelefone.data.indicador_possui_telefone_bloqueado == 'N' || lead.optOutTelefone.data.indicador_possui_telefone_bloqueado == null) ? '+' + lead.telefones[1].valor_dado_cadastral.ddi + lead.telefones[1].valor_dado_cadastral.ddd + lead.telefones[1].valor_dado_cadastral.numero : '',
            FirstName = nameParts.get('firstName'),
            LastName = nameParts.get('lastName'),
            Phone = lead.telefones.size() == 0 && (lead.optOutTelefone.data.indicador_possui_telefone_bloqueado == 'N' || lead.optOutTelefone.data.indicador_possui_telefone_bloqueado == null)  ? '+' + lead.telefones[0].valor_dado_cadastral.ddi + lead.telefones[0].valor_dado_cadastral.ddd + lead.telefones[0].valor_dado_cadastral.numero : '',
            RecordTypeId = recordTypeId,
            Prospect__c = recordIdPage
                );
            
            respositoryLead.insertLead(newLead);
        } else {
            Lead existingLead = existingLeads[0];
            existingLead.FirstName = nameParts.get('firstName');
            existingLead.LastName = nameParts.get('lastName');
            existingLead.Phone = lead.telefones.size() > 0 && (lead.optOutTelefone.data.indicador_possui_telefone_bloqueado == 'N' || lead.optOutTelefone.data.indicador_possui_telefone_bloqueado == null)  ? '+' + lead.telefones[0].valor_dado_cadastral.ddi + lead.telefones[0].valor_dado_cadastral.ddd + lead.telefones[0].valor_dado_cadastral.numero : '';
            existingLead.MobilePhone = lead.telefones.size() > 1 && (lead.optOutTelefone.data.indicador_possui_telefone_bloqueado == 'N' || lead.optOutTelefone.data.indicador_possui_telefone_bloqueado == null)  ? '+' + lead.telefones[0].valor_dado_cadastral.ddi + lead.telefones[0].valor_dado_cadastral.ddd + lead.telefones[0].valor_dado_cadastral.numero : '';
            RecordTypeId = recordTypeId;
            existingLead.Email = lead.emails.size() > 0 ? lead.emails[0].valor_dado_cadastral.email : '';
            existingLead.HU7_Cpf__c = formatCPF(lead.cpf);
            
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