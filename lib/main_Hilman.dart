import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/pages/LayarUtama/layar_utama.dart';
import 'package:religi_app/model/_model.dart';

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
            PageUtama(),
      ),
    );
  }
}
