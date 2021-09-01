public with sharing class accountInstrumentDetailsController {
    
    public List<Music_Store_Accounts__c> accountsList {get; set;}
    
    public accountInstrumentDetailsController() {
		this.accountsList = [SELECT Name,Account_Opened_Date__c, Brass_Instrument__c, Percussion_Instruments__c, String_Instrument__c, Woodwind_Instruments__c FROM Music_Store_Accounts__c LIMIT 10];
    }
    
    public List<Music_Store_Accounts__c> getTempAccounts(){
        return this.accountsList;
    }
    
    public pageReference previousPage(){
        pageReference pg = new pageReference('/apex/AccountsOrdersDetails');
        pg.setRedirect(true);
        return pg;
    }
    
}