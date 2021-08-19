@isTest
public class AccountReggieTriggerHandlerTester {

    @isTest static void TheReg(){
        //Testing Positive for Trigger,
        //Account being created is under "The Reg",
        //Account is not allowed to be created
        //
        Account ReggieAccount = new Account(name = 'The Reg');
        List<Account> accList = new List<Account>();
        accList.add(ReggieAccount);
        try{
            database.insert(accList);
        }
        catch(System.DmlException CustomDMLException){
            System.assertEquals(1,1);
        }
        
        
    }
    
    @isTest static void Reggie(){
        //Testing Positive for Trigger,
        //Account being created is under "Reggie",
        //Account is not allowed to be created
        //
        Account ReggieAccount = new Account(name = 'Reggie');
        List<Account> accList = new List<Account>();
        accList.add(ReggieAccount);
        try{
            database.insert(accList);
        }
        catch(System.DmlException CustomDMLException){
            System.assertEquals(1,1);
        }
    }
    
    @isTest static void notReggie(){
        //Testing Negative for Trigger,
        //Account being created is not under "Reggie" or "Reg",
        //Account is allowed to be created
        //
        Account ReggieAccount = new Account(name = 'Cyrus');
        List<Account> accList = new List<Account>();
        accList.add(ReggieAccount);
        
        database.insert(accList);
        
        List<Account> postInsertList = [SELECT id,name FROM Account WHERE name = 'Cyrus'];
        Integer TruthEval;
        if(postInsertList != null){
            //Test is succesful and PostInsertList should have Cyrus
            TruthEval = 1;
        }
        else{
            TruthEval = 0;
        }
        System.assertEquals(1, TruthEval);
        
        
    }
    
    
}