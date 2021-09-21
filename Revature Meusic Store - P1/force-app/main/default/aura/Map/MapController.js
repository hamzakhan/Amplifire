({
    FindMap: function (cmp, event, helper) {
        var classselected = event.getParam('classes');
        //alert(classselected.Class_Street__c);
        if(classselected.Class_Street__c!='') {
        cmp.set('v.mapMarkers', [
            {
                location: {
                    Street: classselected.Class_Street__c,
                    City: classselected.Class_City__c,
                    State: classselected.Class_State__c
                },

                title: 'Music Store',
                description: 'Music Lesson are also available'
            }
        ]);
    }
 
},

    init: function (cmp, event, helper) {
        cmp.set('v.mapMarkers', [
            {
                location: {
              
                    Street: '4600 N Fairfax Dr',
                    City: 'Arlington',
                    State: 'VA'
                },

                title: 'The White House',
                description: 'Landmark, historic home & office of the United States president, with tours for visitors.'
            }
        ]);
        cmp.set('v.zoomLevel', 16);
    }


});