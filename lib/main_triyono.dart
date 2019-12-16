import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/pages/HomePage/HomePage.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/pages/eventpage/create2.dart';
import 'package:religi_app/pages/eventpage/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => NewsFeed()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: /* SafeArea(
          child: PageUtama(),
        ),  */
            HomePage(),
        routes: <String, WidgetBuilder>{
          // '/menu1': (BuildContext context) => TwitterProfilePage(),
          // '/menu2': (BuildContext context) => CreateEvent(),
          '/create_event': (BuildContext context) => CreateEventPage(),
          '/detail_event': (BuildContext context) => PageDetailEvent(),
          // '/menu4': (BuildContext context) => PageDetailEvent(),
        },
      ),
    );
  }
}
