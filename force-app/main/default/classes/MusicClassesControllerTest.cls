@isTest
public class MusicClassesControllerTest {
//Each of the two test methods here gives a 83 test coverage
 @isTest static void testgetAllAdvancedClasses(){
    
      Revature_Music_Class__c c = new Revature_Music_Class__c(Name= 'violin lesson', Session__c='4 weeks session',Level__c='Advanced');
      insert c;
       
     Test.StartTest();
     
		List<Revature_Music_Class__c> results = [SELECT Name,Picture__c,Instruments__r.Name,Instructor__r.Name,Session__c,Level__c,Starting_Date__c,Students_Enrolled__c From Revature_Music_Class__c WHERE Level__c=: 'Advanced'];
          
 
     Test.StopTest();
  
    
}
  @isTest static void testgetAllBeginnersClasses(){
    
      Revature_Music_Class__c c = new Revature_Music_Class__c(Name= 'violin lesson', Session__c='4 weeks session',Level__c='Beginners');
      insert c;
       
     Test.StartTest();
     
		List<Revature_Music_Class__c> results = [SELECT Name,Picture__c,Instruments__r.Name,Instructor__r.Name,Session__c,Level__c,Starting_Date__c,Students_Enrolled__c From Revature_Music_Class__c WHERE Level__c=: 'Beginners'];
          
 
     Test.StopTest();
  
    
}
  @isTest static void testgetAllIntermediateClasses(){
    
      Revature_Music_Class__c c = new Revature_Music_Class__c(Name= 'violin lesson', Session__c='4 weeks session',Level__c='Intermediate');
      insert c;
       
     Test.StartTest();
     
		List<Revature_Music_Class__c> results = [SELECT Name,Picture__c,Instruments__r.Name,Instructor__r.Name,Session__c,Level__c,Starting_Date__c,Students_Enrolled__c From Revature_Music_Class__c WHERE Level__c=: 'Intermediate'];
          
 
     Test.StopTest();
  
    
}
}