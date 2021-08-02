Http httpProtocol = new Http();
// Create HTTP request to send.
HttpRequest request = new HttpRequest();
// Set the endpoint URL.
String endpoint = 'https://www.reddit.com/r/salesforce.json?limit=100';
request.setEndPoint(endpoint);
// Set the HTTP verb to GET.
request.setMethod('GET');
// Send the HTTP request and get the response.
// The response is in JSON format.
HttpResponse response = httpProtocol.send(request);
System.debug(response.getBody());

// Parse JSON response to get all the totalPrice field values.
JSONParser parser = JSON.createParser(response.getBody());
List<AwwPost__c> postList = new List<AwwPost__c>();

// iterate any token
while (parser.nextToken() != null) {
  if (parser.getCurrentToken() == JSONToken.FIELD_NAME  && parser.getText() == 'children') {
        while (parser.nextToken() != null) {
          if (parser.getCurrentToken() == JSONToken.START_OBJECT){
            AwwPostDTO post = (AwwPostDTO)parser.readValueAs(AwwPostDTO.class);
            AwwPost__c postObj = new AwwPost__c();
            postObj.title__c = post.data.title; 
            postObj.author_fullname__c = post.data.author_fullname; 
            postObj.thumbnail__c = post.data.thumbnail; 
            postObj.selftext__c = post.data.selftext; 
            postList.add(postObj);
          }
        }
    }
}
system.debug('Posts Data' + postList);
insert postList;