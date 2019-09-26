trigger OpportunityPFEventTrigger on Opportunity (after update) {
    //System.debug('Trigger Fire');

    list<Opportunity_Status_Event__e> eventList = new list<Opportunity_Status_Event__e>();
    for(Opportunity opp: trigger.new){
        //if(opp.StageName != Trigger.oldmap.get(opp.id).StageName){
        System.debug(opp.IsPrivate);
        if(opp.IsPrivate == true){
            Opportunity_Status_Event__e statusEvent = new Opportunity_Status_Event__e();
            statusEvent.record_id__c = opp.id;
            statusEvent.status__c = opp.StageName;
            eventList.add(statusEvent);
        }
    }
    
    if(eventList.size() > 0){
        EventBus.publish(eventList);
        System.debug('Opportunity_Status_Event__e Bus published');
    }
    
}