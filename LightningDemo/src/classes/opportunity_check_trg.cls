public class opportunity_check_trg{

    public static void check_amount(list<opportunity> op){
       double total_amount =0;
       
       //for existing opportunity
       for(opportunity existing_op : [select amount from opportunity where createdDate = today and createdbyID = :userinfo.getuserid()]){
        total_amount+= existing_op.amount;
       }
       
       
       //for new opportunity
       for(opportunity new_op :op){
         total_amount+= new_op.Amount;
         
         if(total_amount >10000) 
         new_op.addError('You have exceed the limit');
       }
       
       
    
    }


}