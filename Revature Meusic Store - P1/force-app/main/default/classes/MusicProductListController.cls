public class MusicProductListController {
	
    @AuraEnabled
    public static List<Music_Product__c> getItems () {
        List<Music_Product__c> MP = [select id, name, estimated_quantity__c, description__c, image__c from Music_Product__c ];
        return MP;
    }
}