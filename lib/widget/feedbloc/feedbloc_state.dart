import 'dart:async';
import 'package:meta/meta.dart';
import 'package:religi_app/model/_model.dart';
import 'dart:developer' as developer;

@immutable
abstract class FeedblocState {
  final List<Feed> feeds ;
  final List<Feed> bookmarkedFeeds ;
  //final JsonCRUD crud;
  final List<bool> status ;
  
  
  //final JsonCRUD cruds;    

  const FeedblocState(  {
    this.feeds, 
    //this.crud,
    this.status,
    this.bookmarkedFeeds,
    //Key key
    //@required this.cruds,    
  }) 
  : super();
  
  //const NewsUser(this.feed, {Key key}) : super(key: key);    

  /* void initialize(){
    feeds.clear();
  } */
  //Note : Initialize dilakukan di sub function (InitialFeedblocState)

  Stream<List<Feed>> feedsStream() async*{
    var temp = feeds;
    yield temp;
  }

  void addFeed(Feed newFeed){
    initStatusList();
    feeds.add(newFeed);
    //initStatusList();
  }

  void removeFeed(int index){
    remStatusExpand(index);
    feeds.removeAt(index);
    //remStatusExpand(index);
  }

  Feed getFeed(int index){
    return feeds[index];
  }

  overwriteAll(List<Feed> newData){
    feeds.clear();
    feeds.addAll(newData);
  }

  List<Feed> getAll(){
    return feeds;
  }

  void addAllFeed(List<Feed> newData){
    //feeds.clear();
    feeds.addAll(newData);
  }

  

  

  //Functions for status(Feed Expansion)
  initList(int index){    
    try {
      bool test = status[index];
    } catch (e) {
      status.add(true);
    }
  }

  initStatusList(){
    status.add(true);
  }

  initListbyFeeds(){
    for(int i=0;i<feeds.length;i++){
      initList(i);
    }
  }

  statusToogle(int index) {
    if (status[index] == null) {
      status[index] = false;
    } else {
      if (status[index] == false) {
        status[index] = true;
      } else
        status[index] = false;
      }
      
   /*  for(int i =0; i<status.length; i++){
      developer.log("Index $i set to ${status[i]}");  
    } */
    
    //return true;
  }

  bool statusCheck(int index) {
    return status[index];
  }

  remStatusExpand(int index){
    status.removeAt(index);
  }

  checkExpandCollapse(bool input, int index) {
    if (input == true) {
      if (status.elementAt(index) == false) {
        statusToogle(index);
      }
      developer.log("Index $index Is expanded");
      //_scrollonTap(_index);
    }else if (input ==false){
      if(status.elementAt(index)==true){
        statusToogle(index);
      }
      developer.log("Index $index Is Collapsed");
    } else
      developer.log("Index $index ????");
  }

  bool checkBookmark(int index){
    bool result = false;
    bookmarkedFeeds.forEach((feed){
      if(feed.event.eventID == index) {result = true;}
      });
    return result;

  }  
  
}
  
class InitialFeedblocState extends FeedblocState {
  final int source;  
  final List<Feed> feeds = List<Feed>() ; //Variable dari FeedblocState perlu di deklarasikan di sini
  final Map<int, Feed> bookmarkFeeds = Map<int, Feed>() ; //Untuk simpan FeedBlock  
  final List<bool> status = List<bool>.filled(0, true, growable: true);     
  final List<Feed> bookmarkedFeeds = List<Feed>() ;
  //final JsonCRUD crud = JsonCRUD();
    
  InitialFeedblocState(this.source){
    if(source==0){

      /* NewsFeed dummy = NewsFeed();
      for(int i=0; i< NewsFeed.dummyEvents.length; i++){
      addFeed(dummy.init(i));
      //print("Init data $i untuk ${feeds.elementAt(i).event.eventName}");
    }
    print("Init data Done!");   */

    } else if(source==1){       
      print("Set to Bookmark");                        
    }
      
  }   

  InitialFeedblocState.withData(this.source,List<Feed> input){
    feeds.addAll(input);
  }

  List<Feed> dummies() {
    List<Feed> dummyfeeds = List<Feed>();
    NewsFeed dummy = NewsFeed();
    for(int i=0; i< NewsFeed.dummyEvents.length; i++){
      dummyfeeds.add(dummy.init(i));
      print("Init data $i untuk ${dummyfeeds.elementAt(i).event.eventName}");
    }

    return dummyfeeds;  
  }

  


}

class ContinousFeedBlocState extends FeedblocState{
  final List<Feed> feeds ; //Variable dari FeedblocState perlu dideklarasikan di sini
  //final JsonCRUD crud = JsonCRUD();
  final List<bool> status;
  final List<Feed> bookmarkedFeeds;

  ContinousFeedBlocState(this.feeds, this.status, this.bookmarkedFeeds){
    initListbyFeeds();
  }

  
}
