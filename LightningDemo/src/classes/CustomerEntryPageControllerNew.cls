public with sharing class CustomerEntryPageControllerNew {

    public Candidate__c customerObj{get;set;}
    String customerId{get;set;}
    public String message{get;set;}

    public PageReference quicksave() {
        return null;
    }
    
    
    
 
    /**
    *@purpose : Constructor to fetch current Customer Record and its Action
    **/
   public CustomerEntryPageControllerNew () { 
      message = '';
      // Fetching the Current Customer Id
      customerId = System.currentPageReference().getParameters().get('Id');
       if(customerId != NULL){
         customerObj = [SELECT Id,Name,Mobile_Number__c FROM Candidate__c WHERE id=:customerId];
      }
   }
 
    
    
}