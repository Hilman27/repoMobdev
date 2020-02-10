import 'package:religi_app/model/_model.dart';
import 'package:religi_app/resource/apiProvider.dart';

class FeedRepository{
  APIFeedRepository _apiProvider = APIFeedRepository();

  Future<List<Feed>> getnewsFeed(){
    return _apiProvider.getnewsFeed();
  }

  Future<List<Feed>> getDummyNewsFeed(){
    return _apiProvider.getDummyNewsFeed();
  }

  Stream<List<Feed>> getStreamDummyNewsFeed() {
    return _apiProvider.getStreamDummyNewsFeed();
    //return Stream.periodic(Duration(seconds: 1), (x) => x).take(10);
  }

  Stream<List<Feed>> getBookmarkJson() {
    return _apiProvider.getBookmark();
    //return Stream.periodic(Duration(seconds: 1), (x) => x).take(10);
  }

  Future addToJson(Feed input, int source) {
    return _apiProvider.writeToJson(input, source);
    //return Stream.periodic(Duration(seconds: 1), (x) => x).take(10);
  }

  Future removeFromJson(Feed input, int source) {
    return _apiProvider.removeFromJson(input, source);
    //return Stream.periodic(Duration(seconds: 1), (x) => x).take(10);
  }
}