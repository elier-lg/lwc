public class AwwPostService{

  public void Update_Posts(){
    Delete_All();
    Add_From_Reddit();
  }

  @future(callout = true)
  public static void Add_From_Reddit(){
    Http httpProtocol = new Http();
    HttpRequest request = new HttpRequest();
    String endpoint = 'https://www.reddit.com/r/aww.json?limit=100';
    request.setEndPoint(endpoint);
    request.setMethod('GET');
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
  } 

  public void Insert_Dummy_Aww(){
    AwwPost__c postObj = new AwwPost__c();
  
    //.format('MM/dd/yyyy HH:mm:ss')
    String st = DateTime.now(); 
    postObj.title__c = 'title - ' + st;
    postObj.author_fullname__c = 'author - ' + st;
    postObj.thumbnail__c = 'thumb - ' + st;
    postObj.selftext__c = 'self_text - ' + st;
    insert postObj;
  }

  // limit of delete at 150s
  // we only request a limit of 100 from reddit in each execution of scheduled job,
  // but reddit retrieves some times a few more than that ie: 102
  // so lets leave it in 150
  public void Delete_All(){
    List<AwwPost__c> awws =[select Name from AwwPost__C limit 150];
    Delete awws;
  }
}
