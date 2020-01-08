import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/pages/searchPage/searchPage.dart';
import 'package:religi_app/widget/AppBar/appBar.dart';
import 'package:religi_app/widget/_widgets.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(        
      home: Scaffold(         
        body: NavBar(
            topWords: "Bookmark",
            backgroundWidget: CallBookmarkNewsFeed(),
            pageIndex: 2),
      ),
    );
  }
}

class CallBookmarkNewsFeed extends StatelessWidget {    
  @override
  Widget build(BuildContext context) {    
    return Container(
      color: putihBack,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: FeedListWidgetBookmark() /* FeedProvider(            
            feedBloc: _feedBloc,
            child: FeedListWidget()),  */
          ),
        ),      
    );
  }
}
