import 'package:flutter/material.dart';

import 'package:religi_app/pages/eventpage/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageDetailEvent());
  }
}
