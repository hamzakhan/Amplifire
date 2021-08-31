@isTest
public class rmsClassesControllerTest {
    
    //Variable declarations
    static string className = 'Zebra Keys';
    static string contactName = 'Louis Bonnet';
    static string rosterName = 'MCS-100';
    static integer classSize = 3;
    
    static string teacherFirstName = 'Charlie';
    static string teacherLastName = 'Kelly';
    static string teacherName = 'Charlie Kelly';
    static string teacherAlias = 'ckell';
    static string teacherEmail = 'ckelly@milksteak.com';
    static string teacherUsername = 'ckelly@GrilledCharlie.com';
    static string teacherNickname = 'GreenMan';
    static string teacherRole = 'Instructor';
    static string teacherUserlicense = 'Force.com - App Subscription';
    static string teacherProfile = 'Force.com - App Subscription User';
    
    static string teacherTimeZoneSidKey = 'America/Los_Angeles';
    static string teacherLocaleSidKey = 'en_US';
    static string teacherEmailEncodingKey = 'UTF-8';
    static string LanguageLocaleKey = 'en_US';
    
    static string assistantTeacherName = 'John Smith';

    static Student__c stud1 = new Student__c();
    static Student__c stud2 = new Student__c();
    static Student__c stud3 = new Student__c();
    static string Pupa1Name = 'Dennis Reynolds';
    static string Pupa2Name = 'Ronald Mcdonald';
    static string Pupa3Name = 'Deandra Reynolds';
    static List<Student__c> studentList = new List<Student__c>();
    


    @TestSetup
    static void makeData(){
        
        //Create a new contact with a test name for class roster
        contact newContact = new contact();
        newContact.LastName = contactName;
        INSERT newContact;

        //Create new Instructor and add all necessary fields
        User teacher = new User();
        Profile profileForTeacher = [SELECT id FROM Profile WHERE name = 'Instructor Profile'];
        teacher.FirstName = teacherFirstName;
        teacher.LastName = teacherLastName;
        teacher.Alias = teacherAlias;
        teacher.Email = teacherEmail;
        teacher.Username = teacherUsername;
        teacher.CommunityNickname = teacherNickname;
        teacher.TimeZoneSidKey = teacherTimeZoneSidKey;
        teacher.LocaleSidKey = teacherLocaleSidKey;
        teacher.EmailEncodingKey = teacherEmailEncodingKey; 
        teacher.LanguageLocaleKey = 'en_US';
        teacher.ProfileId = profileForTeacher.id;
        INSERT teacher;

        //Create new Assistant Instructor
        Music_Store_Accounts__c assistantTeacher = new Music_Store_Accounts__c();
        assistantTeacher.Name = assistantTeacherName;
        INSERT assistantTeacher;

        //Create Students
        Student__c Pupa1 = new Student__c();
        Student__c Pupa2 = new Student__c();
        Student__c Pupa3 = new Student__c();
        Pupa1.Name = Pupa1Name;
        Pupa2.Name = Pupa2Name;
        Pupa3.Name = Pupa3Name;
        List<Student__c> studentList = new List<Student__c>();
        stud1.Name = Pupa1Name;
        stud2.Name = Pupa2Name;
        stud3.Name = Pupa3Name;
        studentList.add(stud1);
        studentList.add(stud2);
        studentList.add(stud3);

        INSERT Pupa1;
        INSERT Pupa2;
        INSERT Pupa3;
        
        //Create new class with a test name
        Revature_Music_Class__c newClass = new Revature_Music_Class__c();
        newClass.name = className;
        newClass.Instructor__c = teacher.Id;
        newClass.Assistant_Instructor__c = assistantTeacher.Id;
        newClass.Students_currently_in_Class__c = classSize;
        INSERT newClass;

        //Create a new roster with a test name
        Revature_Music_Class_Roster__c newRoster = new Revature_Music_Class_Roster__c();
        newRoster.Name = rosterName;
        newRoster.contact__c = newContact.id;
        newRoster.Revature_Music_Class__c = newClass.id;
        newRoster.Student_1__c = Pupa1.Id;
        newRoster.Student_2__c = Pupa2.Id;
        newRoster.Student_3__c = Pupa3.Id;
        INSERT newRoster;
        newClass.Revature_Music_Class_Roster__c = newRoster.id;
        UPDATE newClass;


    }

