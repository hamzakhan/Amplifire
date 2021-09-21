public class notificationController {
@AuraEnabled

    public static List<Revature_Music_Class__c> getEvent() {    
	
         return [SELECT Name, Instruments__r.Name,Instructor__r.Name,Session__c,Level__c,Starting_Date__c,Students_Enrolled__c From Revature_Music_Class__c WHERE Starting_Date__c >:system.today() LIMIT 3];
        
   
}
}