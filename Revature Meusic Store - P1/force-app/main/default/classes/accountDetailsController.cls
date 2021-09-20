public class accountDetailsController {
  
    @AuraEnabled
    public static List<Music_Store_Accounts__c> getTempAccounts(){
        if(!schema.SObjectType.Account.isAccessible()){
            throw new AuraHandledException('You cannot access the Music_Store_Account__c object');
        }
        List<Music_Store_Accounts__c> tempAccounts = [SELECT Id, Name,Account_Opened_Date__c, Brass_Instrument__c, Percussion_Instruments__c, String_Instrument__c, Woodwind_Instruments__c FROM Music_Store_Accounts__c LIMIT 10];
        return tempAccounts;
    }
    
}