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
          color: putihMain,
          child: ExpansionTile(
            initiallyExpanded: true,
            title: Column(children: <Widget>[        
              NewsUser(news.user.name, news.user.link,news.event.eventName),
            ],
            ),      
            children: <Widget>[
                Column(
                  children: <Widget>[              
                    AspectRatio(
                      aspectRatio: 4/3,
                      child: Stack(
                        children: <Widget>[
                        Container(              
                        //color: dummyPicColor,
                        child: AspectRatio(
                          aspectRatio: 4/3,
                          child: ShaderMask(
                                shaderCallback: (rect){
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.black,Colors.transparent]
                                  ).createShader(Rect.fromLTRB(0, rect.height*1/4, rect.width, rect.height-30));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Image(
                                image: 
                                AssetImage("asset/image/"+news.event.imagePath+".png"),
                                //AssetImage("asset/image/ImageTest.PNG"),
                                //AssetImage("asset/image/Image_3.png"), 
                                                           
                            ),
                          ),
                        ),
                      ),  
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
                    //

                    //NewsDetail(news),

                    //
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
      color: putihMain,
      child: Padding(
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
                maxLines: 1,
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
                maxLines: 1,
                textAlign: TextAlign.right,)
                ),
            ],
          ),
          ],        
        ),
      ),
    );
  }

}

class NewsDetail extends StatelessWidget{
  final Feed news;

  const NewsDetail(this.news, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //SizedBox(width: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical : 4.0),
          child: Container(
            width: 370,            
            child: Row(// Row Kiri
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 40,),
                Container(
                  width: 30,
                  child: Column(
                    children: <Widget>[
                      Text(intDatesToString(news.event.edateTime.month), 
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.left,),
                      Text(news.event.edateTime.day.toString()),                      
                    ],
                  ),
                ),
                SizedBox(width : 20),
                Container(
                  width: 280,                   
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
            width: 370,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[                            
                  SizedBox(width: 40,),
                  Container(
                  width: 30,
                  child: 
                  Icon(Icons.location_on, color: Colors.red),
                  ) ,
                  SizedBox(width : 20),
                  
                  Padding(
                    padding: const EdgeInsets.only(right : 3.0),
                    child: Container(
                      width: 277,        
                      child: Text(news.event.eventLocation,
                      style: feedLoc(),
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.left,),
                    ),
                  ),                  
                ],
              ),
          ),
        )
      ],
    );
  }
  
}