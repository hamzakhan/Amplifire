public class ProjectZeroPartTwo {
    public ProjectZeroPartTwo(){
                
    }
    public static void ProductTriggerHandler(List<Music_Product__c> musicProdListArg){
        
       	//Query for all products where EstimatedQuantity = 0
        List<Music_Product__c> musicProdList = [SELECT Estimated_Quantity__c, Name FROM Music_Product__c WHERE Estimated_Quantity__C = 0];
        System.debug(musicProdListArg);
        System.debug(musicProdList);
        
        //Iterate through arguments to see if a product has zero quantity.
      	 
        for(Integer i =0; i<musicProdListArg.size(); i++){
            System.debug('Arg list = '+musicProdListArg);
            System.debug('Prod list = '+musicProdList);
            
            
                
            if(musicProdListArg[i].Estimated_Quantity__c !=0){
                System.debug('SantaBabyJesusGod! What in the frig do you think your doing?');
                musicProdListArg[i].addError('Stop! You are deleting an item that we still have in stock!');
                
            }
            else if(musicProdListArg[i].Name == musicProdList[i].Name){
                System.debug('This is safe to delete');
            }
			
            
        }
        
        }
    
    public static void AccountReggieTriggerHandler(List<Account> accountListArg){
        System.debug('Arg list = '+accountListArg);
        
        for(Integer i =0; i<AccountListArg.size();i++){
            System.debug('Arg list = '+accountListArg);
            if(accountListArg[i].name == 'The Reg'){
                System.debug('Do not add Reggie, he is bad for bussiness');
                accountListArg[i].addError('Do not add Reggie, he is bad for bussiness');
                
                
            }
            else if(accountListArg[i].name == 'Reggie'){
                System.debug('Do not add Reggie, he is bad for bussiness');
                accountListArg[i].addError('Do not add Reggie, he is bad for bussiness');
            }
        }
    }
    
    
    public static void ReturnStockUpdater(List<Music_Product_Return__c> ReturnProductListArg){
        System.debug('Return product list = '+ReturnProductListArg);
        
        List<id> idList = new List<id>(); 
        for(Music_Product_Return__c mpr :ReturnProductListArg){
            idList.add(mpr.id);
        }
        
        List<Music_Product_Return__c> MusicProductItemList = [SELECT Music_Product_Item__c, Music_Product_Item__r.Estimated_Quantity__c, Number_of_products_returned__c FROM Music_Product_Return__c WHERE id in : idList];
        for(Integer i=0; i<MusicProductItemList.size();i++){
            Music_Product__c mpc = new Music_Product__c(id=MusicProductItemList[i].Music_Product_Item__c, Estimated_Quantity__c = MusicProductItemList[i].Music_Product_Item__r.Estimated_Quantity__c);
            mpc.Estimated_Quantity__c += MusicProductItemList[i].Number_of_products_returned__c;
            update mpc;
            }            
		database.update(MusicProductItemList);        
        }        
    }