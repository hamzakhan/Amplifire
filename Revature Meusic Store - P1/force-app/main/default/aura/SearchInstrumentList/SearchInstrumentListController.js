({
    // Defines the behavior of our application
    // Method to be called on component intialization
	doInit : function(component, event, helper) {
        // Method is from the helper file 
        helper.fetchInstrumentHelper(null, component);
	},
    // Method to perform search on Music_Product__c
    searchMusicProduct: function(component, event, helper) {
        // Get the value the user entered in the input box by selecting the id searchField
        var searchValue = component.find("searchField").get("v.value");
        // Pass value user entered into the helper method which will get a list of update instruments
        helper.fetchInstrumentHelper(searchValue, component);
    }    
})