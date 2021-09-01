//controller for the main account detail page
public with sharing class accountInstrumentDetailsController {
    
    public List<Music_Store_Accounts__c> accountsList {get; set;}

    //primary controller method. Stores a query of Music_Store_Accounts__c information to the accountsList variable.
    public accountInstrumentDetailsController() {
		this.accountsList = [SELECT Name,Account_Opened_Date__c, Brass_Instrument__c, Percussion_Instruments__c, String_Instrument__c, Woodwind_Instruments__c FROM Music_Store_Accounts__c LIMIT 10];
    }

    //returns the account info to the account detail bf page
    public List<Music_Store_Accounts__c> getTempAccounts(){
        return this.accountsList;
    }
    
    //logic for the previous page button; takes you back to the accounts orders details page
    public pageReference previousPage(){
        pageReference pg = new pageReference('/apex/AccountsOrdersDetails');
        pg.setRedirect(true);
        return pg;
    }
    
}