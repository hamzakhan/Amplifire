({
handleChange: function (cmp, event) {
       
        var selectedOptionValue = event.getParam("value");
    	cmp.set("v.sOption", selectedOptionValue);
    	
    },
    
    newClick : function (cmp, event, helper) {
        var option = cmp.get("v.sOption");
        var requestNewClass = cmp.getEvent("launchNewClassForm");
        requestNewClass.setParams({"formData": option});
        requestNewClass.fire();
    },
    searchClick : function (cmp, event, helper) {
        var option = cmp.get("v.sOption");
        //alert(option);
        var evt = $A.get("e.c:getOption");
        evt.setParams({"Option": option});
        evt.fire();
    },
    
    handleNewClassForm: function(component, event, helper){
		//calling launch new boat form
        var option = component.get("v.sOption");
        var createNewClass = $A.get("e.force:createRecord");     
            createNewClass.setParams({
                "entityApiName": "Revature_Music_Class__c",
       		 })
        if(! option==""){
            createNewClass.setParams({
                "defaultFieldValues": {'Level__c': option}
           })
        }
        createNewClass.fire();
},
})