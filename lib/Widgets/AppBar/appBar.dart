import 'package:flutter/material.dart';
import 'package:religi_app/Const/style.dart';

class BarAtas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {    
    return Center(
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
        )   ;
  }
 
  
}
