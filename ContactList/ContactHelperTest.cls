@isTest
public class ContactHelperTest {

    @isTest
    static void testGetContactList() {
        // Create test data
        Contact testContact = new Contact(FirstName = 'Dimitar', LastName = 'Milev', Email = 'dmilev@test.com');
        insert testContact;

        // Call the method to be tested
        List<Contact> contacts = ContactHelper.getContactList();

        // Verify that the method returns the expected results
        System.assertEquals(1, contacts.size(), 'Number of contacts in the list should be 1.');
        System.assertEquals('Dimitar', contacts[0].FirstName, 'First name should match.');
        System.assertEquals('Milev', contacts[0].LastName, 'Last name should match');
        System.assertEquals('dmilev@test.com', contacts[0].Email, 'Email should match.');
    }
}
