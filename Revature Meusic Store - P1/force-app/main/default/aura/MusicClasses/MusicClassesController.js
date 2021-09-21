({
	onInit : function(component, event, helper) {
        var noval="";
        helper.doInit(component,noval);
		
	},
    doSearch : function(component, event, helper) {
    var ShowOption = event.getParam("Option");
    //alert(ShowOption);
    component.set("v.OptionSel", ShowOption);
    helper.doInit(component,ShowOption);
   
		
	},
})