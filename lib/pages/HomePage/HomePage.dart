import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/pages/eventpage/detail.dart';
import 'package:religi_app/widget/AppBar/appBar.dart';
import 'package:religi_app/widget/Buttons/searchButton.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'package:religi_app/widget/dates.dart';

class PageUtama extends StatelessWidget {
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

