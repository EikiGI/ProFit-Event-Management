trigger DuplicateEventSpeakerTrigger on Event_Speaker__c (before insert, before update) {
	CheckEventSpeakerEvent.checkDuplicate(Trigger.new);
}