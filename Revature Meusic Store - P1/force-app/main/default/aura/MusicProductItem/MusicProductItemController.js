({
	doInit  : function(component, event, helper) {
        var currentItem = component.get("v.item");
		var action = component.get("c.getTotalOrders");
        action.setParams({"currentProduct": currentItem});
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if (component.isValid() && state === "SUCCESS") {
           
               
                component.set("v.totalOrders", response.getReturnValue());
                 
            }
        });
        
        $A.enqueueAction(action);
	}
})