import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:religi_app/pages/HomePage/HomePage.dart';
import 'package:religi_app/widget/AppBar/appBar.dart';

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
    return Center(
      child: Text("This is Search Page"),
    );
  }
  
}