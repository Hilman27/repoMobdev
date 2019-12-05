import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'page/eventpage/detail.dart';
=======
import 'package:religi_app/constant/style.dart';
import 'package:religi_app/widget/_widgets.dart';
>>>>>>> 3a37ade0e282b004589289ba650f363e2d6be56e

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      home: SilverAppBarContoh(),
=======
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
>>>>>>> 3a37ade0e282b004589289ba650f363e2d6be56e
    );
  }
}
