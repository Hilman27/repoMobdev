import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/pages/eventpage/detail.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'dart:developer' as developer;

class FeedListWidget extends StatefulWidget {
  @override
  FeedListWidgetState createState() => FeedListWidgetState();
}

class FeedListWidgetState extends State<FeedListWidget> {
  List status = List<bool>.filled(0, true, growable: true);
  ScrollController scrollController;
  final feedbloc = FeedblocBloc();
  //final FeedBloc _feedBloc = FeedBloc();    
  //List<bool> status;

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
    //final newsfeedProvider = FeedProvider.of(context);    
    return BlocProvider(
        create: (BuildContext context) => feedbloc,        
          child: BlocBuilder <FeedblocBloc, FeedblocState>(
            //bloc: BlocProvider.of<FeedblocBloc>(context),
            builder: (context, state) {
                      return CustomScrollView(
                        controller: scrollController,
                        slivers: <Widget>[
                          SliverList(              
                            delegate: SliverChildBuilderDelegate(
                          (context,index) => NewsItem( index: index, 
                                                        onPressed: _statusToogle, 
                                                        statusCheck: statusCheck, 
                                                        initialize: initList, 
                                                        //feed: snapshot.data.elementAt(index),
                                                        //changeData: newsfeedProvider.changeNewContent,
                                                        //scrollingOnTap: scrollByIndex, 
                                                        ),
                          childCount: state.feeds.length
                            ),
                          )
                        ],          
                        );    
              }        
          )
       
    );
  }

  initList(int index){
    
    //status[index];
    //status.add(false);
    try {
      bool test = status[index];
    } catch (e) {
      status.add(true);
    }
  }

  _statusToogle(int index) {
    if (status[index] == null) {
      status[index] = false;
    } else {
      if (status[index] == false) {
        status[index] = true;
      } else
        status[index] = false;
      }
      else{if(status[index] == false){
       status[index] = true; 
      } else status[index] = false; 
      }     
   /*  for(int i =0; i<status.length; i++){
      developer.log("Index $i set to ${status[i]}");  
    } */
    
    //return true;
  }

  bool statusCheck(int index) {
    return status[index];
  }



  //Scroll Functions
  /* scrollByIndex(int index){
    print("ScrollTest");
    scrollTo(calcHeight());
  }

  scrollTo(double pixelHeight){
    scrollController.jumpTo(pixelHeight);
    //scrollController.animateTo(pixelHeight, curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  double calcHeight(){
    double height=0;
    double heightFac1= srcHeight();
    double heightFac2= tittleHead().fontSize + 5;
    for(int i=0; i<status.length; i++){
      if(status[i]){
        height+=heightFac1;
      }else {
        height+=heightFac2;
      }
    }
    return height;
  }

  double srcHeight(){//Search Height based on Width
    double width = MediaQuery.of(context).size.width;
    double height = 4/3*width;
    return height;
  } */

}

class NewsItem extends StatefulWidget{
  final ValueChanged<int> onPressed;  
  final ValueChanged<int> initialize;  
  final Function statusCheck;   
  //final ValueChanged<int> scrollingOnTap;   
  final int index;
  //final Feed feed;
  final Function changeData;
  

  const NewsItem( {Key key, 
                  @required this.index,                   
                  @required this.onPressed, 
                  @required this.initialize, 
                  @required this.statusCheck, 
                  //@required this.feed, 
                  this.changeData
                  //this.scrollingOnTap, 
                  }) : super(key: key);

  @override
  NewsItemState createState() => NewsItemState();
}

class NewsItemState extends State<NewsItem> {
  //GlobalKey _keyRed = GlobalKey();
  int _index;
  bool _expanded;
  Function(int) parentPress;
  Function(int) initialList;
  Function(int) expandCheck;
  Feed _feed;
  
  
  //Function(int) _scrollonTap;
  
  void initState(){
    
    _index = widget.index;
    _expanded = true;
    //_feed=widget.feed;
    //_scrollonTap = widget.scrollingOnTap;
    parentPress = widget.onPressed;
    //widget.initialize(_index);
    initialList = widget.initialize;
    expandCheck = widget.statusCheck;
    
    initialList(_index);
    super.initState();
    
    //developer.log("Check $_index and $_expanded Has been Initilaized");
    //developer.log("Check ${expandCheck(_index)}");
  }

  //Doesn't work. Delete Later
  /* _afterLayout(_){    
    _getPositions();
  }

  _getPositions() {
    try{
      final RenderBox renderBoxRed = _keyRed.currentContext.findRenderObject();
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of Red: $positionRed ");
    }catch(e){
      print("$e");
    }
    
  } */

  changeExpandCollapse(bool){
    widget.onPressed(_index);
  }

  bool checkCollapseState() {
    if (widget.statusCheck(_index) == null) {
      developer
          .log("Check Status = Not Null. It's ${widget.statusCheck(_index)}");
      return widget.statusCheck(_index);
    } else {
      developer
          .log("Check Status = Not Null. It's ${widget.statusCheck(_index)}");
      return true;
    }
  }

