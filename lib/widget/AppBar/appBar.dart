import 'package:flutter/material.dart';
import 'package:religi_app/constant/_const.dart';

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
        padding : EdgeInsets.all(5.0),
        height: 55,      
        color: Colors.greenAccent,  
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppButton(Icons.home, iconScale, functionTest),
            SizedBox(width: 20,),
            AppButton(Icons.tablet, iconScale, null),
            SizedBox(width: 100,),
            AppButton(Icons.photo, iconScale, null),
            SizedBox(width: 20,),
            AppButton(Icons.settings, iconScale, null)
          ],
        ),
      ),
    );
  }
  
}

void functionTest (){

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
      width: scaling,
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
