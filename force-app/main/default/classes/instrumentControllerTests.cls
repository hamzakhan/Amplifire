@isTest
public class instrumentControllerTests{

    string instrumentName = 'Saxophone';
    static string instrumentDescription = 'This is a test description';
    static integer numberOfOrders = 30;
    static integer totalSupply = 10;
    static Id testID;

    

    @TestSetup
    static void makeData(){
        
        string instrumentName = 'Saxophone';        

        Music_Product__c myInstrument = new Music_Product__c();
        myInstrument.name = instrumentName;
        Music_Product__c unusedInstrument = new Music_Product__c();
        unusedInstrument.name = 'Trumpet';
        myInstrument.Estimated_Quantity__c = totalSupply;
        unusedInstrument.Estimated_Quantity__c = 20;
        myInstrument.Description__c = instrumentDescription;

        INSERT myInstrument;
        INSERT unusedInstrument;

        List<Music_Product_Order__c> sampleOrders = new List<Music_Product_Order__c>();

        //Creates sample orders

        for(integer i = 0; i < numberOfOrders; i++){
            Music_Product_Order__c newOrder = new Music_Product_Order__c();
            newOrder.Music_Product_Purchased_2__c = myInstrument.id;
            newOrder.Music_Product_Purchased_1__c = unusedInstrument.id;
            newOrder.Order_Start_Date__c = system.today();
            newOrder.Order_Late_Date__c = system.today().addDays(10);
            sampleOrders.add(newOrder);
        }

        INSERT sampleOrders;

    }

    @isTest
    public static void instrumentController_getName(){

        Test.startTest();
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Need to figure out how to pass in the instrument id here
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);
        
        instrumentController insCon = new instrumentController();

        string returnedName = insCon.getName();
        system.assertEquals(instrumentName,  returnedName);

    }

    @isTest
    public static void instrumentController_getDescription(){

        Test.startTest();
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Need to figure out how to pass in the instrument id here
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);

        string instrumentDescription = 'This is a test description';
        instrumentController insCon = new instrumentController();

        //Need to figure out how to pass in the instrument id here
        string retunedDescription = insCon.getDescription();
        system.debug('Retruned description: ' + retunedDescription);
        system.assertEquals(instrumentDescription,  retunedDescription);
        Test.stopTest();

    }

    @isTest
    public static void instrumentController_getNumberOfOrders(){

        Test.startTest();
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Need to figure out how to pass in the instrument id here
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);

        instrumentController insCon = new instrumentController();

        integer returnedNumOrders = insCon.getTotalOrders();
        system.assertEquals(numberOfOrders, returnedNumOrders);
    }

    @isTest
    public static void instrumentController_getClasses(){

        Test.startTest();
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id, name FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Need to figure out how to pass in the instrument id here
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);

        List<Revature_Music_Class__c> newClasses = new List<Revature_Music_Class__c>();

        for(integer i = 0; i < numberOfOrders; i++){

            Revature_Music_Class__c newClass = new Revature_Music_Class__c();
            newClass.name = 'Test class ' + i;
            newClass.instrument_offered__c = testProd.name;

            newClasses.add(newClass);
        }

        INSERT newClasses;

        instrumentController insCon = new instrumentController();
        List<Revature_Music_Class__c> classes = insCon.getClasses();
        system.assertEquals(newClasses, classes);
    }

    @isTest
    public static void instrumentController_getSupply(){

        Test.startTest();
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id, Estimated_Quantity__c FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Need to figure out how to pass in the instrument id here
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);

        instrumentController insCon = new instrumentController();

        decimal returnedSupply = insCon.getTotalSupply();
        system.assertEquals(totalSupply, returnedSupply);
    }

}