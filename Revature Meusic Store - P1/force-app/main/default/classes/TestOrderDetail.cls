@isTest
public class TestOrderDetail {
	
    @isTest static void TestOrderList(){
 		
		Music_Product_Order__c prodOrder = new Music_Product_Order__c();
        prodOrder.Order_Late_Date__c = Date.newInstance(2016, 9, 1);
        prodOrder.Order_Start_Date__c = Date.newInstance(2016, 8, 18);
        insert prodOrder;
        
        Test.startTest();	
        
        GetOrderList.getOrderList();             
        Test.StopTest();

    }
}