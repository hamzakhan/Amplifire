@isTest
public class MusicProductFormControllerTest {
	
    @isTest
    public static void testSaveItem(){
        Test.startTest();
        
        string instrumentName = 'TestInstrument';
        Music_Product__c myInstrument = new Music_Product__c();
        myInstrument.name = instrumentName;
        myInstrument.Estimated_Quantity__c = 15;
        
        MusicProductFormController.saveItem(myInstrument);
        
        Music_Product__c testProd = [SELECT id, Estimated_Quantity__c FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        System.assertEquals(testProd.Estimated_Quantity__c, 15);
        
        Test.stopTest();
    }
}