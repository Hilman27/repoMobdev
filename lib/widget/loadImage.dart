import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;


//Note : Tunggu sampai implementasi bloc
/* class ImageLoad extends StatelessWidget{
  AssetImage image;

  @override
  Widget build(BuildContext context) {    
    return FutureBuilder(
      future: hLoadImage(),
            builder: (BuildContext context, AsyncSnapshot<Image> image) {
            if (image.hasData) {
              return image.data;  // image is ready
            } else {
              Image result = copyResize(Image, 786);
              return new Container();  // placeholder
            }
          }
      );
  }

  Future<AssetImage> hLoadImage(String fileName) async {
  return AssetImage("asset/image/"+fileName+".JPG");
  }
              
  
} */