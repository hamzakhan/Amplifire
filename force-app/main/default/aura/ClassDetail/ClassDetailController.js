({

     onFullDetails: function(component, event, helper) {

        var navEvt = $A.get("e.force:navigateToSObject");

        navEvt.setParams({

            "recordId": component.get("v.classes.Id")

        });

        navEvt.fire();

    },
 
    handleSubmit : function(cmp, event, helper) {
        event.preventDefault();       // stop the form from submitting
        const fields = event.getParam('fields');
        fields.LastName = 'My Custom Last Name'; // modify a field
        cmp.find('myRecordForm').submit(fields);
    }

})