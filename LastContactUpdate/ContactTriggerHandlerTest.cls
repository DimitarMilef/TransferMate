@isTest
public class ContactTriggerHandlerTest {
    // Helper method to create a test Contact and Account
    public static void createTestContactAndAccount() {
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        Contact testContact = new Contact(
            LastName = 'Test Contact',
            AccountId = testAccount.Id
        );
        insert testContact;
    }

    @isTest
    static void testUpdateAccountLastContactUpdate() {
        // Create test data
        createTestContactAndAccount();

        // Query for the test Account record
        Account testAccount = [SELECT Id, Last_Contact_Update__c FROM Account LIMIT 1];
        Datetime originalLastContactUpdate = testAccount.Last_Contact_Update__c;

        // Update the Contact
        Contact testContact = [SELECT Id FROM Contact LIMIT 1];
        testContact.LastName = 'Updated Contact';
        update testContact;

        // Verify that the Last_Contact_Update__c field has been updated
        testAccount = [SELECT Last_Contact_Update__c FROM Account WHERE Id = :testAccount.Id LIMIT 1];
        System.assertNotEquals(originalLastContactUpdate, testAccount.Last_Contact_Update__c);
    }
}
