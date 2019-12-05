import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final onpress;

  const FloatingButton({Key key, this.onpress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      child: Icon(Icons.add_a_photo),
      onPressed: onpress,
      splashColor: Colors.yellowAccent,
    );
  }
}
