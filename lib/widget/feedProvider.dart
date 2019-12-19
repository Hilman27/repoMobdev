import 'package:flutter/material.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'package:religi_app/model/_model.dart';

class FeedProvider extends InheritedWidget{
  final FeedBloc feedBloc;

  //FeedProvider(this.feedBloc);
  FeedProvider({
    Key key,
    @required this.feedBloc,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static FeedBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(FeedProvider) as FeedProvider)
          .feedBloc;
  
}