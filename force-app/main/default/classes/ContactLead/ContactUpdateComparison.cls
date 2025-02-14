/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-14-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactUpdateComparison {
     @AuraEnabled public String name { get; set; }
    @AuraEnabled public String cpf { get; set; }
    @AuraEnabled public List<ContactUpdateInfo> phones { get; set; }
    @AuraEnabled public List<ContactUpdateInfo> emails { get; set; }
    @AuraEnabled public List<ContactUpdateInfo> mobilePhones { get; set; }
    @AuraEnabled public Boolean leadInsert { get; set; }
    @AuraEnabled public Boolean leadUpdate { get; set; }


    // Construtor para inicializar a classe com as informações do contato
    public ContactUpdateComparison(String name, String cpf, String idLead, List<ContactUpdateInfo> phones, List<ContactUpdateInfo> emails, List<ContactUpdateInfo> mobilePhones) {
        this.nome = nome;
        this.cpf = cpf;
        this.idLead = idLead;
        this.phones = phones != null ? phones : new List<ContactUpdateInfo>();
        this.emails = emails != null ? emails : new List<ContactUpdateInfo>();
        this.mobilePhones = mobilePhones != null ? mobilePhones : new List<ContactUpdateInfo>();
        this.leadInsert = false;
        this.leadUpdate = false;
    }

    // Método para adicionar um telefone à lista de telefones
    public void addTelefone(String value, String type) {
        this.telefones.add(new ContactUpdateInfo(valor, tipo));
    }

    // Método para adicionar um email à lista de emails
    public void addEmail(String value, String type) {
        this.emails.add(new ContactUpdateInfo(valor, tipo));
    }

    public void addMobilePhones(String value, String type) {
        this.emails.add(new ContactUpdateInfo(valor, tipo));
    }

    public void setLeadInsert(Boolean status) {
        this.leadInsert = status;
    
    }

    public void setLeadUpdate(Boolean status) {
        this.leadUpdate = status;
    
    }

    public void addField(String value, String type, String fieldType) {
        // Cria um novo objeto Fs1_ContactUpdateInfo
        Fs1_ContactUpdateInfo updateInfo = new Fs1_ContactUpdateInfo(value, type);

        // Adiciona o objeto à lista de acordo com o tipo de campo
        if (fieldType == 'Telefone') {
            Phones.add(updateInfo);
        } else if (fieldType == 'Email') {
            Emails.add(updateInfo);
        } else if (fieldType == 'MobilePhone') {
            MobilePhones.add(updateInfo);
        } else {
            System.debug('Tipo de campo não reconhecido: ' + fieldType);
        }
    }
}