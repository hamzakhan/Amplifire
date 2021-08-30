@isTest
public class rmsClassesControllerTest {
    
    string className = 'This is a test class name';
    string contactName = 'Cena';
    string rosterName = 'This is a test roster name';


    @TestSetup
    static void makeData(){
        
        //Create new class with a test name
        Revature_Music_Class__c newClass = new Revature_Music_Class__c();
        newClass.name = className;
        INSERT newClass;

        //Create a new contact with a test name
        contact newContact = new contact();
        newContact.LastName = contactName;
        INSERT newContact;

        //Create a new roster with a test name
        Revature_Music_Class_Roster__c newRoster = new Revature_Music_Class_Roster__c();
        newRoster.name = rosterName;
        newRoster.Revature_Music_Class__c = newClass;
        newRoster.contact = newContact;
        INSERT newRoster;


    }

}