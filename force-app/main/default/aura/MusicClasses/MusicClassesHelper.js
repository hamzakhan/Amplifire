({
	doInit : function(component,value) {
		//alert(value);
        var action = component.get("c.getClasses");
		action.setParams({option : value });  
        //add the callback behavior for when the response is received
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log("state " + state);
            if(state === "SUCCESS"){
                var res = response.getReturnValue();
                component.set("v.classes", res);
               //alert(res);
            }
            else{
                console.log("Failed with state: " + state);
            }
        });

        //send action off to be executed
        $A.enqueueAction(action);
        
        
	}
})