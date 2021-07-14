@isTest
public class UpdateEventBatch_Test {

    public static testMethod void testUpdateBatch(){

        List<Event__c> listEvent = new List<Event__c>();
        for(Integer i=0; i<=100; i++){
            Event__c event = new Event__c(
                Name__c = 'Test Event #'+i+1,
                Max_Seat__c  = 69,
                Live__c = false,
                Status__c = 'Created',
                Start_Date_Time__c = datetime.newInstance(2020, 12, 24, 12, 0, 0),
                End_Date_Time__c  = datetime.newInstance(2020, 12, 25, 12, 0, 0)
            );
            listEvent.add(event);
        }
        insert listEvent;
        try{
            Test.startTest();

        Id batchId = Database.executeBatch(new UpdateEventBatch(), 120);
        
        Test.stopTest();
        }catch (Exception ex){

        }
        System.AssertEquals(
           database.countquery('SELECT COUNT()'
              +' From Event__c Where  Status__c = \'Deleted\''),
           101); 
        
    }
    
}