import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/resource/_res.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

//enum FeedblocEvent {addFeedListEvent,remFeedListEvent}

class FeedblocBloc extends Bloc<FeedblocEvent, FeedblocState> {
  final int source;// Source 1 = Feed. Source 2 = Bookmark
  List<Feed> inputData;  
  StreamSubscription subscription ;
  FeedRepository feedRepository =FeedRepository();
  

  FeedblocBloc(this.source);

  //FeedblocBloc.withData( this.inputData);
  
  @override  
  FeedblocState get initialState => InitialFeedblocState(source);

  initFeedBloc(){
    subscription?.cancel();
    if(source==0){
      subscription = feedRepository.getStreamDummyNewsFeed().listen((onData)=>add(ReInitFeed(newFeed: onData)));
    } else if(source==1){
      subscription = feedRepository.getBookmarkJson().listen((onData)=>add(ReInitFeed(newFeed: onData)));
    }
  }
 

  @override
  Stream<FeedblocState> mapEventToState(
    FeedblocEvent event,
  ) async* {    
    
    if (event is AddFeedListEvent) {//Add Feed
      state.addFeed(event.newData);            
      print("Adding data : ${event.newData.event.eventName}");
      yield ContinousFeedBlocState(state.feeds,state.status,state.bookmarkedFeeds);
    } else if (event is RemFeedListEvent) {//Remove Feed
      state.removeFeed(event.remIndex);
      yield ContinousFeedBlocState(state.feeds,state.status,state.bookmarkedFeeds);

    }else if (event is InitExpansionStatus) {//Init Expansion Status
      state.initList(event.index);          
      yield ContinousFeedBlocState(state.feeds,state.status,state.bookmarkedFeeds);
    }else if (event is CheckExpansionCollapse) {//Check Expansion Collapse Status
      state.checkExpandCollapse(event.input,event.index);      
      yield ContinousFeedBlocState(state.feeds,state.status,state.bookmarkedFeeds);

    }else if (event is JsonWrite) {//Write to JSON
      state.writeToJson(event.feedInput);
      //state.crud.writeToJSON();    
      yield ContinousFeedBlocState(state.feeds,state.status,state.bookmarkedFeeds);
    }else if (event is JsonRead) {//Read from JSON
      state.readJson(1);
      yield ContinousFeedBlocState(state.feeds,state.status,state.bookmarkedFeeds);
    }    

    if (event is JsonStart) {
      subscription?.cancel();
      if(source==0){
        subscription = feedRepository.getStreamDummyNewsFeed().listen((onData){
        print("DataGet : $onData");
        subscription?.cancel();
        add(ReInitFeed(newFeed: onData));
        });//ticker.tick().listen((tick) => add(Tick(tick)));
      }else if(source==1){
        subscription = feedRepository.getBookmarkJson().listen((onData){
        print("DataGet : $onData");
        add(ReInitFeed(newFeed: onData));
        });//ticker.tick().listen((tick) => add(Tick(tick)));
      }
      
    }
    if (event is ReInitFeed) {
      print("ReInit Feed");
      //event.newBookmarkFeed??state.bookmarkedFeeds;
      yield ContinousFeedBlocState(
        event.newFeed??state.feeds,
        state.status,
        event.newBookmarkFeed??state.bookmarkedFeeds);
    }
  }
}
