@isTest

private class Testclass{

    static testmethod void validate_book(){
        book__c new_book = new book__c(name = 'fire of wings',price__c = 100);
        system.debug('Before insert the book price is '+new_book.price__c);
        
        //insert book
        insert new_book;
        
        new_book =[select price__c from book__c where Id =  :new_book.Id];
        system.debug('after insert the book price is '+new_book.price__c);
        system.assertequals(50,new_book.price__c);
    }
}