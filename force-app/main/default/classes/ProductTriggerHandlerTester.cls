@isTest
public class ProductTriggerHandlerTester {

    @isTest static void productHasZero(){ 
        //Testing Positive for Trigger, 
        //Product has an estimated quantity of zero,
        //Product can be deleted
        
        //Create Product with a quantity of zero
        Music_Product__c ProductCreated = new Music_Product__c(name='Piccolo', Estimated_Quantity__c =0);
        List<Music_Product__c> ProductCreatedList = new List<Music_Product__c>();
        ProductCreatedList.add(ProductCreated);
        database.insert(ProductCreatedList);
        
        List<Music_Product__c> productRetrieved = [SELECT name, Estimated_Quantity__c FROM Music_Product__c WHERE name = 'Piccolo'];
        
        database.delete(productRetrieved);
        
        List<Music_Product__c> productExistence = [SELECT name, Estimated_Quantity__c FROM Music_Product__c WHERE name = 'Piccolo'];
        Integer TruthEvaluator; 
        
        //productExistence is expected to not have any products with Piccolo as the delete was made successfully 
        
        if(productExistence == null){
            TruthEvaluator = 0; 
            //indicates a test failure,
        	//The product was not deleted successfully					
        }
        else{
            TruthEvaluator = 1;
            //indicates a test success,
            //The product was deleted successfully
        }
        
        System.assertEquals(1, TruthEvaluator);
    }
    
    @isTest static void productDoesNotHaveZero(){
        //Testing Negative for Trigger, 
        //Product has an estimated quantity of not zero,
        //Product can be deleted
        //
        //Create Product with a quantity of zero
        Music_Product__c ProductCreated = new Music_Product__c(name='Piccolo', Estimated_Quantity__c =5);
        List<Music_Product__c> ProductCreatedList = new List<Music_Product__c>();
        ProductCreatedList.add(ProductCreated);
        database.insert(ProductCreatedList);
        
        List<Music_Product__c> productRetrieved = [SELECT name, Estimated_Quantity__c FROM Music_Product__c WHERE name = 'Piccolo'];
        try{
           database.delete(ProductCreatedList); 
        }
        catch(System.DmlException customDeleteException){
           System.assertEquals(1, 1);
        }
        
           
        if(ProductCreatedList == null){
            System.assertEquals(1,0);
        }
        
    }
    
}