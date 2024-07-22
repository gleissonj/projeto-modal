/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-20-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger Leads on Lead (before insert, before update, after insert, after update ) {
    System.debug('Contexto de insert' + Trigger.isBefore + ' ' + Trigger.isInsert);
    System.debug('Contexto de insert' + Trigger.isAfter + ' ' + Trigger.isInsert);

    System.debug('Contexto de update' + Trigger.isBefore + ' ' + Trigger.isUpdate);
    System.debug('Contexto de update' + Trigger.isAfter + ' ' + Trigger.isUpdate);


    System.debug('----------');
    System.debug('Valores novos ' + Trigger.new);
    System.debug('Valores Anteriores ' + Trigger.oldMap);

}