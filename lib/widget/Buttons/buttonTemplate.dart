import 'package:flutter/material.dart';

class ButtonTemplate extends StatelessWidget {
  final button;

  const ButtonTemplate({Key key, this.button}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(button),
      onPressed: () {},
    );
  }
}
