@RestResource(urlMapping = '/api/Event__c/*')
global with sharing class EventRestService {
    @HTTPGet
    global static Event__c doGetEvt(){
        RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        String evtId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1); ///12345
        Event__c result = [Select Id, Name__c, Event_Location__r.Name, Event_Organizer__r.Name, Live__c, Start_Date_Time__c, End_Date_Time__c from Event__c where Id =: evtId];
        return result;
    }
}