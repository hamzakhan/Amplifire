public with sharing class rmsClassesController {

    //variable declarations
    public Revature_Music_Class__c currentClass {get; set;}
    public User currentInstructor = new User();
    public Music_Store_Accounts__c currentAssistantInstructor = new Music_Store_Accounts__c();
    public Revature_Music_Class_Roster__c currentClassRoster = new Revature_Music_Class_Roster__c();
   
    

    //Gets the ID of the objects passed and finds the Id of the corresponding class
    public rmsClassesController(){
        ID classID = ApexPages.CurrentPage().getParameters().get('id');
        this.currentClass = [SELECT Name, Instructor__c, Revature_Music_Class_Roster__c, Students_currently_in_Class__c, Assistant_Instructor__c, Instruments_Offered__c, Class_address__c FROM Revature_Music_Class__c WHERE id=:classID LIMIT 1];
        
    }

    public string getName(){
        return this.currentClass.Name;
    }

    public string getcurrentInstructor(){
        this.currentInstructor = [SELECT Name, ID FROM User WHERE Id =:this.currentClass.Instructor__c LIMIT 1 ];
        return currentInstructor.Name;
    }

    public Decimal getStudentsInClass(){
        return this.currentClass.Students_currently_in_Class__c;
    } 

    public string getcurrentAssistantInstructor(){
        this.currentAssistantInstructor = [SELECT Name, ID FROM Music_Store_Accounts__c WHERE Id =:this.currentClass.Assistant_Instructor__c LIMIT 1];
        return currentAssistantInstructor.Name;
    }

    public string getcurrentClassRoster(){
        this.currentClassRoster = [SELECT Name, ID FROM Revature_Music_Class_Roster__c WHERE Id =:this.currentClass.Revature_Music_Class_Roster__c LIMIT 1];
        return currentClassRoster.Name;
        
    }

    public string getClassAddress(){
        return this.currentClass.Class_address__c;
    }
}