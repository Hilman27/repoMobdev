class User{
  String name;
  String link;
  User (this.name, this.link);
}

class Event{
  int eventID;
  String imagePath;
  String caption;
  int newsType;  
  Event (this.eventID, this.imagePath, this.caption, this.newsType);
}

class Feed {
  User user;  
  Event event; 
  Feed(this.user,this.event);

}

class NewsFeed {
  
}