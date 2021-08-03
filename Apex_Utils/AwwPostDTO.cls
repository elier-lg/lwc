public class AwwPostDTO {
    public string kind {get; set;}
    public AwwPostDataDTO data {get; set;}
    
    public class AwwPostDataDTO {
        public string title {get; set;}
        public string author_fullname {get; set;}
        public string thumbnail {get; set;}
        public string selftext {get; set;}           
    }
}