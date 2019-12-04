import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/Widgets/AppBar/appBar.dart';
import 'package:religi_app/Widgets/Buttons/searchButton.dart';
import 'package:religi_app/Const/Fontstyle.dart';



class PageUtama extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Scaffold(      
      /* appBar: AppBar(
        title : BarAtas(),
      ), */
      floatingActionButton: SearchButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MenuBar(),
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.yellow,
        child: Container(
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
      child:                  
          Row(
            children: <Widget>[              
              Padding(
                padding: const EdgeInsets.only(left:8.0, right: 3.0,bottom: 3.0, top: 3.0),
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
                      NewsUser(news.user.name, news.user.link),
                      Text(news.event.eventName, style: normalFont(), textAlign: TextAlign.left,),
                      SizedBox(height : 4),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(news.event.caption,
                        style: normalFont(),
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.justify,),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),                        
    );
  }
    
  }

class NewsUser extends StatelessWidget{
  final String username;
  final String userlink;

  const NewsUser(this.username, this.userlink , {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Padding(
              padding: const EdgeInsets.only(left : 3.0, top: 2.0),
              child: Row(                
                children: <Widget>[                  
                  Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: SizedBox(
                      width: 15,            
                      height: 15,
                      child: Container(     
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),                              
                      ),
                    ),
                  ),
                  
                  Text(username, style: smallerFont(),),

                ],
              ),
            ),
          );
  }

}