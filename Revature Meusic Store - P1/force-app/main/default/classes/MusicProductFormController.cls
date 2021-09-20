public class MusicProductFormController {
	@AuraEnabled
    public static Music_Product__c saveItem (Music_Product__c item){
        insert item;
        return item;
    }
}