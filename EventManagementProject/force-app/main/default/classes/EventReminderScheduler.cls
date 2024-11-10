global class EventReminderScheduler implements Schedulable {
    global void execute(SchedulableContext sc) {
        // Query for registrations where the associated event is tomorrow
        List<Registration__c> registrations = [
            SELECT Email__c, EventID__r.Date__c, EventID__r.Name
            FROM Registration__c 
            WHERE EventID__r.Date__c = :Date.today().addDays(1)
        ];

        // Iterate through each registration to send reminder emails
        for (Registration__c reg : registrations) {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[]{reg.Email__c}); // Ensure you have the correct email field
            mail.setSubject('Reminder: Upcoming Event');
            mail.setPlainTextBody('Your event "' + reg.EventID__r.Name + '" is tomorrow.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
}