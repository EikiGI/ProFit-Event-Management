trigger EventAttendeeTrigger on Event_Attendee__c  (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        AttendeeTriggerHandler.sendConfirmationEmail(Trigger.New);
    }
}