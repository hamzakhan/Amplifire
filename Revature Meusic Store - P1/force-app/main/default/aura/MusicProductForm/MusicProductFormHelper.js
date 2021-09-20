({
	createItem : function(component, newItem) {
		var action = component.get("c.saveItem");
        action.setParams({"item": newItem});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS"){
                
            }
        })
        $A.enqueueAction(action);
        component.set("v.newItem", { 'sobjectType': 'Music_Product__c',
                        'Name': '',
                  		'Description__c': '',
                		'Estimated_Quantity__c': 0,
                		'Image__c': '' });
	}
})