trigger Test_account_trigger on Account (before update) { // only for update
    
    for(Account acc : trigger.new){
        
        
       /* AccountShare AccShare = new AccountShare(AccountId = acc.Id,AccountAccessLevel = 'Edit', OpportunityAccessLevel = 'Read',CaseAccessLevel = 'Read', 
                                                 UserOrGroupId = UserInfo.getUserId());
        Insert AccShare;*/
        
        
        
        account oldacc = trigger.oldmap.get(acc.id); // to fetch the old value
        
        boolean new_test_account = acc.DevLightening__Test_Account__c;
        boolean old_test_account = oldacc.DevLightening__Test_Account__c;
        
        if(old_test_account ==  false && new_test_account ==  true){
            acc.DevLightening__Creation_purpose__c = 'Created for testing purpose.';    
        }
        
        if(old_test_account ==  true && new_test_account ==  false){
            acc.DevLightening__Creation_purpose__c = '';    
        }
        
    }

}