    @isTest
    public static void rmsClassesController_getName(){

        Test.startTest();

        //Get a class from the database
        string className = 'Zebra Keys';
        Revature_Music_Class__c testClass = [SELECT id FROM Revature_Music_Class__c WHERE name=:className LIMIT 1];

        //Adds in the needed constructor for usage of the pages
        PageReference pageRef = Page.classDetailsPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testClass.id);
        rmsClassesController rmsCon = new rmsClassesController();

        //Tests the method itself
        string returnedName = rmsCon.getName();
        System.System.debug(returnedName);
        System.assertEquals(className, returnedName);

        Test.StopTest();

    }

    @isTest
    public static void rmsClassesController_getcurrentInstructor(){
        
        Test.startTest();


        //Get a class from the database
        string className = 'Zebra Keys';
        Revature_Music_Class__c testClass = [SELECT id FROM Revature_Music_Class__c WHERE name=:className LIMIT 1];

        //Adds in the needed constructor for usage of the pages
        PageReference pageRef = Page.classDetailsPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testClass.id);
        rmsClassesController rmsCon = new rmsClassesController();

        //tests the method itself
        string returnedInstructor = rmsCon.getcurrentInstructor();
        System.assertEquals(teacherName, returnedInstructor);
        
        Test.StopTest();

    }

    @isTest
    public static void rmsClassesController_getStudentsInClass(){

        Test.startTest();

        //Get a class from the database
        string className = 'Zebra Keys';
        Revature_Music_Class__c testClass = [SELECT id FROM Revature_Music_Class__c WHERE name=:className LIMIT 1];

        //Adds in the needed constructor for usage of the pages
        PageReference pageRef = Page.classDetailsPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testClass.id);
        rmsClassesController rmsCon = new rmsClassesController();

        //Tests the method itself
        decimal returnedStudentNumber = rmsCon.getStudentsInClass();
        System.assertEquals(classSize, returnedStudentNumber);

        Test.StopTest();

    }

    @isTest
    public static void rmsClassesController_getcurrentAssistantInstructor(){

        Test.startTest();

        //Get a class from the database
        string className = 'Zebra Keys';
        Revature_Music_Class__c testClass = [SELECT id FROM Revature_Music_Class__c WHERE name=:className LIMIT 1];

        //Adds in the needed constructor for usage of the pages
        PageReference pageRef = Page.classDetailsPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testClass.id);
        rmsClassesController rmsCon = new rmsClassesController();

        //Tests the method itself
        string returnedAssistant = rmsCon.getcurrentAssistantInstructor();
        System.assertEquals(assistantTeacherName, returnedAssistant);

        Test.StopTest();

    }

    @isTest
    public static void rmsClassesController_getcurrentClassRoster(){

        Test.startTest();

        //Get a class from the database
        string className = 'Zebra Keys';
        Revature_Music_Class__c testClass = [SELECT id FROM Revature_Music_Class__c WHERE name=:className LIMIT 1];

        //Adds in the needed constructor for usage of the pages
        PageReference pageRef = Page.classDetailsPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testClass.id);
        rmsClassesController rmsCon = new rmsClassesController();

        //Tests the method itself
        string returnedRoster = rmsCon.getcurrentClassRoster();
        System.assertEquals(rosterName, returnedRoster);

        Test.StopTest();

    }

    @isTest
    public static void rmsClassesController_getcurrentStudentList(){

        Test.startTest();

        //Get a class from the database
        string className = 'Zebra Keys';
        Revature_Music_Class__c testClass = [SELECT id FROM Revature_Music_Class__c WHERE name=:className LIMIT 1];

        //Adds in the needed constructor for usage of the pages
        PageReference pageRef = Page.classDetailsPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testClass.id);
        rmsClassesController rmsCon = new rmsClassesController();

        //Tests the method itself
        List<Student__c> returnedStudentList = rmsCon.getcurrentStudentList();
        //List<Student__c> returnedStudentListNames = new List<Student__c>();
        List<Student__c> returnedStudentListNames = [SELECT id, Name FROM Student__c WHERE Name='Dennis Reynolds' or Name='Ronald Mcdonald' or Name = 'Deandra Reynolds'];
        //for(integer y=0; y<returnedStudentList.size(); y++){
        //    if(returnedStudentList[y].id==Pupa1.id || returnedStudentList[y].id==Pupa2.id || returnedStudentList[y].id==Pupa3.id){
        //        returnedStudentListNames.add(returnedStudentList[y]);
        //    }
        //} 
        System.assertEquals(returnedStudentList, returnedStudentListNames);

        Test.StopTest();

    }


}