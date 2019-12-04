import 'package:flutter/material.dart';
import 'package:religi_app/Const/style.dart';

class BarAtas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return BottomAppBar(
      child: Center(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10,top: 10),
                  child: Icon(Icons.offline_bolt),  
                ),
                Container(
                width: 215,            
                child: TextFormField(
                  initialValue: "Masukan Text",              
                  textAlign: TextAlign.center,
                  style: styleInput(),
                ),
              ),          
              Container(            
                width: 100,
                //color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(              
                  children: <Widget>[                                
                    //Icon(Icons.notifications),
                    Icon(Icons.access_time),        
                    SizedBox(width: 5),
                    Icon(Icons.message),
                    SizedBox(width: 5),
                    Icon(Icons.account_circle),
                  ],
                )
                ),   
              ),  
              ],
            ),
          ),
    )   ;
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
        padding : EdgeInsets.all(8.0),
        height: 50,      
        color: Colors.greenAccent,  
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.home, size: iconScale,),
            SizedBox(width: 20,),
            Icon(Icons.tablet, size: iconScale,),
            SizedBox(width: 100,),
            Icon(Icons.photo, size: iconScale,),
            SizedBox(width: 20,),
            Icon(Icons.settings, size: iconScale,)
          ],
        ),
      ),
    );
  }
  
}

class FloatingBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Positioned(

    );
  }
  
}
