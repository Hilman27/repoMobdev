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
    User("User4", "Link to Profile4"),    
  ];

  List<Event> dummyEvents = [
    Event(01, "/Path to Image1", "Pengajian Ustad Z" , "Ayo Gabung Sama Event Ustad Z ini!", 1),
    Event(02, "/Path to Image2", "Pengajian Ustadza Y" , "Ayo Gabung Sama Event Ustadza Y ini!", 1),
    Event(03, "/Path to Image3", "Pengajian Ustad X" , "Ayo Gabung Sama Event Ustad X ini!", 1),
    Event(04, "/Path to Image3", "Pengajian Ustad Lorep" , "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 1),
  ];

  Feed getByID(int id) => Feed(dummyUsers[id % dummyUsers.length], dummyEvents[id % dummyEvents.length]);

  Feed init(int id){
    return getByID(id);
  }
  
}