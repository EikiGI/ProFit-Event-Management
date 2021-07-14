@isTest
public with sharing class ZipVerifier_Test {
    public static testMethod void testZip(){

        Event_Location__c loc = new Event_Location__c(
            Name = '3301 South Greenfield Rd',
            Street__c = '3301 South Greenfield Rd',
            City__c = 'Gilbert',
            State__c = 'AZ',
            Postal_Code__c = '85297',
            Country__c = 'United States'
        );
        insert loc;



        try{
            Test.setMock(HttpCalloutMock.class, new ZipCalloutMock());
            Test.startTest();

            ZipVerifier.zipCodeCallOut(''+loc.Id+'');
            
            Test.stopTest();
        }catch(Exception ex){

        }
        Event_Location__c retrievedZipVerified = [Select Is_Zip_correct__c from Event_Location__c where Id =: loc.Id];
        System.assertEquals(true,retrievedZipVerified.Is_Zip_correct__c);

    }
    public static testMethod void testLoc(){
        Event_Location__c loc = new Event_Location__c(
            Name = '3301 South Greenfield Rd',
            Street__c = '3301 South Greenfield Rd',
            City__c = 'Gilbert',
            State__c = 'AZ',
            Postal_Code__c = '85297',
            Country__c = 'United States'
        );
        insert loc;

        try{
            Test.setMock(HttpCalloutMock.class, new LocationMockCallout());
            Test.startTest();

            ZipVerifier.locationCall(''+loc.Id+'');
            
            Test.stopTest();
        }catch(Exception ex){

        }
        Event_Location__c retrievedLocVerified = [Select Verified__c from Event_Location__c where Id =: loc.Id];
        System.assertEquals(true,retrievedLocVerified.Verified__c);
    }

}