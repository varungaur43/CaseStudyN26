@isTest 
private class ContactProductTest{
    
    //This method is test data for create contact,Product and Case object
    static testMethod void testMethod1(){
        Product2 objProduct = new Product2(Name = 'test Product');
        // Insert product
        insert objProduct;
        Contact objContact = new Contact(LastName = 'test Contact',Product__c = objProduct.Id );
        // Insert Contact and add Product
        insert objContact;
        Case cs = New Case(Status='New',Origin='Phone',ContactId = objContact.Id);
         // Insert case and add Contact
        Test.startTest();
        Insert cs;
        Test.stopTest();
        
        //call getContactProduct to test coverage
        getContactProduct.getProduct(cs.Id);
        
        Id recordId = objContact.Id;
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://vgaur-dev-ed.my.salesforce.com/services/apexrest/Contacts/UUID'+ recordId +'';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test 
        Contact thisContact = returnContact.getContact();
        // Verify results
        System.assert(thisContact!= null);
        System.assertEquals('test Contact', thisContact.Name);
        
    }
}