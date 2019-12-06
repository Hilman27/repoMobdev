import 'package:flutter/material.dart';
import 'package:religi_app/constant/_const.dart';

class NavBar extends StatelessWidget{
  final String topWords;
  final Widget backgroundWidget;

  const NavBar(this.topWords , this.backgroundWidget, {Key key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {    
    return Container(
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
          bottomNavigationBar:MenuBar() ,
          floatingActionButton: SearchButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
        //BarAtas(),
        
      ],
      ),
    );
  }

}

class BarAtas extends StatelessWidget{
  final String words;

  const BarAtas(this.words, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {    
    return  Stack(
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

class MenuBar extends StatelessWidget{
  final double iconScale =30;
  @override
  Widget build(BuildContext context) {    
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,      
      showUnselectedLabels: true,
      //selectedItemColor: hijauMain,
      //unselectedItemColor: hijauMain,
      //fixedColor: hijauMain,
      selectedLabelStyle: normalFont(),
      iconSize: 24,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("HomePage")
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Search")
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          title: Text("Bookmark")
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Settings"))

      ],

      backgroundColor: hijauMain,
      //fixedColor: hijauMain,
      selectedItemColor: textColor,
      unselectedItemColor: putihMain,
    );
  }

  void functionTest (){

  }
  
}

class SearchButton extends FloatingActionButton{
  @override
  Widget build(BuildContext context) {    
    return FloatingActionButton(
      backgroundColor: hijauMain,
      child: Icon(Icons.add), 
      onPressed: () {},
    );
  }
  
}



class AppButton extends StatelessWidget{
  final IconData buttonIcon;
  final double scaling;
  final Function response;

  const AppButton(this.buttonIcon, this.scaling, this.response, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    /* return RaisedButton.icon(
      icon: Icon(buttonIcon, size : scaling), 
      label: Text(label), 
      onPressed: () {},
    ); */
    return Container(
      width: scaling+10,
      child: FlatButton(      
        padding: EdgeInsets.all(0),
        child: Icon(buttonIcon, size : scaling), 
      onPressed: response,
        
      ),
    )
    ;
  }
  
}

/* class FloatingBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Positioned(

    );
  }
  
} */


