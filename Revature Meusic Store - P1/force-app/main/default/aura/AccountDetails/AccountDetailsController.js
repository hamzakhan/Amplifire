({
	doInit : function(component, event, helper) {
        
		let getAccounts = component.get("c.getTempAccounts");
        
        
        
        
        getAccounts.setCallback(this, function(response){
            if(response.getState()==="SUCCESS"){
            	component.set("v.TempAccounts",response.getReturnValue());
        	}
        });
        $A.enqueueAction(getAccounts);
	}
})