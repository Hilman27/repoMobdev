import 'package:flutter/material.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/widget/AppBar/appBar.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(        
    home: Scaffold(         
      body: NavBar(
          //topWords: "Bookmark",
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
      child: Container(
        alignment: Alignment.topCenter,
        child: FeedListWidgetBookmark(headerTitle: "Bookmark", /* FeedProvider(            
          feedBloc: _feedBloc,
          child: FeedListWidget()),  */
        ),    
      ),  
    );
  }
}


class FeedListWidgetBookmark extends StatefulWidget {
  final String headerTitle;

  const FeedListWidgetBookmark({Key key, this.headerTitle}) : super(key: key);
  
  @override
  FeedListWidgetBookmarkState createState() => FeedListWidgetBookmarkState(headerTitle);
}

class FeedListWidgetBookmarkState extends State<FeedListWidgetBookmark> {
  List status = List<bool>.filled(0, true, growable: true);
  ScrollController scrollController;
  static int source=1;
  //FeedblocBloc feedbloc;
  final FeedblocBloc feedbloc = FeedblocBloc(1); 
  final String headerTitle;

  FeedListWidgetBookmarkState(this.headerTitle);
    
  //final FeedBloc _feedBloc = FeedBloc();    
  //List<bool> status;

  @override
  void initState() {    
    //feedbloc = FeedblocBloc.withData(source, initJSON());
    //feedbloc.getFeeds();
    WidgetsBinding.instance.addPostFrameCallback((_)=> feedbloc.initFeedBloc());
    super.initState();        
  }

  @override
  void dispose() {
    feedbloc.close();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {    
          return BlocProvider(
                create: (BuildContext context) => feedbloc,        
                  child: BlocBuilder <FeedblocBloc, FeedblocState>(
                    //bloc: BlocProvider.of<FeedblocBloc>(context),
                    builder: (context, state) {                          
                      if(state is ContinousFeedBlocState){
                          return  
                          CustomScrollView(
                            controller: scrollController,
                            slivers: <Widget>[
                              SliverAppBar(
                          title: Text(headerTitle),
                          backgroundColor: hijauMain,
                        ),    
                        SliverPadding(
                          padding: EdgeInsets.all(4.0),
                          sliver: SliverSafeArea(
                          top :false,
                          right :true,
                          left :true,
                          minimum: EdgeInsets.only(bottom : 4.0,right :1.0,left : 1.0),
                          sliver: 
                          SliverList(              
                            delegate: SliverChildBuilderDelegate(
                          (context,index) => NewsItem( index: index,                                                               
                                                        ),
                          childCount: state.feeds.length
                            ),
                          ),
                        ),
                        )    
                            ],          
                          );   
                      }else {
                      return Center(child: CircularProgressIndicator());
                     }        
                    }
                  )
          );
  }  
}