import 'package:flutter/material.dart';

class StarHalf extends StatelessWidget {
  const StarHalf({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_half,
      color: Colors.yellow[700],
    );
  }
}
