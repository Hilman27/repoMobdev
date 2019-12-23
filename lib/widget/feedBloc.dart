import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/widget/_widgets.dart';

class FeedBloc {
  final List<Feed> _feeds = List<Feed>();
  JsonCRUD cruds;

  FeedBloc() {
    _additionStreamController.stream.listen(_handleAddition);
    _removalStreamController.stream.listen(_handleRemoval);

    //Temp dummy. Delete this later.
    NewsFeed dummy = NewsFeed();
    for(int i=0; i< 6; i++){
      _feeds.add(dummy.init(i));
    }

    print("FeedBloc Init");

  }

//Fungsi untuk Status
  Feed getFeed (int index){
    return _feeds[index];
  }
  int getSize(){
    return _feeds.length;
  }
  List<Feed> getAll(){
    return _feeds;
  }
//Fungsi untuk JSON
  changeNewContent(Map<String, dynamic> newStuff){
    cruds.changeNewContent(newStuff);
  }

  String readNewContent(){
    return cruds.printstuff();
  }

  addTest(Feed stuff){
    _feeds.add(stuff);
    print("FeedBloc Add : ${stuff.event.eventName}");
  }


  _handleAddition(Feed item) {
    _itemsSubject.add(_feeds..add(item));
  }

  _handleRemoval(Feed item) {
    _itemsSubject.add(_feeds..remove(item));
  }

  void dispose(){
    _additionStreamController.close();
    _removalStreamController.close();
  }

  /**
   * Streams
   */

  /// Items
  Stream<List<Feed>> get items => _itemsSubject.stream;

  final _itemsSubject = BehaviorSubject<List<Feed>>();

  /**
   * Sinks
   */

  /// Addition
  Sink<Feed> get addition => _additionStreamController.sink;

  final _additionStreamController = StreamController<Feed>();

  /// Removal
  Sink<Feed> get removal => _removalStreamController.sink;

  final _removalStreamController = StreamController<Feed>();
}