/*
*********************************************************
Apex Class Name    : ContactHelper
Created Date       : Nov 7, 2023
@description       : This is class is used to get Contact fields for ContactList LWC
@author            : Dimitar Milev
*********************************************************
*/
public with sharing class ContactHelper {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [SELECT Id, FirstName, LastName ,Email
            FROM Contact];
    }
}
