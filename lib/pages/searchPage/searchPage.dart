import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(      
        body: NavBar(
              //topWords : "Search Page", 
              backgroundWidget : CallSearchPage(),
              pageIndex : 1),        
        );
  }
}

class CallSearchPage extends StatelessWidget{
  @override  
  Widget build(BuildContext context) {    
    return Container(
      color: putihBack,
      child: Container(
        alignment: Alignment.topCenter,
        child: FeedListWidgetSearch(headerTitle: "Search") 
        ),      
    );
  }
  
  
}

class FeedListWidgetSearch extends StatefulWidget {
  final headerTitle;

  const FeedListWidgetSearch({Key key, this.headerTitle}) : super(key: key);
  
  @override
  FeedListWidgetStateSearch createState() => FeedListWidgetStateSearch(headerTitle);
}

class FeedListWidgetStateSearch extends State<FeedListWidgetSearch> {
  List status = List<bool>.filled(0, true, growable: true);
  ScrollController scrollController;
  static int source=2;
  final feedbloc = FeedblocBloc(0);
  final String headerTitle;

  FeedListWidgetStateSearch(this.headerTitle);

  @override  
  void initState() {            
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
                return StreamBuilder(
                  stream: feedbloc.feedRepository.getBookmarkJson(),
                  builder: (context, AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                    return  
                    CustomScrollView(
                      controller: scrollController,
                      slivers: <Widget>[
                        SliverPersistentHeader(
                          delegate: SearchHeader(headerTitle)
                          ),
                        /* SliverAppBar(
                          title: Center(child: Text(headerTitle)),
                          backgroundColor: hijauMain,
                          automaticallyImplyLeading: false,
                        ),    */ 
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
                  );
                }
            )
    );
  }  
}

class SearchHeader extends SliverPersistentHeaderDelegate{
  final headerTittle;
  final TextEditingController keyInputController = TextEditingController();

  SearchHeader(this.headerTittle);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return 
    Container(
      color: hijauMain,
      child: Column(
        children: <Widget>[
          Center(child: Text(headerTittle)),
          Row(
                children: <Widget>[
                  TextField(
                    controller: keyInputController,
                  ),  
                  RaisedButton(
                    onPressed: () {                      
                      print(keyInputController.text);
                    },
                    child: Text('Submit'),
                  )          
                ]
            ),
          
        ],
      ),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 10.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
  
}