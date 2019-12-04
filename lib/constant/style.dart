import 'package:division/division.dart';
import 'package:flutter/material.dart';

abstract class CustomStyle {
  static ParentStyle mybuttonStyle =
      ParentStyle(angleFormat: AngleFormat.degree)
        ..background.color(Colors.lightBlue[200])
        ..borderRadius(all: 60)
        ..border(all: 3, color: Colors.lightBlue[900])
        ..elevation(5)
        ..padding(horizontal: 20, vertical: 10)
        ..ripple(true, splashColor: Colors.green)
      // ..rotate(50)

      ;

  static TxtStyle myTxtStyle = TxtStyle()
    ..fontSize(15)
    ..bold()
    ..textColor(Colors.black);
}
