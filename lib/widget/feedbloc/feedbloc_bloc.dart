import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:religi_app/model/_model.dart';
import './bloc.dart';

//enum FeedblocEvent {addFeedListEvent,remFeedListEvent}

class FeedblocBloc extends Bloc<FeedblocEvent, FeedblocState> {
  
  
  @override
  //FeedblocState get initialState => InitialFeedblocState();
  FeedblocState get initialState => InitialFeedblocState();

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
    }
    else if (event is GetFeedListEvent) {
      yield InitialFeedblocState();
    }
  }
}
