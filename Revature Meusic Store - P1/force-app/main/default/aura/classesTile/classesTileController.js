({

    onClassClick : function(component, event, helper) {
        var cmpEvent = $A.get('e.c:ClassSelect');
        var classId = event.getSource().get("v.name");
        cmpEvent.setParams({
            "classId" : classId
        });
        cmpEvent.fire();
		
        var ClassSelectedEvt = $A.get('e.c:ClassSelected');
        var musicClass = component.get("v.classes");
        //alert( musicClass);
       ClassSelectedEvt.setParams({"classes" : musicClass});     
       ClassSelectedEvt.fire();
 
    }

})