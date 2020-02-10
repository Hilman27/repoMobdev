import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/pages/eventpage/detail.dart';
import 'package:religi_app/widget/_widgets.dart';

class FeedListWidget extends StatefulWidget {
  final headerTitle;

  const FeedListWidget({Key key, this.headerTitle}) : super(key: key);
  
  @override
  FeedListWidgetState createState() => FeedListWidgetState(headerTitle);
}

class FeedListWidgetState extends State<FeedListWidget> {
  List status = List<bool>.filled(0, true, growable: true);
  ScrollController scrollController;
  static int source=0;
  final feedbloc = FeedblocBloc(0);
  final String headerTitle;

  FeedListWidgetState(this.headerTitle);

  @override  
  void initState() {        
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

class NewsItem extends StatefulWidget{ 
  final int index;
  final Function changeData;
  

  const NewsItem( {Key key, 
                  @required this.index,                   
                  this.changeData
                  }) : super(key: key);

  @override
  NewsItemState createState() => NewsItemState();
}

class NewsItemState extends State<NewsItem> {  
  int _index;  
  Function(int) expandCheck;    
  
  void initState(){    
    _index = widget.index;            
    //state.initList(_index);
    //BlocProvider.of<FeedblocBloc>(context).add(InitExpansionStatus(_index));    
    super.initState();        
  }
  
  @override
  Widget build(BuildContext context) {    
    return BlocBuilder<FeedblocBloc, FeedblocState>(            
            builder: (context, state) {
              return GestureDetector(
                
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PageDetailEvent(
                      inputNews: state.feeds.elementAt(_index),
                    )));
                
              },
                child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),   
                        child: Column(
                          children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: putihMain,
                            child: CustomExpansionTile(           
                              onExpansionChanged: (input) => BlocProvider.of<FeedblocBloc>(context).add(CheckExpansionCollapse(input, _index)),   //checkExpandCollapse(), 
                              initiallyExpanded: state.status.elementAt(_index),//checkCollapseState(),
                              title: NewsUser(state.feeds.elementAt(_index)),      
                              //trailing: Icon(Icons.swap_calls),
                              children: <Widget>[                
                                  //SizedBox(height: 100,),
                                  AspectRatio(
                                    aspectRatio: 4/3,
                                    child: Stack(
                                      children: <Widget>[
                                        ImageContainer(state.feeds.elementAt(_index), "assets/images/"+state.feeds.elementAt(_index).event.imagePath+".png"),                               
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 10,
                                          child: NewsDetail(state.feeds.elementAt(_index)),
                                        )                                                                                  
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
                    ),
              );
            },
              
      )
    ;
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
              Container(
              width: 100,
              child: 
              Text(feed.user.name, 
              style: tittleSmall(),
              maxLines: 1,
              textAlign: TextAlign.left,)
            ),
            ]
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
      //color: Color(0XFF00ffff),
      //width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: ,
        children: <Widget>[
          //SizedBox(width: 30,),
          Container(
            //color: Color(0XFFff0066),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  // Row Kiri
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //SizedBox(width: 40,),
                    Container(
                      //color: Color(0XFFffff66),
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
                      //color:  Color(0XFF99ff33),
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
          ),
          //SizedBox(width: 10,),
          Container(
            //color: Color(0XFF3366ff),
            child: Padding(
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
          ),          
          LopeButton(news),  
        ],
      ),
    );
  }
  
}

class LopeButton extends StatefulWidget{
  final Feed news;

  const LopeButton(this.news,{Key key, }) : super(key: key);
  @override
  LopeButtonState createState() => LopeButtonState();

}

class LopeButtonState extends State<LopeButton> with SingleTickerProviderStateMixin{
  Feed news;
  Animation<double> sizeAnimation;
  AnimationController controller;
  double animWidth;

  @override
  void initState() {
    news = widget.news;
    controller = AnimationController(duration: Duration(milliseconds: 500),vsync: this);
    sizeAnimation = Tween<double>(begin: 1, end: 2).animate(controller)..addListener(
      (){}
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(           
        duration: Duration(milliseconds: 500) ,
        //color: Colors.red,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder <FeedblocBloc, FeedblocState>(
          //bloc: BlocProvider.of<FeedblocBloc>(context),
          //Posible Icon : cloud done and cloud queue | Favorite and Favorite Border
          builder: (context, state) {
                    if(state.checkBookmark(news.event.eventID)){
                      return IconButton(icon: Icon(Icons.favorite, color: hijauMain,), 
                      onPressed:(){                                            
                        BlocProvider.of<FeedblocBloc>(context)                            
                          .add(JsonRemove(news,1));   
                        setState(() {
                          
                        });
                      }              
                      );                            
                    }else {
                      return IconButton(icon: Icon(Icons.favorite_border, color: hijauMain,), 
                      onPressed:(){                                            
                        BlocProvider.of<FeedblocBloc>(context)                            
                          .add(JsonWrite(news,1));   
                        setState(() {
                          
                        });                       
                      },        
                      //splashColor: hijauMain,
                      );          
                    }
          }
        ), 
        //duration: Duration(seconds: 1),
        curve: Curves.bounceIn,
      );
  }

}

