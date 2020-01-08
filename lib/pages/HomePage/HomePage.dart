import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/pages/searchPage/searchPage.dart';
import 'package:religi_app/widget/AppBar/appBar.dart';
import 'package:religi_app/widget/_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => NewsFeed()),
      ],
      child:MaterialApp(
      /* initialRoute: '/',
      routes: {
        '/' : (context) => PageUtama(),
        '/Search' : (context) => SearchPage(),
      }, */
      home: Scaffold(
        /* appBar: AppBar(
          title : BarAtas(),
        ), */
        /* floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SearchButton(),      
        bottomNavigationBar: MenuBar(), */
        body: NavBar(
            topWords: "Beranda",
            backgroundWidget: CallNewsFeed(),
            pageIndex: 0),
      ),
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
          child: FeedListWidget() /* FeedProvider(            
            feedBloc: _feedBloc,
            child: FeedListWidget()),  */
          ),
        ),      
    );
  }
}
