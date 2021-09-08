@isTest
public class instrumentControllerTests{

    //Variable declarations
    static string instrumentName = 'Saxophone';
    static string instrumentDescription = 'This is a test description';
    static integer numberOfOrders = 30;
    static integer totalSupply = 10;
    static Id testID;

    @TestSetup
    static void makeData(){
        
        //Creates instruments for use in the database
        Music_Product__c myInstrument = new Music_Product__c();
        myInstrument.name = instrumentName;
        Music_Product__c unusedInstrument = new Music_Product__c();
        unusedInstrument.name = 'Trumpet';
        myInstrument.Estimated_Quantity__c = totalSupply;
        unusedInstrument.Estimated_Quantity__c = 20;
        myInstrument.Description__c = instrumentDescription;

        INSERT myInstrument;
        INSERT unusedInstrument;

        //Creates a list of orders to be used for listing
        List<Music_Product_Order__c> sampleOrders = new List<Music_Product_Order__c>();

        //Creates sample orders with the related instrument
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

        //Gets the instrument from the database
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Adds in the needed constructor for usage of the page
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);
        instrumentController insCon = new instrumentController();

        string returnedName = insCon.getName();
        system.assertEquals(instrumentName,  returnedName);

        Test.stopTest();
    }

    @isTest
    public static void instrumentController_getDescription(){

        Test.startTest();

        //Gets the instrument from the database
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Adds in the needed constructor for usage of the page
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);
        instrumentController insCon = new instrumentController();

        //Tests the method itself
        string retunedDescription = insCon.getDescription();
        system.assertEquals(instrumentDescription,  retunedDescription);
        
        Test.stopTest();
    }

    @isTest
    public static void instrumentController_getNumberOfOrders(){

        Test.startTest();
        
        //Gets the instrument from the database
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Adds in the needed constructor for usage of the pages
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);
        instrumentController insCon = new instrumentController();

        //Tests the method itself
        integer returnedNumOrders = insCon.getTotalOrders();
        system.assertEquals(numberOfOrders, returnedNumOrders);

        Test.stopTest();
    }

    @isTest
    public static void instrumentController_getClasses(){

        Test.startTest();

        //Gets the instrument from the database
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id, name FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Adds in the needed constructor for usage of the page
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);

        //Adds new classes 
        List<Revature_Music_Class__c> newClasses = new List<Revature_Music_Class__c>();
        for(integer i = 0; i < numberOfOrders; i++){

            Revature_Music_Class__c newClass = new Revature_Music_Class__c();
            newClass.name = 'Test class ' + i;
            newClass.instrument_offered__c = testProd.name;
            newClasses.add(newClass);
        }

        INSERT newClasses;

        instrumentController insCon = new instrumentController();

        //Tests the method itself
        List<Revature_Music_Class__c> classes = insCon.getClasses();
        system.assertEquals(newClasses, classes);

        Test.stopTest();
    }

    @isTest
    public static void instrumentController_getSupply(){

        Test.startTest();

        //Gets the instrument from the database
        string instrumentName = 'Saxophone';
        Music_Product__c testProd = [SELECT id, Estimated_Quantity__c FROM Music_Product__c WHERE name=:instrumentName LIMIT 1];
        
        //Adds in the needed constructor for usage of the page
        PageReference pageRef = Page.instrumentDetailPage;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testProd.id);
        instrumentController insCon = new instrumentController();

        //Tests the method itself
        decimal returnedSupply = insCon.getTotalSupply();
        system.assertEquals(totalSupply, returnedSupply);

        Test.stopTest();
    }

}