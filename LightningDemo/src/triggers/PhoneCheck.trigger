trigger PhoneCheck on User (before insert,before update) {

 for (User u:Trigger.new){
  if(u.Phone == null){
  }
 
 }

}