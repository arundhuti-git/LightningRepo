public class sampleset{

    public string Name{get;set;}
    public string email{get;set;}
    public string phone{get;set;}
    public string country{get;set;}
    public string cities{get;set;}
    public string cityobj{get;set;}
    public string countryobj{get;set;}
    //public city__c cityparent{get;set;}
    
    
    public sampleset(ApexPages.StandardController controller) {

    }
    
    public pagereference recordinsert(){
        candidate__c candidate = new candidate__c(Name=name,Email__c = email,Mobile_Number__c = phone,City__c = cityobj,country__c = country);
        insert candidate;
        candidate.clear();
        pagereference pg = new pagereference('https://ap5.salesforce.com/a03/o');
        pg.setredirect(false);
        return pg;
    }
    
    public list<selectOption> countryobj(){
        list<selectOption> options = new list<selectOption>();
        schema.DescribeFieldResult statusFieldDescription= city__c.Country__c.getDescribe();
        //system.debug(field_desc);
        options.add(new selectoption('----select country----','----select country----'));
        
        List<Schema.PicklistEntry> ple = statusFieldDescription.getPicklistValues();
        System.debug('Picklist::'+ple);
        for( Schema.PicklistEntry pickListentry : ple){
        //for(schema.pickListentry pickListentry: statusFieldDescription.getPicklistvalues()){
            options.add(new selectoption(pickListentry.getValue(),pickListentry.getlabel()));
        }
        return options;
    }
    
    public list<selectOption> getcityobj(){
        list<selectOption> city_options = new list<selectOption>();
        list<city__c> cities =[select name from city__c where country__c =:country];
        city_options.add(new selectoption('----select country----','----select country----'));
        for(city__c c: cities){
            city_options.add(new selectoption(c.name,c.name));
        }
        return city_options;
    }
    

}