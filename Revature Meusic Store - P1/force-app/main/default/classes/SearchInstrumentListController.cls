public class SearchInstrumentListController {
    
    // Acts as a controller for our Aura component, server side 
    
	// @AuraEnabled tells SF that this method will be called from an Aura Component
    // Get the list of music product base on search value 
    // Method must be static to call it from an Aura component
    @AuraEnabled
    public static List<Music_Product__c> fetchInstruments(String searchKeyword) {
        List<Music_Product__c> returnList = new List<Music_Product__c>();
        
        // If search value is null then return all music products. Else search 
        String searchKey = String.isBlank(searchKeyword) ? '%%' : '$' + searchKeyword + '%';
        
        returnList = [SELECT Id,
                             Name,
                             Product_Type__c,
                             Estimated_Quantity__c,
                             Instrument_Sub_Type__c
                      FROM Music_Product__c
                      WHERE Name
                      LIKE :searchKey
                      LIMIT 3];
        
        // return list of products back to Aura component
        return returnList;
    }

}