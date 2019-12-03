import 'package:religi_app/Models/LayarUtama/feed.dart';

class Feed {
  User user;  
  Event event; 
  Feed(this.user,this.event);

  User get fUser => user;
  Event get fEvent => event;

}

class NewsFeed {  
  List<User> dummyUsers = [
    User("User1", "Link to Profile1"),
    User("User2", "Link to Profile2"),
    User("User3", "Link to Profile3"),    
  ];

  List<Event> dummyEvents = [
    Event(01, "/Path to Image1", "Pengajian Ustad Z" , "Ayo Gabung Sama Event Ustad Z ini!", 1),
    Event(02, "/Path to Image2", "Pengajian Ustadza Y" , "Ayo Gabung Sama Event Ustadza Y ini!", 1),
    Event(03, "/Path to Image3", "Pengajian Ustad X" , "Ayo Gabung Sama Event Ustad X ini!", 1),
  ];

  Feed getByID(int id) => Feed(dummyUsers[id % dummyUsers.length], dummyEvents[id % dummyEvents.length]);

  Feed init(int id){
    return getByID(id);
  }
  
}