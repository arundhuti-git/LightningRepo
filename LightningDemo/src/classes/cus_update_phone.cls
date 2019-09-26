public class cus_update_phone {

    public account acc{get;set;}
    
    public cus_update_phone(){
    Id id = apexpages.currentpage().getparameters().get('id');
    acc = [select name,id,phone from account where id =:id ];
    }
    
    public pagereference save(){
    
        update acc;
        pagereference pr = new pagereference('/apex/page/details?id=' +acc.id); //controller action will transfer to details page 
        return pr;
    
    }



}