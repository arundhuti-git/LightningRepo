public class wrapper_class_example {
   
    list<contact> contactlist= new list<contact>();
    list<account> accountlist= new list<account>();
    list<wrapper> wrplist = new list<wrapper>();
    
    public list<wrapper> getwrapperlist(){
    
        accountlist = [select name,industry from account];
        contactlist = [select FirstName,Phone from contact];
        
        for(integer i=0;i<accountlist.size();i++){
        
            wrplist.add(new wrapper(accountlist[i].name,accountlist[i].industry,contactlist[i].FirstName,contactlist[i].Phone));
            
        }
        return wrplist;
    }


public class wrapper{
     public string name{get;set;}
     public string industry{get;set;}
     public string cname{get;set;}
     public string phone{get;set;}


    public wrapper(string name,string industry,string cname,string phone){//
     this.name = name;
     this.industry = industry;
     this.cname = cname;
     this.phone= phone;
     
    }
    
}
    
    

}