import 'package:flutter/material.dart';
import 'package:religi_app/UI/LayarUtama/feed.dart';
import 'package:religi_app/UI/AppBar/appBar.dart';
import 'package:religi_app/UI/LayarUtama/style.dart';


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
                width: 284,                
                //height: 600,
                color: Colors.yellow,
                child:  /* SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context,index) => NewsItem(index),
                  ),
                  
                ),  */
                NewsItem(),
                
              ),
              Container(
                width: 100,
                //height: 600,
                color: Colors.cyan,
              )
            ],
          ),
      )
    );
  }     
}

class NewsItem extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {   
    /* var feeds = Provider.of<>(context);
    var news = 
    var textTheme = Theme.of(context).textTheme.title;  */
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 80,            
                  height: 80,
                  child: Container(              
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Nama", textAlign: TextAlign.left,),
                    SizedBox(height : 5),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      softWrap: true,
                      maxLines: 4,
                      textAlign: TextAlign.justify,),
                    )
                  ],
                ),
              )
            ],
          ),
          
        ],
      ),
    );
  }
    
  }