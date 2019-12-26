import 'package:meta/meta.dart';
import 'package:religi_app/model/_model.dart';
import 'feedbloc_bloc.dart';

@immutable
abstract class FeedblocState {
  final List<Feed> feeds ;
  //final JsonCRUD cruds;    

  const FeedblocState({
    this.feeds, 
    //Key key
    //@required this.cruds,    
  }) 
  : super();
  //const NewsUser(this.feed, {Key key}) : super(key: key);    

  void initialize(){
    feeds.clear();
  }

  void addFeed(Feed newFeed){
    feeds.add(newFeed);
  }

  void removeFeed(int index){
    feeds.removeAt(index);
  }

  Feed getFeed(int index){
    return feeds[index];
  }

  List<Feed> getAll(){
    return feeds;
  }

  void addAll(List<Feed> newData){
    feeds.clear();
    feeds.addAll(newData);
  }
}
  
class InitialFeedblocState extends FeedblocState {
  final List<Feed> feeds ;
  InitialFeedblocState(this.feeds){
    List<Feed> initfeeds = List<Feed>();
    initfeeds.addAll(dummies());
    addAll(initfeeds);
    print("Init data feeds untuk ${feeds[1].event.eventName}");    
  }   

  List<Feed> dummies() {
    List<Feed> dummyfeeds = List<Feed>();
    NewsFeed dummy = NewsFeed();
    for(int i=0; i< 6; i++){
      dummyfeeds.add(dummy.init(i));
      print("Init data $i untuk ${dummyfeeds.elementAt(i).event.eventName}");
    }

    return dummyfeeds;  
  }


}

class ContinousFeedBlocState extends FeedblocState{
  
}
