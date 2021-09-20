@isTest
public class MusicProductItemControllerTest {
	static string instrumentName = 'Saxophone';
    static string instrumentDescription = 'This is a test description';
    static integer numberOfOrders = 30;
    static integer totalSupply = 10;
    static Id testID;
    
    @TestSetup
    static void makeData(){
        
        //Creates instruments for use in the database
        Music_Product__c myInstrument = new Music_Product__c();
        myInstrument.name = instrumentName;
        Music_Product__c unusedInstrument = new Music_Product__c();
        unusedInstrument.name = 'Trumpet';
        myInstrument.Estimated_Quantity__c = totalSupply;
        unusedInstrument.Estimated_Quantity__c = 20;
        myInstrument.Description__c = instrumentDescription;

        INSERT myInstrument;
        INSERT unusedInstrument;

        //Creates a list of orders to be used for listing
        List<Music_Product_Order__c> sampleOrders = new List<Music_Product_Order__c>();

        //Creates sample orders with the related instrument
        for(integer i = 0; i < numberOfOrders; i++){
            Music_Product_Order__c newOrder = new Music_Product_Order__c();
            newOrder.Music_Product_Purchased_2__c = myInstrument.id;
            newOrder.Music_Product_Purchased_1__c = unusedInstrument.id;
            newOrder.Order_Start_Date__c = system.today();
            newOrder.Order_Late_Date__c = system.today().addDays(10);
            sampleOrders.add(newOrder);
        }

        INSERT sampleOrders;

    }
    
    @isTest
    public static void testGetTotalOrders(){
        Test.startTest();
        
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        integer count = MusicProductItemController.getTotalOrders(testProd);
        
        System.assertEquals(count, 30);
        
        Test.stopTest();
    }
}