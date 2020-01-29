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

  FeedblocBloc.withData(this.source, this.inputData);
  
  @override  
  FeedblocState get initialState => InitialFeedblocState(source);

  initFeedBloc(){
    subscription?.cancel();
    subscription = feedRepository.getStreamDummyNewsFeed().listen((onData)=>add(ReInit(onData)));
  }
 

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
    }
    else if (event is GetFeedListEvent) {// Don't Use. Scrapped
      yield InitialFeedblocState(source);
    }

    if (event is JsonStart) {
      subscription?.cancel();
      subscription = feedRepository.getStreamDummyNewsFeed().listen((onData){
        print("DataGet : $onData");
        add(ReInit(onData));
        });//ticker.tick().listen((tick) => add(Tick(tick)));
    }
    if (event is ReInit) {
      print("ReInit");
      yield ContinousFeedBlocState(event.newFeed,state.crud,state.status);
    }
  }
}
