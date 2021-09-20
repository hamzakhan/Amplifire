public class MusicProductItemController {
	@AuraEnabled
    public static integer getTotalOrders(Music_Product__c currentProduct){
        integer totalOrders = [SELECT COUNT() FROM Music_Product_Order__c WHERE Music_Product_Purchased_1__c=:currentProduct.id OR Music_Product_Purchased_2__c=:currentProduct.id OR Music_Product_Purchased_3__c=:currentProduct.id];
        return totalOrders;

    }
}