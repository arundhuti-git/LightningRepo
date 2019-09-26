public class custom_search {

     public string keyword{get;set;}
    list<account> acts;
    
    public list<account> getacts(){
    return acts;
    }
    

   /* public void search() {
    
        if(keyword == null || keyword ==''){
            Apexpages.addMessage(new Apexpages.Message(ApexPages.severity.INFO, 'search term must be longer than one character:'));
            return;
        }
    }*/
    
    public PageReference search() {
    
        /*if(keyword == null || keyword ==''){
            Apexpages.addMessage(new Apexpages.Message(ApexPages.severity.INFO, 'search term must be longer than one character:'));
            return null;
        }
        else
        {*/
        
            acts = (list<account>)[find :keyword in all fields returning account(name,industry,phone,Rating)][0];
            return null;
        //}
    }

   /* public String getkeyword() {
        return keyword;
    }
    
   public void setkeyword(string s) {
        keyword = s;
    }*/


 
 
    

    


}