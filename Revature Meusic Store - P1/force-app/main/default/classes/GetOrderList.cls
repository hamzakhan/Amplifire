public class GetOrderList {
	@AuraEnabled
	public static List<Music_Product_Order__c> getOrderList(){
    	return [SELECT Name, Customer_First_Name__c, Customer_s_Last_Name__c, Number_of_Music_Products_1_ordered__c,Number_of_Music_Products_2_ordered__c,Number_of_Music_Products_3_ordered__c FROM Music_Product_Order__c];  
    	 
    }
}