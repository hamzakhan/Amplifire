@isTest
public class instrumentControllerTests{

    string instrumentName = 'Saxophone';
    string instrumentDescription = 'This is a test description';
    integer numberOfOrders = 30;

    @TestSetup
    static void makeData(){
        
        integer numberOfOrders = 30;
        string instrumentName = 'Saxophone';

        Music_Product__c myInstrument = new Music_Product__c();
        myInstrument.name = instrumentName;
        Music_Product__c unusedInstrument = new Music_Product__c();
        myInstrument.name = 'Trumpet';

        INSERT myInstrument;

        List<Music_Product_Order__c> sampleOrders = new List<Music_Product_Order__c>();

        //Creates sample orders

        for(integer i = 0; i < numberOfOrders; i++){
            Music_Product_Order__c newOrder = new Music_Product_Order__c();
            newOrder.Music_Product_Purchased_2__c = myInstrument.id;
            newOrder.Music_Product_Purchased_1__c = unusedInstrument.id;
            sampleOrders.add(newOrder);
        }

        INSERT sampleOrders;

    }

    @isTest
    public static void instrumentController_getName(){

        string instrumentName = 'Saxophone';
        //Need to figure out how to pass in the instrument id here

        string returnedName = instrumentController.getName();
        system.assertEquals(instrumentName,  returnedName);

    }

    @isTest
    public static void instrumentController_getDescription(){

        string instrumentDescription = 'This is a test description';

        //Need to figure out how to pass in the instrument id here
        string retunedDescription = instrumentController.getName();
        system.assertEquals(instrumentDescription,  retunedDescription);

    }

    @isTest
    public static void instrumentController_getNumberOfOrders(){

        string instrumentName = 'Saxophone';
        integer numberOfOrders = 30;

        integer returnedNumOrders = [SELECT COUNT() FROM Music_Product_Order__c WHERE Music_Product_Purchased_1__c = :instrumentName OR Music_Product_Purchased_2__c = :instrumentName OR Music_Product_Purchased_3__c = :instrumentName];
        system.assertEquals(numberOfOrders, returnedNumOrders);
    }


}