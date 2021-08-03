public with sharing class AwwController {

  @AuraEnabled(cacheable=true)
  public static List<AwwPost__C> getAwwList() {
      string url ='https://i1.wp.com/www.msnoob.com/wp-content/uploads/2018/12/error-404.jpg?fit=1000%2C938&ssl=1';
      List<AwwPost__C> lst = [SELECT Id, Name, title__c, author_fullname__c, thumbnail__c, selftext__c FROM AwwPost__C LIMIT 20];

      for (AwwPost__C ap : lst) {
          if (string.isBlank(ap.thumbnail__c.trim()) ||  ap.thumbnail__c == 'default' ){
            ap.thumbnail__c = url;
          }
      }

      return lst;
  }
  
}