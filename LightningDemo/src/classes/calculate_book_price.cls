public class calculate_book_price{
    public static void apply_discount(list<book__c> bk){
     for(book__c bk_list:bk){
         bk_list.price__c *=0.9;
     }
    }
}