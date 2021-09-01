//couldn't figure out how to change controller name; it's the controller for the accounts details summary page
public with sharing class popularController {

    public List<Music_Store_Accounts__c> accountsList {get; set;}
    public List<Music_Product_Order__c> ordersList {get; set;}
    
    //controller method that stores the info about the accounts and orders to lists with a limit of 3 
    public popularController() {
		this.accountsList = [SELECT Name,Account_Opened_Date__c FROM Music_Store_Accounts__c LIMIT 3];
        this.ordersList = [SELECT Customer_s_Last_Name__c, Name FROM Music_Product_Order__c LIMIT 3];
    }
    //returns the account info to the vf page
    public List<Music_Store_Accounts__c> getTempAccounts(){
        return this.accountsList;
    }
    //returns the account info to the vf page
    public List<Music_Product_Order__c> getTempOrders(){
        return this.ordersList;
    }
    //logic for button to open the accounts details vf page
    public pageReference accountsPage(){
        pageReference pg = new pageReference('/apex/AccountDetails');
        pg.setRedirect(true);
        return pg;
    }
    //logic for button to open the orders details vf page
    public pageReference ordersPage(){
        pageReference pg = new pageReference('/apex/OrderDetails');
        pg.setRedirect(true);
        return pg;
    }
}