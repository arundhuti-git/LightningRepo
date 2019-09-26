public class cus_acct_details { 

    public Account account{set;get;}
    
    public cus_acct_details(){
        Id current_id = apexpages.currentpage().getparameters().get('id');
        account = [select name,phone from account where id =:current_id];
    }

}