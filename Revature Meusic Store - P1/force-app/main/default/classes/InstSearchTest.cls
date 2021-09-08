@isTest
public class InstSearchTest {
     
	@testSetup
    public static void setup()
    {
        list<Music_Product__C> iList=new list<Music_Product__C>();
        
         ilist.add(new music_product__C(name='test-1',Product_Type__c='instrument',instrument_sub_type__c='Woodwind', price__c=200.00, Estimated_Quantity__c=5,image__c='NoImage.jpg'));   
         ilist.add(new music_product__C(name='test-2',Product_Type__c='instrument',instrument_sub_type__c='Brass', price__c=200.00, Estimated_Quantity__c=5,image__c='NoImage.jpg'));   
         ilist.add(new music_product__C(name='test-3',Product_Type__c='instrument',instrument_sub_type__c='String', price__c=200.00, Estimated_Quantity__c=5,image__c='NoImage.jpg'));   
         ilist.add(new music_product__C(name='test-4',Product_Type__c='instrument',instrument_sub_type__c='Percussion', price__C=200.00, Estimated_Quantity__c=5,image__c='NoImage.jpg'));   
         ilist.add(new music_product__C(name='test-5',Product_Type__c='instrument',instrument_sub_type__c='Keyboard', price__C=200.00, Estimated_Quantity__c=5,image__c='NoImage.jpg'));   
         ilist.add(new music_product__C(name='test-6',Product_Type__c='instrument',instrument_sub_type__c='Woodwind', price__c=200.00,Estimated_Quantity__c=5,image__c='NoImage.jpg'));   
         ilist.add(new music_product__C(name='test-7',Product_Type__c='instrument',instrument_sub_type__c='Brass', price__c=200.00, Estimated_Quantity__c=5,image__c='NoImage.jpg'));   
         ilist.add(new music_product__C(name='test-8',Product_Type__c='instrument',instrument_sub_type__c='Woodwind', price__c=200.00, Estimated_Quantity__c=5,image__c='NoImage.jpg'));   
         ilist.add(new music_product__C(name='test-9',Product_Type__c='instrument',instrument_sub_type__c='Woodwind', price__c=200.00, Estimated_Quantity__c=5,image__c='NoImage.jpg'));   
        insert ilist;
    }
    @IsTest
    public static void filterTest()
    {
        string type;
    list<Music_Product__c> filter;
        list<SelectOption> opt=new List<SelectOption>();
        test.startTest();
        FilterTable.settype('woodwind');
        type=FilterTable.gettype();
        system.assertEquals(type, 'woodwind');
        FilterTable.setFilter();
        filter=FilterTable.getFilter();
        system.assertEquals(4, filter.size());
        opt=FilterTable.getOpt();
        system.assertEquals(5, opt.size());
         system.assertEquals('Woodwind',opt[0].getvalue());
		system.assertEquals('Brass',opt[1].getvalue());
        system.assertEquals('Keyboard',opt[2].getvalue());
        system.assertEquals('Percussion',opt[3].getvalue());
        system.assertEquals('String',opt[4].getvalue());
        test.stopTest();
    }
}