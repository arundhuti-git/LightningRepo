public class OpportunityStatusPFController{

    public string oppId {get;set;}
    public string currentStatus {get;set;}
    
    
    public OpportunityStatusPFController(ApexPages.standardcontroller sc){
        system.debug('test controller');
        oppId = sc.getRecord().Id;
        //system.debug('oppId --'+oppId );
        //This error occurs when query doesn't return any rows
        //currentStatus = [select id, stagename from opportunity where id=:oppId].StageName;
        //currentStatus = oppId.StageName;
        //currentStatus ='Proposal/Price Quote';
        //system.debug('Id--'+oppId);
        List<Opportunity> lsOpportunity  = [select id, stagename from opportunity where id=:sc.getRecord().Id];//.StageName;
        if (lsOpportunity.size() > 0)
        {
         Opportunity opp = lsOpportunity.get(0);
         oppId = opp.Id;
         currentStatus = [select id, stagename from opportunity where id=:oppId].StageName;
         system.debug(currentStatus + 'test');
        }
        
    }
    public List<String> getStageValues(){
        Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        List<String> options = new List<String>();

        
        for( Schema.PicklistEntry f : ple){
           options.add(f.getValue());
           //system.debug('--'+f.getValue());
        }   
           
        return options;
    }
}