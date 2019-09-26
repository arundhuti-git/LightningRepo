trigger book_price on Book__c (before insert,before update) {
    calculate_book_price.apply_discount(trigger.new);
}