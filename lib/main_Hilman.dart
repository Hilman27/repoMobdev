import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/pages/HomePage/HomePage.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/pages/HomePage/tespage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomePage();
    //test
    //return TestPage();
  }
}
