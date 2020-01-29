import 'dart:async';
import 'dart:core';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/pages/eventpage/detail.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'dart:developer' as developer;

class FeedListWidgetBookmark extends StatefulWidget {
  
  @override
  FeedListWidgetBookmarkState createState() => FeedListWidgetBookmarkState();
}

class FeedListWidgetBookmarkState extends State<FeedListWidgetBookmark> {
  List status = List<bool>.filled(0, true, growable: true);
  ScrollController scrollController;
  static int source=1;
  //FeedblocBloc feedbloc;
  final FeedblocBloc feedbloc = FeedblocBloc(1); 
    
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

  List<Feed> initJSON(){//Scrapped
    JsonCRUD crud = JsonCRUD();
    Map<String, dynamic> tempMap = crud.readJsonData(source);
    List<Map<String,dynamic>> testFeed = List<Map<String,dynamic>>();
    tempMap.forEach((key,value) => testFeed.add(value)); 
    //print("Data check2 is ${testFeed.last}");
    //print("Checking Test Feed ");    
    List<Feed> feedListTest =List<Feed>();
    Feed dummyFeed;
    for(int i=0; i<testFeed.length;i++){
      dummyFeed = Feed.fromJson(testFeed[i]);
      feedListTest.add(dummyFeed);
      print("Data $i is ${feedListTest[i].event.eventName}");
    }
    return feedListTest;
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
                              SliverList(              
                                delegate: SliverChildBuilderDelegate(
                              (context,index) => NewsItem( index: index,                                                               
                                                            ),
                              childCount: state.feeds.length
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

