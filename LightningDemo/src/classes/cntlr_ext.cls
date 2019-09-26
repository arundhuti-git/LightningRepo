public class cntlr_ext{

    public string cntlr_ext;
    public string account_name {get;set;}

    //list<string> account = UserInfo.getUserId();
    User Usr = new User();

    public  string name(){
    
         Usr = [SELECT Phone, Id FROM User WHERE Id = : UserInfo.getUserId()];
         return Usr.name;
    
    }

}