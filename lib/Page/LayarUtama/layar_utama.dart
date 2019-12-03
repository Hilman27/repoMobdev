import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/Models/LayarUtama/feed_model.dart';
import 'package:religi_app/Page/AppBar/appBar.dart';
import 'package:religi_app/Page/LayarUtama/style.dart';


class PageUtama extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title:  BarAtas(),              
      ),
      body: Container(
        child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                width: 384,                
                //height: 600,
                color: Colors.yellow,
                child:  Container(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                       (context,index) => NewsItem(index),
                        ),
                      )
                    ],
                  )
                ),
                  
                ), 
                //NewsItem(),
                
              
              /* Container(
                width: 100,
                //height: 600,
                color: Colors.cyan,
              ) */ //Dev Notes : Ads Space Gone. Make the screen too small.
            ],
          ),
      )
    );
  }     
}

class NewsItem extends StatelessWidget {
  final int index;

  const NewsItem(this.index, {Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {   
    var feeds = Provider.of<NewsFeed>(context);
    var news = feeds.init(index);
    var textTheme = Theme.of(context).textTheme.title; 
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Padding(
              padding: const EdgeInsets.only(left : 8.0, top: 2.0),
              child: Row(                
                children: <Widget>[
                  SizedBox(width: 17,),
                  Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: SizedBox(
                      width: 50,            
                      height: 50,
                      child: Container(     
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),                              
                      ),
                    ),
                  ),
                  SizedBox(width: 17,),
                  Text(news.user.name, style: tittleHead(),),

                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[              
              Padding(
                padding: const EdgeInsets.only(left:8.0, right: 3.0,bottom: 3.0),
                child: SizedBox(
                  width: 80,            
                  height: 80,
                  child: Container(              
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 80,                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[                    
                      Text(news.event.eventName, style: normalFont(), textAlign: TextAlign.left,),
                      SizedBox(height : 5),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(news.event.caption,
                        style: normalFont(),
                        softWrap: true,
                        maxLines: 4,
                        textAlign: TextAlign.justify,),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          
        ],
      ),
    );
  }
    
  }