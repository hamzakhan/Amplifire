public class PopularSearchResults {
@AuraEnabled
    public static List<Music_Product__c> getPopular() {
        
        return [SELECT Name,Image__c,Product_Image__c From Music_Product__c];
    }
    
}