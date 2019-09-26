trigger check_total_amount on Opportunity(before insert) {
    opportunity_check_trg.check_amount(trigger.new);
}