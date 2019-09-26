public class lightening_contact_list {
    
    //thie annotation makes the method available for lightening application
	@AuraEnabled
    public static List<Contact> findall(Id recordId) {
       return [Select Id, FirstName, LastName, Email, Phone From Contact];
    }

}