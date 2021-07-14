@RestResource(urlMapping = '/api/Event__c/*')

/* Callback URL: https://login.salesforce.com/services/oauth2/callback
///Post URL: https://openminds2--capsandbox.my.salesforce.com/services/oauth2/token?
    - grant_type
    - client_id
    - client_secret
    - username
    - password
///Get URL: https://openminds2--capsandbox.my.salesforce.com/services/apexrest/api/Event__c/*Event ID* */

global with sharing class EventRestService {
    @HTTPGet
    global static Event__c doGetEvt(){
        RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        String evtId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1); 
        Event__c result = [Select Id, Name__c, Event_Location__r.Name, Event_Organizer__r.Name, Live__c, Start_Date_Time__c, End_Date_Time__c from Event__c where Id =: evtId];
        return result;
    }
}
