@RestResource(urlMapping='/contacts/UUID/*')
global with sharing class returnContact{
    @HttpGet
    global static Contact getContact(){
        RestRequest request = RestContext.request;
        String UUID = RestContext.request.params.get('UUID'); 
        system.debug(''+UUID);
        Contact objcontact = [SELECT Product__r.name,Product__r.Product_Type__c,Product__r.Fees__c FROM Contact WHERE UUID__c= :UUID LIMIT 1];
        return objcontact;
    }
}