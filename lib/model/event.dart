class Event {
  int eventID;
  String imagePath = 'placeholderImage';
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

  // @override
  // String toString() {
  //   return "$eventLocation";
  // }
  //NewsType : 1 = Joinable Event, 2 = Normal Status Update, 3 = Event Annoucement

  // factory Event.creatEvent(dynamic objek)
  // {
  // return Event(
  // // sample=  id: objek['id'], nama: objek['first_name'] + ' ' + objek['last_name']);
  // eventID: objek
  // );
  // }
}
