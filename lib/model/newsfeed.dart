import '_model.dart';

class NewsFeed {
  static String lorepIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  static List<User> dummyUsers = [
    User("User1", "Link to Profile1"),
    User("User2", "Link to Profile2"),
    User("User3", "Link to Profile3"),
    User(lorepIpsum, lorepIpsum),
  ];

  static List<Event> dummyEvents = [
    Event(
        eventID: 01,
        eventName: 'pengajian ustadz',
        caption: 'pengajian bersama dengan isinya',
        imagePath: 'image_3',
        edateTime: dateTimes[0],
        eventLocation: 'surabaya',
        newsType: 1),
    Event(
        eventID: 02,
        eventName: 'pengajian ustadz',
        caption: 'pengajian bersama dengan isinya',
        imagePath: 'image_4',
        edateTime: dateTimes[0],
        eventLocation: 'jakarta',
        newsType: 1),
    Event(
        eventID: 03,
        eventName: 'pengajian ustadz',
        caption: 'pengajian bersama dengan isinya',
        imagePath: 'image_3',
        edateTime: dateTimes[0],
        eventLocation: 'solo',
        newsType: 1),
    Event(
        eventID: 04,
        eventName: 'pengajian ustadz',
        caption: 'pengajian bersama dengan isinya',
        imagePath: 'image_4',
        edateTime: dateTimes[0],
        eventLocation: 'jogja',
        newsType: 1),
    Event(
        eventID: 05,
        eventName: 'pengajian ustadz',
        caption: 'pengajian bersama dengan isinya',
        imagePath: 'image_1',
        edateTime: dateTimes[0],
        eventLocation: 'surabaya',
        newsType: 1),
    Event(
        eventID: 06,
        eventName: 'pengajian ustadz',
        caption: 'pengajian bersama dengan isinya',
        imagePath: 'image_2',
        edateTime: dateTimes[0],
        eventLocation: 'surabaya',
        newsType: 1),
  ];

  static List<DateTime> dateTimes = [
    DateTime(2019, 11, 27, 12, 12, 12), //27-11-2019 | 12:12:12
    DateTime(2019, 11, 27, 03, 04, 00), //27-11-2019 | 03:04:00
    DateTime(2018, 6, 20, 0, 0, 0), //20-6-2018   | 0:0:0
    DateTime(2019, 12, 31, 23, 59, 59), //31-12-2019 | 23:59:59
  ];

  Feed getByID(int id) => Feed(
      dummyUsers[id % dummyUsers.length], dummyEvents[id % dummyEvents.length]);

  //Feed getByID(int id) => Feed(dummyUsers[id], dummyEvents[id]);

  Feed init(int id) {
    return getByID(id);
  }
}
