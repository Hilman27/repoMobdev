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