import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/widget/_widgets.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(      
        body: NavBar(
              topWords : "Search Page", 
              backgroundWidget : CallSearchPage(),
              pageIndex : 1),        
        );
  }
}

class CallSearchPage extends StatelessWidget{
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