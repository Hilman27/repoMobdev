import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:religi_app/model/feed.dart';


class LoaderImages extends StatefulWidget {
  final String imagePath;

  const LoaderImages(this.imagePath, {Key key}) : super(key: key);

  @override
  _LoaderImagesState createState() => _LoaderImagesState(imagePath);
}

class _LoaderImagesState extends State<LoaderImages> {
  final String imagePath;

  _LoaderImagesState(this.imagePath);

  Future<Image> getImageData() async {
    Image image;
    bool imageloaded;

    //var response = await http.get();

    this.setState(() {
      imageloaded = true;
    });
    return image;
  }

  @override
  void initState() {
    this.getImageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class ImageContainer extends StatelessWidget {
  final Feed news;
  final String imagePath;

  const ImageContainer(this.news, this.imagePath, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent])
              .createShader(Rect.fromLTRB(
                  0, rect.height * 1 / 4, rect.width, rect.height - 30));
        },
        blendMode: BlendMode.dstIn,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image(
            //width: MediaQuery.of(context).size.width,
            image:
                //FadeInImage.assetNetwork()
                AssetImage(imagePath),
            //AssetImage("asset/image/ImageTest.PNG"),
            //AssetImage("asset/image/Image_3.png"),
          ),
        ),
      ),
    );
  }
}
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
