public class CheckEventSpeakerEvent {
    public static void checkDuplicate(List<Event_Speaker__c> eventSpeaker){
    
        try{
            for(Event_Speaker__c eS : eventSpeaker){

                Event__c evtDate = [Select Start_Date_Time__c,End_Date_Time__c from Event__c where Id = :eS.Event__c];

                List<Event_Speaker__c> listES = [Select Id,Event__r.Start_Date_Time__c,Speaker__c from Event_Speaker__c where Speaker__c = :eS.Speaker__c 
                AND(
                    (Event__r.Start_Date_Time__c<:evtDate.End_Date_Time__c AND Event__r.End_Date_Time__c>:evtDate.End_Date_Time__c) 
                    OR (Event__r.Start_Date_Time__c=:evtDate.Start_Date_Time__c AND Event__r.End_Date_Time__c=:evtDate.End_Date_Time__c)
                    OR(Event__r.Start_Date_Time__c<:evtDate.Start_Date_Time__c AND Event__r.End_Date_Time__c>:evtDate.Start_Date_Time__c) 
                    OR(Event__r.Start_Date_Time__c > :evtDate.Start_Date_Time__c AND Event__r.End_Date_Time__c < :evtDate.End_Date_Time__c)
                    )]; 

                   for(Event_Speaker__c spkList : listES){
                    eS.Speaker__c.addError('The Speaker has an event with the same timeslot..');
                   }
                
            }
            
           }catch (Exception ex) {
				System.debug('Get Exception: '+ex.getMessage());
       		}

    }
}