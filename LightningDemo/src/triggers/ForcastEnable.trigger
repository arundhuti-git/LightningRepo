trigger ForcastEnable on User (before insert) {
   for(User u : Trigger.new){
   u.ForecastEnabled = true;
   }
}