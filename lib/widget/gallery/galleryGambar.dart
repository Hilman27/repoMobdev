import 'package:flutter/material.dart';
import 'package:religi_app/model/_model.dart';

import 'galleryPhotoviewer.dart';

class GalleryGambar extends StatefulWidget {
  @override
  _GalleryGambarState createState() => _GalleryGambarState();
}

class _GalleryGambarState extends State<GalleryGambar> {
  bool verticalGallery = false;
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoViewWrapper(
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: verticalGallery ? Axis.vertical : Axis.horizontal,
        ),
      ),
    );
  }
}
