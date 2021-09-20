@isTest
public class notificationControllerTest {
@isTest static void testgetAllStartingClasses(){
    
      Revature_Music_Class__c c = new Revature_Music_Class__c(Name= 'violin lesson', Session__c='4 weeks session',Starting_Date__c = system.today());
      insert c;
       
     Test.StartTest();
     
		List<Revature_Music_Class__c> results =[SELECT Name, Instruments__r.Name,Instructor__r.Name,Session__c,Level__c,Starting_Date__c,Students_Enrolled__c From Revature_Music_Class__c WHERE Starting_Date__c >:system.today() LIMIT 3];
          
 
     Test.StopTest();
  
    
}
}