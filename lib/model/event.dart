class Event {
  int eventID;
  String imagePath;
  String eventName;
  String eventLocation;
  String caption;
  int newsType;
  DateTime edateTime;
  Event(
      {this.eventID,
      this.imagePath,
      this.eventName,
      this.eventLocation,
      this.caption,
      this.edateTime,
      this.newsType});

  //NewsType : 1 = Joinable Event, 2 = Normal Status Update, 3 = Event Annoucement
}
