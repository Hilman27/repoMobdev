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
  final FeedblocBloc feedbloc = FeedblocBloc(source); 
    
  //final FeedBloc _feedBloc = FeedBloc();    
  //List<bool> status;

  @override
  void initState() {    
    //feedbloc = FeedblocBloc.withData(source, initJSON());
    feedbloc.getFeeds();
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
    //final newsfeedProvider = FeedProvider.of(context);    
    /*return  FutureBuilder(
        //future: ,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.done){ */
          return StreamBuilder<List<Feed>>(
            stream: feedbloc.repoCalls.stream,
            builder: (context, snapshot) {
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
                                                          ),
                            childCount: state.feeds.length
                              ),
                            )
                          ],          
                          );              
                    /* return FutureBuilder(
                      future: state.fReadJson(source),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if(snapshot.connectionState == ConnectionState.done){
                          
                        } else {
                            return Center(child: CircularProgressIndicator());
                          }
                      },
                      ); */
                    }        
                )       
      );
            }
          );
        /* } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ); */
  }  
}

