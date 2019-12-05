import 'package:flutter/material.dart';
import 'package:religi_app/constant/_const.dart';

class BarAtas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Positioned(
      child: Container(
        child: Row(
          children: <Widget>[
            Text("Beranda", style :tittleHeadWhite(), ),
            Icon(Icons.filter),
          ],
        ),
      ),
      
    );
  }
 
  
}

class NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Stack(
      children: <Widget>[
        Scaffold(          
          bottomNavigationBar: MenuBar(),
        )
      ],
    );
  }

}

class MenuBar extends StatelessWidget{
  final double iconScale =50;
  @override
  Widget build(BuildContext context) {    
    return BottomAppBar(
      elevation: 10,           
      shape: CircularNotchedRectangle(),
      child: Container(
        padding : EdgeInsets.all(5.0),
        height: 55,      
        color: hijauMain,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppButton(Icons.home, iconScale, functionTest),
            SizedBox(width: 20,),
            AppButton(Icons.search, iconScale, null),
            SizedBox(width: 100,),
            AppButton(Icons.bookmark, iconScale, null),
            SizedBox(width: 20,),
            AppButton(Icons.settings, iconScale, null)
          ],
        ),
      ),
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
      width: scaling+5,
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
