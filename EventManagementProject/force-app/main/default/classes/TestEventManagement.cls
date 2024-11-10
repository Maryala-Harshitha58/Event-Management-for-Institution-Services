@isTest
private class TestEventManagement {
    
    static testMethod void testCapacityCheck() {
        // Step 1: Create an Event with required fields populated
        Event__c event = new Event__c(
            Name = 'Workshop',
            Capacity__c = 2,
            Date__c = Date.today(),              // Add the required Date field
            Location__c = 'Main Hall',           // Add the required Location field
            Description__c = 'A workshop event'  // Add the required Description field
        );
        insert event;
        System.debug('Event inserted: ' + event.Id);
        
        // Step 2: Create two registrations that will fill the event
        Registration__c reg1 = new Registration__c(
            EventID__c = event.Id, 
            Attendee_Name__c = 'John', 
            Email__c = 'john@example.com',
            Registration_Status__c = 'Confirmed', // Add the required Registration_Status field
            Master__c = event.Id                  // Add the required Master field
        );
        Registration__c reg2 = new Registration__c(
            EventID__c = event.Id, 
            Attendee_Name__c = 'Jane', 
            Email__c = 'jane@example.com',
            Registration_Status__c = 'Confirmed', // Add the required Registration_Status field
            Master__c = event.Id                  // Add the required Master field
        );
        insert new List<Registration__c>{reg1, reg2};
        System.debug('Registrations inserted: ' + reg1.Id + ', ' + reg2.Id);
        
        // Step 3: Try to insert a third registration that should fail due to capacity limit
        Registration__c reg3 = new Registration__c(
            EventID__c = event.Id, 
            Attendee_Name__c = 'Doe', 
            Email__c = 'doe@example.com',
            Registration_Status__c = 'Confirmed', // Add the required Registration_Status field
            Master__c = event.Id                  // Add the required Master field
        );
        
        Test.startTest();
        try {
            insert reg3; // This should throw an error due to capacity check in the trigger
        } catch (DmlException e) {
            System.debug('Error encountered: ' + e.getMessage());
            // Step 4: Verify that the exception message contains the capacity error
            System.assert(e.getMessage().contains('Event capacity has been reached'), 'Error message mismatch');
        }
        Test.stopTest();
    }
}