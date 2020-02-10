import 'package:meta/meta.dart';
import 'package:religi_app/model/_model.dart';

//enum FeedblocEvent { addFeedListEvent, remFeedListEvent }
@immutable

abstract class FeedblocEvent {}

class GetFeedListEvent extends FeedblocEvent {}
class AddFeedListEvent extends FeedblocEvent {  
  final Feed newData;

  AddFeedListEvent(this.newData);

}
class RemFeedListEvent extends FeedblocEvent {
  final int remIndex;

  RemFeedListEvent(this.remIndex);
}
class PrintFeed extends FeedblocEvent {
  
} 

class InitExpansionStatus extends FeedblocEvent{
  final int index;

  InitExpansionStatus(this.index);
  
}
class CheckExpansionCollapse extends FeedblocEvent{
  final bool input;
  final int index;

  CheckExpansionCollapse(this.input, this.index);
}

class JsonWrite extends FeedblocEvent{
  final Feed feedInput;
  final int source;

  JsonWrite(this.feedInput, this.source);
}

class JsonRemove extends FeedblocEvent{  
  final Feed feedInput;
  final int source;

  JsonRemove(this.feedInput,this.source);
}

class ReInitFeed extends FeedblocEvent{
  final List<Feed> newFeed;
  final List<Feed> newBookmarkFeed;

  ReInitFeed({this.newFeed,this.newBookmarkFeed});
  
  
}

class ReInitBookmark extends FeedblocEvent{
  final List<Feed> newFeed;

  ReInitBookmark(this.newFeed);
  
  
}

class JsonStart extends FeedblocEvent{
  
}

class JsonRead extends FeedblocEvent{
  
}

