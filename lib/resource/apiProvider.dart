import 'package:religi_app/model/_model.dart';
//import 'package:dio/dio.dart';

class APIFeedRepository{
  final String _endpoint = "https://randomuser.me/api/";
  //final Dio _dio = Dio();

  Future<List<Feed>> getnewsFeed() async{
    
  }

  Future<List<Feed>> getDummyNewsFeed() async{
    print("Init DummyFeed");
    NewsFeed dummy = NewsFeed();
    List<Feed> dummyList = List<Feed>();
    for(int i=0; i< NewsFeed.dummyEvents.length; i++){
      dummyList.add(dummy.init(i));
    }
    return Future<List<Feed>>(()=>dummyList);
      //print("Init data $i untuk ${feeds.elementAt(i).event.eventName}");
  }

  Stream<List<Feed>> getStreamDummyNewsFeed() {
    print("Stream DummyFeed");
    NewsFeed dummy = NewsFeed();
    List<Feed> dummyList = List<Feed>();
    for(int i=0; i< NewsFeed.dummyEvents.length; i++){
      dummyList.add(dummy.init(i));
    }
    /* Iterable<List<Feed>> iterable = dummyList as Iterable<List<Feed>>;
    print("Itterable : ${iterable.elementAt(0)}"); */
    //return Stream.fromIterable(iterable);
    //return Stream.periodic(Duration(seconds: 1), (x) => dummyList).take(1);
    return Stream.value(dummyList);
  }

  Stream<List<Feed>> getBookmark() async*{
    JsonCRUD crud = JsonCRUD();
    await crud.reInit();
    Map<String,dynamic> readfromCrud = Map<String,dynamic>();
    Future.delayed(Duration(seconds: 1));
    readfromCrud=await crud.fReadJsonData(1);
    List<Map<String,dynamic>> testFeed = List<Map<String,dynamic>>();
    readfromCrud.forEach((key,value) => testFeed.add(value)); 
    List<Feed> feedListTest =List<Feed>();
    Feed dummyFeed;
    for(int i=0; i<testFeed.length;i++){
      dummyFeed = Feed.fromJson(testFeed[i]);
      feedListTest.add(dummyFeed);
      print("Data $i is ${feedListTest[i].event.eventName}");
    }
    yield feedListTest;
    //return Stream.value(feedListTest);


  }

  
  /* Future<UserResponse> getUser() async {
    try {
      Response response = await _dio.get(_endpoint);
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
  } */
}