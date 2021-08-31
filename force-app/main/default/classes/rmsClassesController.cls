public with sharing class rmsClassesController {

    //variable declarations
    public Revature_Music_Class__c currentClass {get; set;}
    public User currentInstructor = new User();
    public Music_Store_Accounts__c currentAssistantInstructor = new Music_Store_Accounts__c();
    public Revature_Music_Class_Roster__c currentClassRoster = new Revature_Music_Class_Roster__c();
    public List<Student__c> currentStudentList = new List<Student__c>();
   
    

    //Gets the ID of the objects passed and finds the Id of the corresponding class
    public rmsClassesController(){
        ID classID = ApexPages.CurrentPage().getParameters().get('id');
        this.currentClass = [SELECT Name, Class_Image__c, Instructor__c, Revature_Music_Class_Roster__c, Students_currently_in_Class__c, Assistant_Instructor__c, Instruments_Offered__c, Class_address__c FROM Revature_Music_Class__c WHERE id=:classID LIMIT 1];
        
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

    public List<Student__c> getcurrentStudentList(){
        this.currentClassRoster = [SELECT Name, ID, Student_1__c, Student_2__c, Student_3__c,  Student_4__c, Student_5__c, Student_6__c, Student_7__c, Student_8__c, Student_9__c, Student_10__c, Student_11__c, Student_12__c, Student_13__c, Student_14__c, Student_15__c FROM Revature_Music_Class_Roster__c WHERE Id =:this.currentClass.Revature_Music_Class_Roster__c LIMIT 1]; 
        List<Student__c> allPossible = [SELECT Name,ID FROM Student__c];
        System.debug(allPossible.size());
        for(Integer i=0; i<allPossible.size(); i++){
            //if any of the possible ids match any of the student IDs from the class roster
            if(allPossible[i].ID == currentClassRoster.Student_1__c || allPossible[i].ID ==currentClassRoster.Student_2__c || allPossible[i].ID ==currentClassRoster.Student_3__c ||  allPossible[i].ID ==currentClassRoster.Student_4__c || allPossible[i].ID ==currentClassRoster.Student_5__c || allPossible[i].ID ==currentClassRoster.Student_6__c || allPossible[i].ID ==currentClassRoster.Student_7__c || allPossible[i].ID ==currentClassRoster.Student_8__c || allPossible[i].ID ==currentClassRoster.Student_9__c || allPossible[i].ID ==currentClassRoster.Student_10__c || allPossible[i].ID ==currentClassRoster.Student_11__c || allPossible[i].ID ==currentClassRoster.Student_12__c || allPossible[i].ID ==currentClassRoster.Student_13__c || allPossible[i].ID ==currentClassRoster.Student_14__c || allPossible[i].ID ==currentClassRoster.Student_15__c){
                currentStudentList.add(allPossible[i]); 
            }
        }
        return currentStudentList;
    }

}