class User{
  String name;
  String link;
  User (this.name, this.link);
}

class Event{
  int eventID;
  String imagePath;
  String eventName;
  String caption;
  int newsType;  
  Event (this.eventID, this.imagePath, this.eventName, this.caption, this.newsType);  

  //NewsType : 1 = Joinable Event, 2 = Normal Status Update, 3 = Event Annoucement
}



