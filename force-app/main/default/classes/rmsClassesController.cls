public with sharing class rmsClassesController {

    //variable declarations
    public Revature_Music_Class__c currentClass {get; set;}
    

    //Gets the ID of the objects passed and finds the Id of the corresponding class
    public rmsClassesController(){
        ID classID = ApexPages.CurrentPage().getParameters().get('id');
        this.currentClass = [SELECT Name, Instructor__c, Revature_Music_Class_Roster__c, Students_currently_in_Class__c, Assistant_Instructor__c, Instruments_Offered__c, Class_address__c FROM Revature_Music_Class__c WHERE id=:classID LIMIT 1];

    }

    public string getName(){
        return this.currentClass.Name;
    }

    public string getInstructor(){
        return this.currentClass.Instructor__c.Name;
    }

    public Decimal getStudentsInClass(){
        return this.currentClass.Students_currently_in_Class__c;
    } 

    public string getAssistantInstructor(){
        return this.currentClass.Assistant_Instructor__c.Name;
    }

    public string getClassRoster(){
        return this.currentClass.Revature_Music_Class_Roster__c.Name;
    }

    public string getClassAddress(){
        return this.currentClass.Class_address__c;
    }
}