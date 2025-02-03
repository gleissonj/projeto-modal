/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-02-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class ContactUpdateComparison {
     @AuraEnabled public String name { get; set; }
    @AuraEnabled public String cpf { get; set; }
    @AuraEnabled public List<ContactUpdateInfo> phones { get; set; }
    @AuraEnabled public List<ContactUpdateInfo> emails { get; set; }

    // Construtor para inicializar a classe com as informações do contato
    public ContactUpdateComparison(String name, String cpf, List<ContactUpdateInfo> phones, List<ContactUpdateInfo> emails) {
        this.nome = nome;
        this.cpf = cpf;
        this.phones = phones != null ? phones : new List<ContactUpdateInfo>();
        this.emails = emails != null ? emails : new List<ContactUpdateInfo>();
    }

    // Método para adicionar um telefone à lista de telefones
    public void addTelefone(String value, String type) {
        this.telefones.add(new ContactUpdateInfo(valor, tipo));
    }

    // Método para adicionar um email à lista de emails
    public void addEmail(String value, String type) {
        this.emails.add(new ContactUpdateInfo(valor, tipo));
    }
}