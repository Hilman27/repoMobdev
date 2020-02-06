import 'package:flutter/material.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/widget/AppBar/appBar.dart';
import 'package:religi_app/widget/_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
    home: Scaffold(     
      body: NavBar(
          topWords: "Beranda",
          backgroundWidget: CallNewsFeed(),
          pageIndex: 0),
    ),
    );
  }
}

class CallNewsFeed extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {    
    return Container(
      color: putihBack,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: FeedListWidget() 
          ),
        ),      
    );
  }
}
