import 'package:flutter/material.dart';
import 'package:religi_app/pages/eventpage/create.dart';
import 'package:religi_app/pages/eventpage/create2.dart';
import 'package:religi_app/pages/eventpage/maps_sample.dart';

import 'pages/eventpage/detail.dart';
import 'pages/eventpage/detail_2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: PageDetailEvent());
    // return MaterialApp(home: TwitterProfilePage());
    // return MaterialApp(home: CreateEvent());
    return MaterialApp(home: CreateEventPage());
    // return MaterialApp(
    //     home: EasyGoogleMaps(
    //   title: 'Apple Campus',
    //   apiKey: 'AIzaSyCMq-kco6YAp2GqfE3MIqyMQOYjQQPLEGw',
    //   address: 'Infinite Loop, Cupertino, CA 95014',
    // ));
  }
}
