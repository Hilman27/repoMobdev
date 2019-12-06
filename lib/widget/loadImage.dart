import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<AssetImage> loadImage(String fileName) async {
  return AssetImage("asset/image/"+fileName+".JPG");
}