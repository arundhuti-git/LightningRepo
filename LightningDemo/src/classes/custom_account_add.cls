public class custom_account_add {

    /*public String getAccount() {
        return null;
    }*/


    public Account acc{get;set;} // get set of the variable
    //public account_add(){get;set;}
    
    public custom_account_add(){
        acc = new Account();
    }
    
    
    public pagereference save(){
    
        insert acc;
        pagereference pr = new pagereference('/apex/page/add_phone?id=' +acc.id); //controller action will transfer to add_phone 
        return pr;
    
    }
    
    
    

}