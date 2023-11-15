/*
*********************************************************
Apex Class Name    : ContactTriggerHandler
Created Date       : Nov 7, 2023
@description       : This is class is used to set set Last Contact Update field on Account whenever a related Contact is updated
@author            : Dimitar Milev
*********************************************************
*/
public class ContactTriggerHandler { 
    
    public static void updateAccountLastContactUpdate(List<Contact> contactList) {

    // Create a set to store unique Account IDs that need to be updated
    Set<Id> accountIds = new Set<Id>();
         // Iterate through the updated Contact records
    for (Contact updatedContact : contactList) {
            // Add the Account ID of the modified Contact to the set
            accountIds.add(updatedContact.AccountId);
        }
    // Create Account List to Update
    List<Account> accountsToUpdate = [SELECT Id, Last_Contact_Update__c FROM Account WHERE Id IN :accountIds];

    // Update the datetime field on the related Accounts
    for (Account acc : accountsToUpdate) {
        // You can update the datetime field as per your requirements
        acc.Last_Contact_Update__c = System.now();
    }

    // Perform the bulk update of Account records
    update accountsToUpdate;
    }
}
