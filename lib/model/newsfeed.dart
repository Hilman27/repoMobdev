import 'package:json_annotation/json_annotation.dart';

import '_model.dart';

//part 'newsfeed.g.dart';

//@JsonSerializable(explicitToJson: true)
class NewsFeed {
  // List<Feed> feedList = List<Feed>();
  NewsFeed();

  /* NewsFeed.fromNewsFeed(NewsFeed newData){
    this.feedList=newData.feedList;
  } */

  static String lorepIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  static List<User> dummyUsers = [
    User(name: 'Andi Prayogo', link: 'link to profil'),
    User(name: 'Bayu Aji', link: 'link to profil'),
    User(name: 'Candra Kirana', link: 'link to profil'),
    User(name: 'Dedi Nugroho', link: 'link to profil'),
    User(name: 'Edi Baskoro', link: 'link to profil'),
  ];

  static List<Event> dummyEvents = [
    Event(
        eventID: 01,
        eventName: 'Pengajian rutin',
        caption: 'Pengajian bersama dengan isinya',
        imagePath: 'image_3',
        edateTime: dateTimes[0],
        eventLocation: 'Surabaya',
        newsType: 1),
    Event(
        eventID: 02,
        eventName: 'Pengajian malam jumat',
        caption: 'Pengajian bersama dengan isinya',
        imagePath: 'image_4',
        edateTime: dateTimes[1],
        eventLocation: 'Jakarta',
        newsType: 1),
    Event(
        eventID: 03,
        eventName: 'Tabligh akbar',
        caption: 'Pengajian bersama dengan isinya',
        imagePath: 'image_3',
        edateTime: dateTimes[0],
        eventLocation: 'Solo',
        newsType: 1),
    Event(
        eventID: 04,
        eventName: 'Shalat id',
        caption: 'Pengajian bersama dengan isinya',
        imagePath: 'image_4',
        edateTime: dateTimes[2],
        eventLocation: 'Jogja',
        newsType: 1),
    Event(
        eventID: 05,
        eventName: 'Pengajian Haji ',
        caption: 'Pengajian bersama dengan isinya',
        imagePath: 'image_1',
        edateTime: dateTimes[3],
        eventLocation: 'Surabaya',
        newsType: 1),
    Event(
        eventID: 06,
        eventName: 'Pengajian ustad H',
        caption: 'Pengajian bersama dengan isinya',
        imagePath: 'image_2',
        edateTime: dateTimes[0],
        eventLocation: 'Surabaya',
        newsType: 1),
    Event(
        eventID: 07,
        eventName: 'pengajian ustad H',
        caption: 'pengajian bersama dengan isinya',
        imagePath: 'image_2',
        edateTime: dateTimes[0],
        eventLocation: 'Surabaya',
        newsType: 1),
    Event(
        eventID: 08,
        eventName: 'Pengajian ustad H',
        caption: 'Pengajian bersama dengan isinya',
        imagePath: 'image_2',
        edateTime: dateTimes[0],
        eventLocation: 'Surabaya',
        newsType: 1),
    Event(
        eventID: 09,
        eventName: 'Pengajian ustad H',
        caption: 'Pengajian bersama dengan isinya',
        imagePath: 'image_1',
        edateTime: dateTimes[0],
        eventLocation: 'Surabaya',
        newsType: 1),
    Event(
        eventID: 10,
        eventName: 'Pengajian ustad wwww',
        caption: 'Pengajian bersama dengan isinya',
        edateTime: dateTimes[0],
        imagePath: 'placeholderImage',
        eventLocation: 'Surabaya',
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

  

  /* factory NewsFeed.fromJson(Map<String, dynamic> json) => _$NewsFeedFromJson(json);
  Map<String, dynamic> toJson() => _$NewsFeedToJson(this); */
}
