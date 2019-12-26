import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget{
  @override
  State createState() => new TestPageState();
}

class TestPageState extends State<TestPage> {
  TextEditingController keyInputController = new TextEditingController();
  TextEditingController valueInputController = new TextEditingController();

  Map<String, dynamic> fileContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ListView.builder(
            itemCount: fileContent == null ? 0 : fileContent.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Text(fileContent[index]["title"]),
              );
              },
            ),
          Row(
            children: <Widget>[
              TextField(
                controller: keyInputController,
              ),
              TextField(
                controller: valueInputController,
              ),
            ],
          ),
          Row(
            children: <Widget>[
            FlatButton(
              child: Text("Update"), 
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Update Tulisan"),
              onPressed: (){},
            ),
            ],
          )
          

        ],
      ),
    );
  }
}