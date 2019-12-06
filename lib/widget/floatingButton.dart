import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final onpress;
  final Icon icon;

  const FloatingButton({Key key, this.onpress, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      child: icon,
      onPressed: onpress,
      splashColor: Colors.yellowAccent,
    );
  }
}
