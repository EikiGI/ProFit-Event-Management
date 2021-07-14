import { LightningElement, track, wire, api } from 'lwc';
import upcomingEvents from "@salesforce/apex/AttendeeEventsService.upcomingEvents";
import pastEvents from "@salesforce/apex/AttendeeEventsService.pastEvents";

export default class AttendeeDetails extends LightningElement {
    @api recordId;
    @track eventCol = [
        {
            label: 'Name',
            fieldName: 'Name',
            type: 'text',
            sortable: true
        },
        {
            label: 'Location',
            fieldName: 'Location',
            type: 'text',
            sortable: true
        },
        {
            label: 'Start Date',
            fieldName: 'Start_Date_Time__c',
            type: 'date',
            typeAttributes: {
                weekday: 'long',
                day: 'numeric',
                month: 'short',
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                hour12: true
              }
        },
        {
            label: 'End Date',
            fieldName: 'End_Date_Time__c',
            type: 'date',
            typeAttributes: {
                weekday: 'long',
                day: 'numeric',
                month: 'short',
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                hour12: true
              }
        }        
    ];

    @track error;
    @track upcomingEventsList;
    @wire(upcomingEvents, {attendeeId : '$recordId'})
    wiredUpcomingEvents({error,data}){
        var returnOptions =[];
      if(data){
        data.forEach(ele => {

            var loc;
                if(ele.Event__r.Event_Location__c){
                    loc = ele.Event__r.Event_Location__r.Name;
                }else{
                    loc = 'This is Virtual';
                }

            returnOptions.push({Name:ele.Event__r.Name__c,
                Start_Date_Time__c:ele.Event__r.Start_Date_Time__c,
                Location:loc,
                End_Date_Time__c:ele.Event__r.End_Date_Time__c
            }); 
            
            })
          
        this.upcomingEventsList = returnOptions;
        }
      else{ console.log(error);}
    }

    @track pastEventsList;
    @wire(pastEvents, {attendeeId : '$recordId'})
    wiredPastEvents({error,data}){
        var returnOptions =[];
      if(data){
        data.forEach(ele => {

            var loc;
                if(ele.Event__r.Event_Location__c){
                    loc = ele.Event__r.Event_Location__r.Name;
                }else{
                    loc = 'This is Virtual';
                }

            returnOptions.push({Name:ele.Event__r.Name__c,
                Start_Date_Time__c:ele.Event__r.Start_Date_Time__c,
                Location:loc,
                End_Date_Time__c:ele.Event__r.End_Date_Time__c
            }); 
            
            })
          
        this.pastEventsList = returnOptions;
        }
      else{ console.log(error);}
    }

}