({
    // Helper method to fetch instruments information from controller
	fetchInstrumentHelper: function(searchVal, component) {
        // Set columns you want to display in the table 
        component.set("v.columnsToDisplay", [
            { label: "Instrument Name", fieldName: "Name", type: "text" },
            { label: "Product Type", fieldName: "Product_Type__c", type: "text" },
            { label: "Quantity", fieldName: "Estimated_Quantity__c", type: "number" },
            { label: "Instrument Type", fieldName: "Instrument_Sub_Type__c", type: "text" }
        ]);
        
        // Create the action, component calls method from Apex controller. Forming the client to server communication
        var action = component.get("c.fetchInstruments");
        action.setParams({
            "searchKeyword": searchVal
        });
            
        // Calling server side method, tells our component what to when the results are returned 
        action.setCallback(this, function(response) {
            var state = response.getState();
            // Check whether call method was successful or not
            if (state === "SUCCESS") {
            	// set values to our attribute
            	component.set("v.musicInstruments", response.getReturnValue());
            } else {
            	alert("An error occurred while fetching the data");
            }
        });
        // This tells our Aura framework to put this action inside the queue. Perform the server side call out     
        $A.enqueueAction(action);
	}
})