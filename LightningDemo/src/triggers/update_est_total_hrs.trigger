trigger update_est_total_hrs on Estimator_Component__c (after insert,after update) {

    Estimator_Component__c current_estimatorcmp = trigger.new[0];
    system.debug('current_estimatorcmp.Estimator__c'+ current_estimatorcmp.Estimator__c);
    
    //fetch old total hours
    Estimator__c old_estm = [Select Total_Hours__c FROM Estimator__c WHERE Id =:current_estimatorcmp.Estimator__c];
    //system.debug('current_estimator.Total_Hours__c' + old_estm.Total_Hours__c);
    
    
    
    
    
    

}