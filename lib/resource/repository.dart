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
}