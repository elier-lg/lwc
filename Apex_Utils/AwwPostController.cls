public with sharing class AwwController {

  @AuraEnabled(cacheable=true)
  public static List<AwwPost__C> getAwwList() {
      return [SELECT Id, Name, title__c, author_fullname__c, thumbnail__c, selftext__c FROM AwwPost__C LIMIT 20];
  }
  
}