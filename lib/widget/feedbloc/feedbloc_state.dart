import 'package:meta/meta.dart';
import 'package:religi_app/model/_model.dart';
import 'feedbloc_bloc.dart';
import 'dart:developer' as developer;

@immutable
abstract class FeedblocState {
  final List<Feed> feeds ;
  final JsonCRUD crud;
  final List<bool> status ;
  //final JsonCRUD cruds;    

  const FeedblocState(  {
    this.feeds, 
    this.crud,
    this.status,
    //Key key
    //@required this.cruds,    
  }) 
  : super();
  //const NewsUser(this.feed, {Key key}) : super(key: key);    

  /* void initialize(){
    feeds.clear();
  } */
  //Note : Initialize dilakukan di sub function (InitialFeedblocState)

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

  

  
  void pushCrud(){

  }

  void pullCrud(){

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

  //Json Functions
  void writeToJson(){
    //List<Map> dataToJson = List<Map>();
    Map<String,dynamic> tempDataToJSON = Map<String,dynamic>();
    for(int i=0; i<feeds.length;i++){      
      print("Making data no.$i.");
      tempDataToJSON = feeds.elementAt(i).toJson();
      crud.writeToFile("Feed_$i",tempDataToJSON);
      //dataToJson.add(tempDataToJSON);
            
      //print("Making data no.$i, creating ${dataToJson.elementAt(i).toString()}");
    }
    //crud.mapWriteToFile(tempDataToJSON);
    
  }

  void clearJson(){
    crud.clearJsonData();
  }

  void readJson(){
    Map<String, dynamic> tempMap = crud.readJsonData();
    print("Data check1 is ${tempMap.length}");
    //NewsFeed testFeed = NewsFeed.fromJson(tempMap);
    List<Map<String,dynamic>> testFeed = List<Map<String,dynamic>>();
    tempMap.forEach((key,value) => testFeed.add(value)); 
    print("Data check2 is ${testFeed.elementAt(0)}");
    print("Checking Test Feed ");    
    List<Feed> feedListTest =List<Feed>();
    Feed dummyFeed;
    for(int i=0; i<testFeed.length;i++){
      dummyFeed = Feed.fromJson(testFeed[i]);
      feedListTest.add(dummyFeed);
      print("Data $i is ${feedListTest[i].event.eventName}");
    }
    
  }
}
  
class InitialFeedblocState extends FeedblocState {
  final List<Feed> feeds = List<Feed>() ; //Variable dari FeedblocState perlu di deklarasikan di sini
  final JsonCRUD crud = JsonCRUD();
  final List<bool> status = List<bool>.filled(0, true, growable: true);
  InitialFeedblocState(){
    //List<Feed> initfeeds = List<Feed>();

    //Filling Dummies
    //addAllFeed(dummies());
    //addAll(initfeeds);
    NewsFeed dummy = NewsFeed();
    for(int i=0; i< NewsFeed.dummyEvents.length; i++){
      addFeed(dummy.init(i));
      print("Init data $i untuk ${feeds.elementAt(i).event.eventName}");
    }

    print("Init data Done!");    
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
  final JsonCRUD crud;
  final List<bool> status;

  ContinousFeedBlocState(this.feeds,this.crud, this.status);

  
}
