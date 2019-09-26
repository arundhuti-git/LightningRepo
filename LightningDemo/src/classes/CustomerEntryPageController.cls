public with sharing class CustomerEntryPageController {

    public PageReference quicksave() {
        return null;
    }

    
    public Candidate__c customerObj{get;set;}
    String customerId{get;set;}
    public String message{get;set;}
 
    /**
    *@purpose : Constructor to fetch current Customer Record and its Action
    **/
   public CustomerEntryPageController () { 
      message = '';
      // Fetching the Current Customer Id
      customerId = System.currentPageReference().getParameters().get('Id');
       //if(cutomerId != NULL){
         customerObj = [SELECT Id,Name,Mobile_Number__c FROM Candidate__c WHERE id=:customerId];
      //}
   }
 
   /**
    *@purpose : Method for Saving the Customer Object Record 
    *@param : None 
    *@return : PageReference to Standard Salesforce Record Detail Page 
    **/
   /*public PageReference savingCustomerRecord(){
      try{
         upsert customerObj;
         PageReference nextpage= new PageReference('/'+customerObj.id);
           return nextpage;
      }
      catch(Exception e){
            message='Data Base error during saving...';
            ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.ERROR, message));
            return null;
        }
   }*/



}