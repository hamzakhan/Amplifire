public with sharing class instrumentController {
    
    //Variable declarations
    public Music_Product__c currentProduct {get; set; }
    public transient Integer totalOrders;
    public List<Revature_Music_Class__c> classes = new List<Revature_Music_Class__c>();
    public integer numberOfOrders;
    public integer totalSupply;

    //Gets the ID of the passed object and finds the instrument of that ID
    public instrumentController() {
        ID instrumentID = ApexPages.CurrentPage().getParameters().get('id');
        this.currentProduct = [SELECT name, description__c, Estimated_Quantity__c FROM Music_Product__c WHERE id=:instrumentID LIMIT 1];
    }

    //Done
    public string getName(){

        return this.currentProduct.name;

    }

    //Description needs to be added by Max
    public string getDescription(){

        return this.currentProduct.description__c;

    }

    //Gets the total number of orders
    //Needs to account for the different fields from order
    public integer getTotalOrders(){

        try{
            totalOrders = [SELECT COUNT() FROM Music_Product_Order__c WHERE Music_Product_Purchased_1__c=:currentProduct.name OR Music_Product_Purchased_2__c=:currentProduct.name OR Music_Product_Purchased_3__c=:currentProduct.name];
        }catch(Exception e){
            system.debug('There was an error in getting the number of orders of the instrument type' + currentProduct.name);
            return null;
        }
        return totalOrders;

    }

    //Gets all of the classes associated with that instrument
    //Needs to have instruments added to classes by Max
    public List<Revature_Music_Class__c> getClasses(){

        this.classes = [SELECT name FROM Revature_Music_Class__c WHERE Revature_Music_Class__c.instruments INCLUDES(:this.currentProduct.name)];
        return classes;

    }

    public decimal getTotalSupply(){

        return this.currentProduct.Estimated_Quantity__c;

    }

}
