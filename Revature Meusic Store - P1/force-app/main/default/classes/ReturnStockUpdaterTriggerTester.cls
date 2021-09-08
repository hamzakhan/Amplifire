@isTest
public class ReturnStockUpdaterTriggerTester {

    @isTest static void quantityisAdded(){
        //Testing Positive for Trigger,
        //Quantity from return record being created, 
        //is added to corresponding music product         
        
        //Need to create the account  
        Account NewGuyCharlie = new Account(name='James Lahey');
        database.insert(NewGuyCharlie);
        
        //Need to create the music product record
        Music_Product__c OriginalMusicProduct = new Music_Product__c(Name='Guitar', Estimated_Quantity__c = 10, Product_Type__c = 'Strings');
        database.insert(OriginalMusicProduct);
        
        //Query for Account
        List<Account> AccountIdList = [SELECT id, Name FROM Account WHERE Name = 'James Lahey'];
        System.debug(AccountIdList[0]);
        
        //Query for Music Product 
        List<Music_Product__c> OriginalMusicProductList = [SELECT id, name, Estimated_Quantity__c FROM Music_Product__c WHERE name ='Guitar' and Estimated_Quantity__c = 10];
        System.debug(OriginalMusicProductList[0]);
        
        //Make Return record
        Music_Product_Return__c CreatedReturn = new Music_Product_Return__c(Account__c=NewGuyCharlie.id, Number_of_products_returned__c=4, Name = 'Guitar', MUSIC_Product_Item__c = OriginalMusicProductList[0].id);
        // Insert Return into database which should cause trigger to fire
        database.insert(CreatedReturn);

        List<Music_Product__c> PostAdditionalMusicProductList = [SELECT id, name, Estimated_Quantity__C FROM Music_Product__c WHERE name ='Guitar' and Estimated_Quantity__c =14];
        Decimal ExpectedQuantity = OriginalMusicProductList[0].Estimated_Quantity__C + 4;
        
        System.assertEquals(ExpectedQuantity, PostAdditionalMusicProductList[0].Estimated_Quantity__c);
    }
    
    
        //Testing Negative for Trigger,
        //Has proven to be impossible. 
        //Number of products being returned is a required number field.
        //Record can not be created without it 
        
    
    @isTest static void quantityAddedisOne(){
        
       //Testing Single for Trigger,
       //Quantity from return record being created, 
       //is equal to one.
       //The amount is added to the corresponding music product.
       
       //Need to create the account  
       Account NewGuyCharlie = new Account(name='James Lahey');
       database.insert(NewGuyCharlie);
        
       //Need to create the music product record
       Music_Product__c OriginalMusicProduct = new Music_Product__c(Name='Guitar', Estimated_Quantity__c = 10, Product_Type__c = 'Strings');
       database.insert(OriginalMusicProduct);
        
       //Query for Account
       List<Account> AccountIdList = [SELECT id, Name FROM Account WHERE Name = 'James Lahey'];
       System.debug(AccountIdList[0]);
        
       //Query for Music Product 
       List<Music_Product__c> OriginalMusicProductList = [SELECT id, name, Estimated_Quantity__c FROM Music_Product__c WHERE name ='Guitar' and Estimated_Quantity__c = 10];
       System.debug(OriginalMusicProductList[0]);
        
       //Make Return record
       Music_Product_Return__c CreatedReturn = new Music_Product_Return__c(Account__c=NewGuyCharlie.id, Number_of_products_returned__c=1, Name = 'Guitar', MUSIC_Product_Item__c = OriginalMusicProductList[0].id);
       // Insert Return into database which should cause trigger to fire
       database.insert(CreatedReturn);
        //Query for Return record
       List<Music_Product_Return__c> ReturnsList = [SELECT name, Number_of_products_returned__c FROM Music_Product_Return__c ];
        
       List<Music_Product__c> PostAdditionalMusicProductList = [SELECT id, name, Estimated_Quantity__C FROM Music_Product__c WHERE name ='Guitar' and Estimated_Quantity__c =11];
       System.assertEquals(OriginalMusicProductList[0].Estimated_Quantity__C + ReturnsList[0].Number_of_products_returned__c , PostAdditionalMusicProductList[0].Estimated_Quantity__c);
  
    }
    
