import 'package:flutter/material.dart';
import 'package:religi_app/constant/_const.dart';
import 'package:religi_app/main.dart';
import 'package:religi_app/pages/BookmarkPage/BookmarkPage.dart';
import 'package:religi_app/pages/HomePage/HomePage.dart';
import 'package:religi_app/pages/eventpage/create.dart';
import 'package:religi_app/pages/eventpage/create2.dart';
import 'package:religi_app/pages/searchPage/searchPage.dart';

class NavBar extends StatelessWidget {
  final String topWords;
  final Widget backgroundWidget;
  final int pageIndex;

  const NavBar({
    Key key,
    this.topWords,
    this.backgroundWidget,
    this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 1000,
      //height: 1000,
      //width: 1000,
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              backgroundColor: hijauMain,
              title: BarAtas(topWords),
            ),
            body: backgroundWidget,
            bottomNavigationBar:
                /* BottomAppBar(
              child: Text("Test"),
              shape: CircularNotchedRectangle(),
            ), */
                MenuBar(
              currentIndex: pageIndex,
            ),
            floatingActionButton: SearchButton(
                // routing: '/create_event',
                ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            extendBody: true,
          ),
          //BarAtas(),
        ],
      ),
    );
  }
}

class BarAtas extends StatelessWidget {
  final String words;

  const BarAtas(this.words, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 1000,
        ),
        Text(words),
        Positioned(
          right: 3.0,
          child: Icon(Icons.filter_list),
        )
      ],
    );
  }
}

class MenuBar extends StatefulWidget {
  final int currentIndex;

  const MenuBar({Key key, this.currentIndex}) : super(key: key);

  @override
  MenuBarState createState() => MenuBarState();
}

class MenuBarState extends State<MenuBar> {
  final double iconScale = 30;
  int currentIndex = 0;
  int pageIndex;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.currentIndex;
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: hijauMain, canvasColor: hijauMain),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(), 
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          //backgroundColor: hijauMain,
          //fixedColor: hijauMain,
          selectedItemColor: textColor,
          //unselectedItemColor: putihMain,
          type: BottomNavigationBarType.fixed,
          //showUnselectedLabels: true,
          //selectedItemColor: hijauMain,
          //unselectedItemColor: hijauMain,
          //fixedColor: hijauMain,
          selectedLabelStyle: normalFont(),
          iconSize: 24,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("HomePage")),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text("Search")),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), title: Text("Bookmark")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text("Settings"))
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            if (index != pageIndex) {
              if (index == 0) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              } else if (index == 1) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SearchPage()));
              }else if (index == 2) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => BookmarkPage()));
              }
            }
          },
        ),
      ),
    );
  }

  void functionTest() {}
}

class SearchButton extends FloatingActionButton {
  final routing;

  SearchButton({this.routing});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: hijauMain,
      child: Icon(Icons.add),
      onPressed: () {
        // Navigator.of(context).pushNamed(routing);
        // Navigator.of(context).pushNamed('/create_event');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => CreateEventPage()));
        print('create event di klik');
      },
    );
  }
}

class AppButton extends StatelessWidget {
  final IconData buttonIcon;
  final double scaling;
  final Function response;

  const AppButton(this.buttonIcon, this.scaling, this.response, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return RaisedButton.icon(
      icon: Icon(buttonIcon, size : scaling), 
      label: Text(label), 
      onPressed: () {},
    ); */
    return Container(
      width: scaling + 10,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Icon(buttonIcon, size: scaling),
        onPressed: response,
      ),
    );
  }
}

/* class FloatingBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Positioned(

    );
  }
  
} */
