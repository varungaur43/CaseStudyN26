public class getContactProduct {
    
   
    @AuraEnabled(cacheable=true )
    public static List<Product2> getProduct(String caseId){
    
     // Get Contact ID from case
    Case cs = [Select Id,ContactId from Case where Id=:caseId];
        
     // Get product info based on Contact
    Contact cnt = [Select Id,Home_Country__c,Product__c from Contact where ID =:CS.ContactId];
        
      // Return product info based on product and home country
    return [Select Id,name,Home_Country__c,Product_Type__c,Fees__c from Product2 where Id=:cnt.Product__c AND Home_Country__c=:cnt.Home_Country__c];   
        
    }
}