    @isTest static void quantityAddedisMoreThanOne(){
        
        //Testing Bulk for Trigger,
        //Quantity from return record being created,
        //is greater than one.
        //The amount is added to the corresponding music product. 
        //Need to create the account  
       Account NewGuyCharlie = new Account(name='James Lahey');
       database.insert(NewGuyCharlie);
        
       //Need to create the music product record
       Music_Product__c OriginalMusicProduct = new Music_Product__c(Name='Guitar', Estimated_Quantity__c = 10, Product_Type__c = 'Strings');
       database.insert(OriginalMusicProduct);
        
       //Query for Account
       List<Account> AccountIdList = [SELECT id, Name FROM Account WHERE Name = 'James Lahey'];
       System.debug(AccountIdList[0]);
        
       //Query for Music Product 
       List<Music_Product__c> OriginalMusicProductList = [SELECT id, name, Estimated_Quantity__c FROM Music_Product__c WHERE name ='Guitar' and Estimated_Quantity__c = 10];
       System.debug(OriginalMusicProductList[0]);
        
       //Make Return record
       Music_Product_Return__c CreatedReturn = new Music_Product_Return__c(Account__c=NewGuyCharlie.id, Number_of_products_returned__c=101, Name = 'Guitar', MUSIC_Product_Item__c = OriginalMusicProductList[0].id);
       // Insert Return into database which should cause trigger to fire
       database.insert(CreatedReturn);
        //Query for Return record
       List<Music_Product_Return__c> ReturnsList = [SELECT name, Number_of_products_returned__c FROM Music_Product_Return__c ];
        
       List<Music_Product__c> PostAdditionalMusicProductList = [SELECT id, name, Estimated_Quantity__C FROM Music_Product__c WHERE name ='Guitar' and Estimated_Quantity__c =111];
       System.assertEquals(OriginalMusicProductList[0].Estimated_Quantity__C + ReturnsList[0].Number_of_products_returned__c , PostAdditionalMusicProductList[0].Estimated_Quantity__c);
    }
    
    @isTest static void quantityAddedisZero(){
        
        //Testing Zero for Trigger,
        //Quantity from return record being created,
        //is equal to zero. 
        //The amount is added to the corresponding music product. 
        //i.e the amount remains the same. 
        //
        //Need to create the account  
       Account NewGuyCharlie = new Account(name='James Lahey');
       database.insert(NewGuyCharlie);
        
       //Need to create the music product record
       Music_Product__c OriginalMusicProduct = new Music_Product__c(Name='Guitar', Estimated_Quantity__c = 10, Product_Type__c = 'Strings');
       database.insert(OriginalMusicProduct);
        
       //Query for Account
       List<Account> AccountIdList = [SELECT id, Name FROM Account WHERE Name = 'James Lahey'];
       System.debug(AccountIdList[0]);
        
       //Query for Music Product 
       List<Music_Product__c> OriginalMusicProductList = [SELECT id, name, Estimated_Quantity__c FROM Music_Product__c WHERE name ='Guitar' and Estimated_Quantity__c = 10];
       System.debug(OriginalMusicProductList[0]);
        
       //Make Return record
       Music_Product_Return__c CreatedReturn = new Music_Product_Return__c(Account__c=NewGuyCharlie.id, Number_of_products_returned__c=0, Name = 'Guitar', MUSIC_Product_Item__c = OriginalMusicProductList[0].id);
       // Insert Return into database which should cause trigger to fire
       database.insert(CreatedReturn);
        //Query for Return record
       List<Music_Product_Return__c> ReturnsList = [SELECT name, Number_of_products_returned__c FROM Music_Product_Return__c ];
        
       List<Music_Product__c> PostAdditionalMusicProductList = [SELECT id, name, Estimated_Quantity__C FROM Music_Product__c WHERE name ='Guitar' and Estimated_Quantity__c =10];
       System.assertEquals(OriginalMusicProductList[0].Estimated_Quantity__C + ReturnsList[0].Number_of_products_returned__c , PostAdditionalMusicProductList[0].Estimated_Quantity__c);
    }
}