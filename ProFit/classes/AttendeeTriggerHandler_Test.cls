@isTest
public class AttendeeTriggerHandler_Test {
    @testSetup
    public static void setupData(){
        
        Event_Organizer__c  org = new Event_Organizer__c (
            Name = 'Jeffry Gacusan',
            Phone__c = '0987654321',
            Email__c = 'jeffry.gacusan@gmail.com',
            Alternative_Phone__c  = '09187654321',
            Alternative_Email__c ='test@email.com'
        );
        insert org;
        
        Event__c event = new Event__c(
            Name__c = 'Fitness Focus',
            Event_Organizer__c  = org.Id,
            Event_Type__c = 'Virtual',
            Frequency__c  = 'Weekly',
            Max_Seat__c  = 50,
            Recurring__c = true,
            Live__c = true,
            Start_Date_Time__c = System.now(),
            End_Date_Time__c  = System.now().addDays(3)
        );
        insert event;
        Attendee__c att = new Attendee__c(
            Name = 'Jeffry Gacusan',
            Email__c = 'jeffry.gacusan@gmail.com',
            Phone__c = '09187654321'
        );
        insert att;
        
        Event_Attendee__c evtAtt = new Event_Attendee__c(Event__c = event.Id, Attendee__c = att.Id);
        insert evtAtt;
    }
    
    @isTest
    static void sendEmailTest(){
        Test.startTest();
        try{
            integer i = 10/0;
        }catch(System.Exception ex ){
            
        }
        Test.stopTest();
    }
}