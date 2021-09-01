//controller for the main order detail page
public with sharing class orderInstrumentDetailsController {
    
    public List<Music_Product_Order__c> ordersList {get; set;}
    public List<Music_Product__c> productList {get; set;}
    
    //controller method that stores the info about the orders to a list with a limit of 10 
    public orderInstrumentDetailsController() {
		this.ordersList = [SELECT Name, Customer_First_Name__c, Customer_s_Last_Name__c, Number_of_Music_Products_1_ordered__c,Number_of_Music_Products_2_ordered__c,Number_of_Music_Products_3_ordered__c FROM Music_Product_Order__c LIMIT 10];
    }

    //returns the account info to the vf page
    public List<Music_Product_Order__c> getTempOrders(){
        return this.ordersList;
    }
    
    public pageReference previousPage(){
        pageReference pg = new pageReference('/apex/AccountsOrdersDetails');
        pg.setRedirect(true);
        return pg;
    }
    
}