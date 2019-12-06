import 'package:flutter/material.dart';

import 'pages/eventpage/detail.dart';
import 'pages/eventpage/detail_2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageDetailEvent());
    // return MaterialApp(home: TwitterProfilePage());
  }
}
