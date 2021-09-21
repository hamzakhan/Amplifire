({
	onClassSelected : function(component, event, helper) {
        var classselected = event.getParam('classes');
        //alert(classselected.Id);
        component.set("v.id",classselected.Id);
        component.set("v.classes",classselected);
        
      
    },
    onRecordUpdated:function(component, event, helper) {
       var reviewsCmp = component.find("ClassReviewsComp");
        	if(reviewsCmp) {
            reviewsCmp.refresh();
            }},
     
     
})