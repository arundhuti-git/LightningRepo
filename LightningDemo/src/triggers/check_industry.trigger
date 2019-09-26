trigger check_industry on Account (before insert,before update) {
   for(Account acc:trigger.new){
   if(acc.Industry == 'Education' && Trigger.isInsert)
   acc.addError('We don\'t work with Education org');
   
   }

}