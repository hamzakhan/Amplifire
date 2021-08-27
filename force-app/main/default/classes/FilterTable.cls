public class FilterTable {
    string type;
    list<Music_Product__c> filter;
    public string gettype()
    {
        return this.type;
    }
    public void settype(string type)
    {
        this.type = type;
        system.debug(type);
    }
    public list<SelectOption>  getOpt()
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
	public void setFilter()
    {
        list<Music_Product__c> records=[SELECT name, image__c, price__c, estimated_quantity__c, instrument_sub_type__c 
                                        FROM Music_Product__c WHERE Instrument_Sub_Type__c=:type]; 

        this.filter=records;
    }
  		public list<music_product__c> getFilter()
        {
            return filter;
        }
}