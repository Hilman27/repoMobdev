import 'package:flutter/material.dart';
import 'package:religi_app/constant/style.dart';
import 'package:religi_app/widget/_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTemplate(
                    labelbutton: 'login',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
