import 'package:flutter/material.dart';
import 'package:religi_app/pages/eventpage/detail.dart';

class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(child: buildTextTemplate('silahkan pilih gambar')),
        Image.asset('assets/images/placeholder-image-icon-14.jpg'),
      ],
    );
  }
}
