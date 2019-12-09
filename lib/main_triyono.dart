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
    return MaterialApp(
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/menu1': (BuildContext context) => TwitterProfilePage(),
        // '/menu2': (BuildContext context) => CreateEvent(),
        '/menu3': (BuildContext context) => CreateEventPage(),
        '/menu4': (BuildContext context) => PageDetailEvent(),
      },
    );
    // return MaterialApp(home: TwitterProfilePage());
    // return MaterialApp(home: CreateEvent());
    // return MaterialApp(home: CreateEventPage());
    // return MaterialApp(
    //     home: EasyGoogleMaps(
    //   title: 'Apple Campus',
    //   apiKey: 'AIzaSyCMq-kco6YAp2GqfE3MIqyMQOYjQQPLEGw',
    //   address: 'Infinite Loop, Cupertino, CA 95014',
    // ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan menu'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            MyButton(
              iconnya: Icon(Icons.ac_unit),
              routing: '/menu1',
              judul: 'detail event 1',
            ),
            // MyButton(
            //   iconnya: Icon(Icons.sentiment_satisfied),
            //   routing: '/menu2',
            //   judul: 'menu 2',
            // ),
            MyButton(
              iconnya: Icon(Icons.grid_on),
              routing: '/menu3',
              judul: 'create event',
            ),
            MyButton(
              iconnya: Icon(Icons.slideshow),
              routing: '/menu4',
              judul: 'detail event 2',
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final iconnya;
  final routing;
  final judul;
  MyButton({this.iconnya, this.routing, this.judul});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      FlatButton(
        child: Row(
          children: <Widget>[
            iconnya,
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            Text(
              judul,
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(routing);
        },
      )
    ]);
  }
}
