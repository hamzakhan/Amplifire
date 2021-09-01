public class FilterTable {
    static string type;		//holds the user's chosen instrument subtype
    static list<Music_Product__c> filter;	//holds the filtered list
    public static string gettype()
    {
        return type;	//retrieves type variable for page use
    }
    public static void settype(string pickedtype)
    {
        type = pickedtype;	//sets the subtype to the option chosen by the user
        system.debug(type);
    }
    public static list<SelectOption>  getOpt()
    {
        list<SelectOption> opt=new List<SelectOption>{	//adds instrument subtypes to select list
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
		//queries the music products that have the same instrument subtype as the selected subtype
        list<Music_Product__c> records=[SELECT name, image__c, price__c, estimated_quantity__c, instrument_sub_type__c 
                                        FROM Music_Product__c WHERE Instrument_Sub_Type__c=:type]; 

        filter=records;
    }
  		public static list<music_product__c> getFilter()
        {
		 return filter;		//sends the filtered list to the page
        }
}
