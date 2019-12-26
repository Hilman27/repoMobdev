import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:religi_app/model/_model.dart';
import './bloc.dart';

class FeedblocBloc extends Bloc<FeedblocEvent, FeedblocState> {
  void onIncrement() {
    add(GetFeedListEvent());
  }

  void onDecrement() {
    add(GiveFeedListEvent());
  }
  
  @override
  //FeedblocState get initialState => InitialFeedblocState();
  FeedblocState get initialState => InitialFeedblocState(List<Feed>());

  @override
  Stream<FeedblocState> mapEventToState(
    FeedblocEvent event,
  ) async* {
    final List<Feed> _feeds = List<Feed>();
    JsonCRUD cruds;
    
    if (event is GiveFeedListEvent) {
      yield InitialFeedblocState(_feeds);
    } else if (event is GetFeedListEvent) {
      yield InitialFeedblocState(_feeds);
    }
  }
}
