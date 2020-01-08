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
  final FeedRepository feedRepository = FeedRepository();
  final BehaviorSubject<List<Feed>> prevRepos =
      BehaviorSubject<List<Feed>>();

  

  FeedblocBloc(this.source);

  FeedblocBloc.withData(this.source, this.inputData);
  
  @override
  //FeedblocState get initialState => InitialFeedblocState();
  FeedblocState get initialState => InitialFeedblocState(source);
  /* {
    if(inputData.isEmpty){
      return InitialFeedblocState(source);
    } else {
      return InitialFeedblocState.withData(source,inputData);
    }
    
  }
   */

  getFeeds() async {
    List<Feed> feeds = await feedRepository.getDummyNewsFeed();
    prevRepos.sink.add(feeds);
  }

  dispose() {
    prevRepos.close();
  }

  BehaviorSubject<List<Feed>> get repoCalls => prevRepos;


  @override
  Stream<FeedblocState> mapEventToState(
    FeedblocEvent event,
  ) async* {    
    
    if (event is AddFeedListEvent) {//Add Feed
      state.addFeed(event.newData);            
      print("Adding data : ${event.newData.event.eventName}");
      yield ContinousFeedBlocState(state.feeds,state.crud,state.status);
    } else if (event is RemFeedListEvent) {//Remove Feed
      state.removeFeed(event.remIndex);
      yield ContinousFeedBlocState(state.feeds,state.crud,state.status);

    }else if (event is InitExpansionStatus) {//Init Expansion Status
      state.initList(event.index);          
      yield ContinousFeedBlocState(state.feeds,state.crud,state.status);
    }else if (event is CheckExpansionCollapse) {//Check Expansion Collapse Status
      state.checkExpandCollapse(event.input,event.index);      
      yield ContinousFeedBlocState(state.feeds,state.crud,state.status);

    }else if (event is JsonWrite) {//Write to JSON
      state.writeToJson(event.feedInput);
      //state.crud.writeToJSON();    
      yield ContinousFeedBlocState(state.feeds,state.crud,state.status);
    }else if (event is JsonRead) {//Read from JSON
      state.readJson(1);
      yield ContinousFeedBlocState(state.feeds,state.crud,state.status);
    }else if (event is JsonClear) {//Clear from JSON
       state.clearJson(1);  
      yield ContinousFeedBlocState(state.feeds,state.crud,state.status);
    }
    else if (event is GetFeedListEvent) {// Don't Use. Scrapped
      yield InitialFeedblocState(source);
    }
  }
}
