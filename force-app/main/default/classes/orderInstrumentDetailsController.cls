public with sharing class orderInstrumentDetailsController {
    
    public List<Music_Product_Order__c> ordersList {get; set;}
    public List<Music_Product__c> productList {get; set;}
    
    public orderInstrumentDetailsController() {
		this.ordersList = [SELECT Name, Customer_First_Name__c, Customer_s_Last_Name__c, Number_of_Music_Products_1_ordered__c,Number_of_Music_Products_2_ordered__c,Number_of_Music_Products_3_ordered__c FROM Music_Product_Order__c LIMIT 10];
    }
    
    public List<Music_Product_Order__c> getTempOrders(){
        return this.ordersList;
    }
    
    public pageReference previousPage(){
        pageReference pg = new pageReference('/apex/AccountsOrdersDetails');
        pg.setRedirect(true);
        return pg;
    }
    
}