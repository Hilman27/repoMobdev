import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'dart:developer' as developer; 

class FeedListWidget extends StatefulWidget {  

  @override
  FeedListWidgetState createState() => FeedListWidgetState();
  
}

class FeedListWidgetState extends State<FeedListWidget>{
  List status = List<bool>.filled(0, true, growable: true);
  //List<bool> status;

  @override
  void initState() {    
    super.initState();    
    
  }

  @override
  Widget build(BuildContext context) {    
    return CustomScrollView(
          slivers: <Widget>[
            SliverList(              
              delegate: SliverChildBuilderDelegate(
            (context,index) => NewsItem( index: index, onPressed: _statusToogle, statusCheck: statusCheck, initialize: initList, ),
            childCount: 6
              ),
            )
          ],
        );
  }

  initList(int index){
    //status[index];
    //status.add(false);  
    try{
      bool test = status[index];
    }catch(e){
      status.add(true);
    }
  }
  
  _statusToogle(int index){
    if (status[index] == null){
        status[index] = false;
      }
      else{if(status[index] == false){
       status[index] = true; 
      } else status[index] = false; 
      }     
    for(int i =0; i<status.length; i++){
      developer.log("Index $i set to ${status[i]}");  
    }
    
    //return true;
  }
  

  bool statusCheck(int index){    
    return status[index];
  }
}

class NewsItem extends StatefulWidget{
  final ValueChanged<int> onPressed;  
  final ValueChanged<int> initialize;  
  final Function statusCheck;   
  final int index;
  

  const NewsItem( {Key key, 
                  @required this.index,                   
                  @required this.onPressed, 
                  @required this.initialize, 
                  @required this.statusCheck, 
                  }) : super(key: key);

  @override
  NewsItemState createState() => NewsItemState();
  
}

class NewsItemState extends State<NewsItem> {
  int _index;
  bool _expanded;
  Function(int) parentPress;
  Function(int) initialList;
  Function(int) expandCheck;
  
  void initState(){
    super.initState();
    _index = widget.index;
    _expanded = true;
    parentPress = widget.onPressed;
    //widget.initialize(_index);
    initialList = widget.initialize;
    expandCheck = widget.statusCheck;
    initialList(_index);
    
    developer.log("Check $_index and $_expanded Has been Initilaized");
    //developer.log("Check ${expandCheck(_index)}");
    
  }

  changeExpandCollapse(bool){
    widget.onPressed(_index);
  }

  bool checkCollapseState (){
    if(widget.statusCheck(_index) == null)
      {developer.log("Check Status = Not Null. It's ${widget.statusCheck(_index)}");
      return widget.statusCheck(_index);      
      }
    else{
      developer.log("Check Status = Not Null. It's ${widget.statusCheck(_index)}");
      return true;
    }
    
  }

  checkExpandCollapse(bool input){    
    if(input==true){
      if(expandCheck(_index)==false){
        parentPress(_index);
      }
      developer.log("Index $_index Is expanded");
    }else if (input ==false){
      if(expandCheck(_index)==true){
        parentPress(_index);
      }
      developer.log("Index $_index Is Collapsed");
    }else 
      developer.log("Index $_index ????");
    
  }

  @override
  Widget build(BuildContext context) {   
    //widget.onPressed(index);
    _expanded = expandCheck(_index);
    developer.log("Index is at $_index and Expansion is $_expanded");
    var feeds = Provider.of<NewsFeed>(context);
    Feed news = feeds.init(_index);
    //var textTheme = Theme.of(context).textTheme.title; 
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
            title: NewsUser(news.user.name, news.user.link,news.event.eventName),      
            //trailing: Icon(Icons.swap_calls),
            children: <Widget>[                
                //SizedBox(height: 100,),
                AspectRatio(
                  aspectRatio: 4/3,
                  child: Stack(
                    children: <Widget>[
                      ImageContainer(news, "assets/images/"+news.event.imagePath+".png"),                               
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: NewsDetail(news),
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
  }
    
  }

class NewsUser extends StatelessWidget{
  final String username;
  final String userlink;
  final String eventName;

  const NewsUser(this.username, this.userlink, this.eventName , {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return Container(
      width: MediaQuery.of(context).size.width -50,
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
              Text(username, 
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
          Text(eventName, 
          style: tittleHead(),
          maxLines: 1,
          textAlign: TextAlign.right,)
          ),
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
    return Container(
      //width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: ,
        children: <Widget>[
          //SizedBox(width: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical : 4.0),
            child: Container(
              width : MediaQuery.of(context).size.width,
              child: Row(// Row Kiri
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //SizedBox(width: 40,),
                  Container(
                    width: MediaQuery.of(context).size.width*1/4,
                    child: Column(
                      children: <Widget>[
                        Text(intDatesToString(news.event.edateTime.month), 
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.left,),
                        Text(news.event.edateTime.day.toString()),                      
                      ],
                    ),
                  ),
                  //SizedBox(width : 20),
                  Container(
                    width: MediaQuery.of(context).size.width*3/4 -10,                   
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(news.event.eventName, 
                          style: feedTitle(), 
                          textAlign: TextAlign.left,
                          maxLines: 2,),
                          SizedBox(height : 4),
                        ],
                      )
                      
                    ),
                  
                ],
              ),
            ),
          ),
          //SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical : 4.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[                            
                    //SizedBox(width: 40,),
                    Container(
                    width: MediaQuery.of(context).size.width*1/4,
                    child: 
                    Icon(Icons.location_on, color: Colors.red),
                    ) ,
                    //SizedBox(width : 20),
                    
                    Container(
                      width: MediaQuery.of(context).size.width*3/4 -10,        
                      child: Text(news.event.eventLocation,
                      style: feedLoc(),
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.left,),
                    ),                  
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
  
}