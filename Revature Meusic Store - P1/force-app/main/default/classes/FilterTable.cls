public class FilterTable {
    static string type;
    static list<Music_Product__c> filter;
    public static string gettype()
    {
        return type;
    }
    public static void settype(string pickedtype)
    {
        type = pickedtype;
        system.debug(type);
    }
    public static list<SelectOption>  getOpt()
    {
        list<SelectOption> opt=new List<SelectOption>{
        new SelectOption('Woodwind','Woodwind'),
        new SelectOption('Brass','Brass'),
        new SelectOption('Keyboard','Keyboard'),
		new SelectOption('Percussion','Percussion'),
        new SelectOption('String','String')
        };
        return opt;
    }
	public static void setFilter()
    {
        list<Music_Product__c> records=[SELECT name, image__c, price__c, estimated_quantity__c, instrument_sub_type__c 
                                        FROM Music_Product__c WHERE Instrument_Sub_Type__c=:type]; 

        filter=records;
    }
  		public static list<music_product__c> getFilter()
        {
            return filter;
        }
}