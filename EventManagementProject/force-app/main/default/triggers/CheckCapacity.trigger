trigger CheckCapacity on Registration__c (before insert) {
    // Set to hold event IDs related to new registrations
    Set<Id> eventIds = new Set<Id>();
    
    // Collect the event IDs from the new registrations
    for (Registration__c reg : Trigger.new) {
        eventIds.add(reg.EventID__c); // Ensure the correct field name is used
        System.debug('Event ID: ' + reg.EventID__c);
    }

    // Query the events and their associated registrations
    List<Event__c> eventList = [SELECT Id, Capacity__c, 
                                (SELECT Id FROM Registrations__r) 
                                FROM Event__c WHERE Id IN :eventIds];

    // Check capacity for each event
    for (Event__c event : eventList) {
        Integer registeredCount = event.Registrations__r.size(); // Count current registrations
        // Calculate the total registrations including the new ones
        Integer totalCount = registeredCount + Trigger.new.size();
        
        if (totalCount > event.Capacity__c) {
            for (Registration__c reg : Trigger.new) {
                if (reg.EventID__c == event.Id) { // Ensure the correct field name is used
                    reg.addError('Event capacity has been reached. You cannot register.');
                }
            }
        }
    }
}