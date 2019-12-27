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