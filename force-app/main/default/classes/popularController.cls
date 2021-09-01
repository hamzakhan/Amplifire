public with sharing class popularController {

    public List<Music_Store_Accounts__c> accountsList {get; set;}
    public List<Music_Product_Order__c> ordersList {get; set;}
    
    public popularController() {
		this.accountsList = [SELECT Name,Account_Opened_Date__c FROM Music_Store_Accounts__c LIMIT 3];
        this.ordersList = [SELECT Customer_s_Last_Name__c, Name FROM Music_Product_Order__c LIMIT 3];
    }
    
    public List<Music_Store_Accounts__c> getTempAccounts(){
        return this.accountsList;
    }
    
    public List<Music_Product_Order__c> getTempOrders(){
        return this.ordersList;
    }
    
    public pageReference accountsPage(){
        pageReference pg = new pageReference('/apex/AccountDetails');
        pg.setRedirect(true);
        return pg;
    }
    
    public pageReference ordersPage(){
        pageReference pg = new pageReference('/apex/OrderDetails');
        pg.setRedirect(true);
        return pg;
    }
}