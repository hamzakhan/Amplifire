public class MusicClassesController {
@AuraEnabled
    public static List<Revature_Music_Class__c> getClasses(String option) {    
	if(option != '')  {  
         return [SELECT Name,Picture__c,Instruments__r.Name,Instructor__r.Name,Session__c,Level__c,Starting_Date__c,Students_Enrolled__c From Revature_Music_Class__c WHERE Level__c=: option];
        
    }
        else{
          
         return [SELECT Name,Picture__c,Instruments__r.Name,Instructor__r.Name,Session__c,Level__c,Starting_Date__c,Students_Enrolled__c From Revature_Music_Class__c];  
            
        }
}
}