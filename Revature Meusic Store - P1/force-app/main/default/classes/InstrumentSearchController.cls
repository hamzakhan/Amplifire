public class InstrumentSearchController {
	@AuraEnabled
    public static List<Music_Product__c> getInstrument()
    {
        return [SELECT Id, Name from Music_Product__c ORDER BY Name];
    }
}