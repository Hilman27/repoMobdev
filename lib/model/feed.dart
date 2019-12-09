//import 'package:religi_app/Model/LayarUtama/feed.dart';

import 'dart:core';

class Feed {
  User user;  
  Event event; 
  Feed(this.user,this.event);

  User get fUser => user;
  Event get fEvent => event;

}

class NewsFeed {  
  static String lorepIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  static List<User> dummyUsers = [
    User("User1", "Link to Profile1"),
    User("User2", "Link to Profile2"),
    User("User3", "Link to Profile3"),    
    User(lorepIpsum, lorepIpsum),    
  ];

  static List<Event> dummyEvents = [
    Event(01, "image_1", "Pengajian Ustad Z" , "Surabaya","Ayo Gabung Sama Event Ustad Z ini!", dateTimes[0],1),
    Event(02, "image_2", "Pengajian Ustadza Y" ,"Malang", "Ayo Gabung Sama Event Ustadza Y ini!", dateTimes[1], 1),
    Event(03, "image_3", "Pengajian Ustad X" , "Jakarta", "Ayo Gabung Sama Event Ustad X ini!", dateTimes[2],1),
    Event(04, "image_4", "Pengajian Ustad" + lorepIpsum , lorepIpsum, lorepIpsum, dateTimes[3], 1),
  ];

  static List<DateTime> dateTimes = [
    DateTime(2019,11,27,12,12,12), //27-11-2019 | 12:12:12
    DateTime(2019,11,27,03,04,00), //27-11-2019 | 03:04:00
    DateTime(2018,6,20,0,0,0), //20-6-2018   | 0:0:0
    DateTime(2019,12,31,23,59,59), //31-12-2019 | 23:59:59
  ];

  Feed getByID(int id) => Feed(dummyUsers[id % dummyUsers.length], dummyEvents[id % dummyEvents.length]);

  //Feed getByID(int id) => Feed(dummyUsers[id], dummyEvents[id]);

  Feed init(int id){
    return getByID(id);
  }
  
}

class User{
  String name;
  String link;
  User (this.name, this.link);
}

class Event{
  int eventID;
  String imagePath;
  String eventName;
  String eventLocation;
  String caption;
  int newsType;  
  DateTime edateTime;
  Event (this.eventID, this.imagePath, this.eventName, this.eventLocation, this.caption,this.edateTime, this.newsType);  

  //NewsType : 1 = Joinable Event, 2 = Normal Status Update, 3 = Event Annoucement
}