  checkExpandCollapse(bool input) {
    if (input == true) {
      if (expandCheck(_index) == false) {
        parentPress(_index);
      }
      developer.log("Index $_index Is expanded");
      //_scrollonTap(_index);
    }else if (input ==false){
      if(expandCheck(_index)==true){
        parentPress(_index);
      }
      developer.log("Index $_index Is Collapsed");
    } else
      developer.log("Index $_index ????");
  }

  @override
  Widget build(BuildContext context) {
    //widget.onPressed(index);
    
    _expanded = expandCheck(_index);    
    //WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    //print("Test for $_index Height ${context.size}");
    //developer.log("Index is at $_index and Expansion is $_expanded");    
    
    //var textTheme = Theme.of(context).textTheme.title; 
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PageDetailEvent(
                  index: _index,
                )));
      },
      child:BlocBuilder<FeedblocBloc, FeedblocState>(
            //bloc: BlocProvider.of<FeedblocBloc>(context),
            builder: (context, state) {
              return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),   
                      child: Column(
                        children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: putihMain,
                          child: CustomExpansionTile(           
                            onExpansionChanged: checkExpandCollapse,   //checkExpandCollapse(), 
                            initiallyExpanded: _expanded??true,//checkCollapseState(),
                            title: NewsUser(state.feeds.elementAt(_index)),      
                            //trailing: Icon(Icons.swap_calls),
                            children: <Widget>[                
                                //SizedBox(height: 100,),
                                AspectRatio(
                                  aspectRatio: 4/3,
                                  child: Stack(
                                    children: <Widget>[
                                      ImageContainer(state.feeds[_index], "assets/images/"+state.feeds[_index].event.imagePath+".png"),                               
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 10,
                                        child: NewsDetail(state.feeds[_index]),
                                      )                                              
                                  /* Positioned(
                                    right: 10,
                                    left: 10,
                                    top: 10,
                                    bottom: 10,
                                    child: Icon(Icons.image, size: 50,) */
                                        ],                          
                                      ),
                                ),
                              ],                                  
                          ),
                        ),
                        SizedBox(height: 5, 
                        child: Container(color: putihBack,),)
                        ],      
                      ),
                  );
            },
              
      )
    );
  }
    
  }
}

class NewsUser extends StatelessWidget{
  final Feed feed;  

  const NewsUser(this.feed, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      color: putihMain,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 3),
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dummyPicColor,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              child: 
              Text(feed.user.name, 
              style: tittleSmall(),
              maxLines: 1,
              textAlign: TextAlign.left,)
            ),
          ],
        ),                
        //Spacer(),
        Container(
          width: 146,
          alignment: Alignment.topRight,
          child: 
          Text(feed.event.eventName, 
          style: tittleHead(),
          maxLines: 1,
          textAlign: TextAlign.right,)
          ),
          //Spacer(),
          Container(
              width: 146,
              alignment: Alignment.topRight,
              child: Text(
                eventName,
                style: tittleHead(),
                maxLines: 1,
                textAlign: TextAlign.right,
              )),
        ],
      ),
    );
  }
}

class NewsDetail extends StatelessWidget{
  final Feed news;  
  const NewsDetail(this.news, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {    
    //FeedProvider        
    return Container(
      //width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: ,
        children: <Widget>[
          //SizedBox(width: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                // Row Kiri
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //SizedBox(width: 40,),
                  Container(
                    width: MediaQuery.of(context).size.width * 1 / 4,
                    child: Column(
                      children: <Widget>[
                        Text(
                          intDatesToString(news.event.edateTime.month),
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.left,
                        ),
                        Text(news.event.edateTime.day.toString()),
                      ],
                    ),
                  ),
                  //SizedBox(width : 20),
                  Container(
                      width: MediaQuery.of(context).size.width * 3 / 4 - 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            news.event.eventName,
                            style: feedTitle(),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                          SizedBox(height: 4),
                        ],
                      )),
                ],
              ),
            ),
          ),
          //SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //SizedBox(width: 40,),
                  Container(
                    width: MediaQuery.of(context).size.width * 1 / 4,
                    child: Icon(Icons.location_on, color: Colors.red),
                  ),
                  //SizedBox(width : 20),

                  Container(
                    width: MediaQuery.of(context).size.width * 3 / 4 - 10,
                    child: Text(
                      news.event.eventLocation,
                      style: feedLoc(),
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder <FeedblocBloc, FeedblocState>(
            //bloc: BlocProvider.of<FeedblocBloc>(context),
            builder: (context, state) {
                      return FlatButton(
                        onPressed:(){                  
                          //newsfeedProvider.addTest(news);
                          
                          print("Test adding ${news.event.eventName}");


                          /* print("To JSON");
                          
                          jsonstuff.changeNewContent(news.toJson());
                          //jsonStuff.writeMethod("Hello There");
                          //jsonstuff = JsonCRUD(news.toJson());
                          //print("Taken Directory : ${jsonstuff.dir.path}");
                          jsonstuff.printstuff();
                          print("Write to JSON ");
                          //jsonstuff.writeToJSON(); */
                        }, 
                        child: Text("Send to JSON"), 
                      );
            }
          )          
        ],
      ),
    );
  }
  
}

