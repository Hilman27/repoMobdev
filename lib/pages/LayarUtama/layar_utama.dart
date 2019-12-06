import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/widget/AppBar/appBar.dart';
import 'package:religi_app/widget/Buttons/searchButton.dart';
import 'package:religi_app/model/_model.dart';



class PageUtama extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Scaffold(      
      /* appBar: AppBar(
        title : BarAtas(),
      ), */
      /* floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SearchButton(),      
      bottomNavigationBar: MenuBar(), */
      body: NavBar("Beranda", CallNewsFeed()),                    
    );
  }     
}

class CallNewsFeed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Container(          
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topCenter,
              color: putihMain,
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
    Feed news = feeds.init(index);
    var textTheme = Theme.of(context).textTheme.title; 
    return Column(
      children: <Widget>[
      Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        child: ExpansionTile(
          initiallyExpanded: true,
          title: Column(children: <Widget>[        
            NewsUser(news.user.name, news.user.link,news.event.eventName),
          ],
          ),      
          children: <Widget>[
              Column(
                children: <Widget>[              
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: AspectRatio(
                      aspectRatio: 4/3,
                      child: SizedBox(                  
                        width: 400,                                
                        child: Container(              
                          color: dummyPicColor,
                        ),
                      ),
                    ),
                  ),
                  NewsDetail(news),
                  /* Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[                            
                        Text(news.event.eventName, style: normalFont(), textAlign: TextAlign.left,),
                        SizedBox(height : 4),
                        Text(news.event.caption,
                        style: normalFont(),
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.justify,)
                      ],
                    ),
                  ), */
                ],
              ),
            ],                                  
        ),
      ),
      SizedBox(height: 5, 
      child: Container(color: fullWhite,),)
      ],      
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: <Widget>[          
          Row(
          mainAxisAlignment: MainAxisAlignment.end,                
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
              maxLines: 2,
              textAlign: TextAlign.left,)
              ),
              
            SizedBox(
              width: 20,
            ),
            Container(
              width: 146,
              alignment: Alignment.topRight,
              child: 
              Text(eventName, 
              style: tittleHead(),
              maxLines: 2,
              textAlign: TextAlign.right,)
              ),
          ],
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 30,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(// Row Kiri
            children: <Widget>[
              Text("Dec", style: TextStyle(color: Colors.red),),
              Text("23"),
              SizedBox(height : 4),
              Icon(Icons.location_on, color: Colors.red)
            ],
          ),
        ),
        SizedBox(width: 10,),
        Container(
          width: 286,
          child: Padding(          
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[                            
                  Text(news.event.eventName, 
                  style: feedTitle(), 
                  textAlign: TextAlign.left,
                  maxLines: 2,),

                  SizedBox(height : 4),
                  
                  Text(news.event.eventLocation,
                  style: feedLoc(),
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.justify,)
                ],
              ),
          ),
        )
      ],
    );
  }
  
}