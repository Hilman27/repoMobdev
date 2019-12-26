import 'package:flutter/material.dart';

class StarFull extends StatelessWidget {
  const StarFull({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.yellow,
    );
  }
}
