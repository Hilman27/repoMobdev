import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/widget/AppBar/appBar.dart';
import 'package:religi_app/widget/Buttons/searchButton.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'package:religi_app/widget/dates.dart';



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
      color: putihBack,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),            
            child: Container(
              alignment: Alignment.topCenter,              
              child: Container(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      
                      delegate: SliverChildBuilderDelegate(
                     (context,index) => NewsItem(index),
                     childCount: 6
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
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(3.0)),   
      child: Column(
        children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          color: putihMain,
          child: CustomExpansionTile(            
            initiallyExpanded: true,
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