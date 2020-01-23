// import 'dart:math';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';
// import 'package:religi_app/pages/HomePage/HomePage.dart';
// import 'package:youtube_player/youtube_player.dart';
// import 'package:religi_app/widget/galleryPhotoviewer.dart';
// import 'package:religi_app/widget/_widgets.dart';
// import 'package:religi_app/widgets/textform.da5rt';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/widget/_widgets.dart';

class PageDetailEvent extends StatefulWidget {
  final Feed inputNews;

  const PageDetailEvent({Key key, this.inputNews}) : super(key: key);
  @override
  _PageDetailEventState createState() => _PageDetailEventState(inputNews);
}

class _PageDetailEventState extends State<PageDetailEvent> {
  bool verticalGallery = false;
  final Feed inputNews;

  _PageDetailEventState(this.inputNews);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingButtonTemplate(),
      body: buildCustomScrollTampilan(context),
    );
  }

  CustomScrollView buildCustomScrollTampilan(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        buildSliverAppBar(),
        buildSliverFillRemaining(context),
        buildSliverToBoxAdapter(context)
      ],
    );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(BuildContext context) {
    // var feeds = Provider.of<NewsFeed>(context);
    // Feed news = feeds.init(index);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              buildTextTemplate('Maps'),
              // Container(
              //   width: 300,
              //   height: 300,
              //   color: Colors.green,
              //   child: buildTextTemplate('ini maps'),
              // ),
              Container(
                child: Image.network(
                    'https://4.bp.blogspot.com/-d8gQCdIByoI/W4aS32boklI/AAAAAAAAAts/6TLWsayjZ9oqW3K5cKeuHc0Gca0OqNxUwCLcBGAs/s1600/peta-rute-coban-bidadari-malang.jpg'),
              ),
              SizedBox10(),
              buildTextTemplate('Video'),
              VideoSection(),
              SizedBox10(),
              buildTextTemplate('Photo'),
              buildPhotoSection(context),
              buildTextTemplate('Komentar'),
              Column(
                children: <Widget>[
                  new CardKomentar(),
                  new CardKomentar(),
                  new CardKomentar(),
                  FormTextBiasa(
                    namaLabel: 'Komentar',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildPhotoSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: buildContohGallery(context),
      ),
    );
  }

  Row buildContohGallery(BuildContext context) {
    return Row(
      children: <Widget>[
        GalleryExampleItemThumbnail(
          galleryExampleItem: galleryItems[0],
          onTap: () {
            open(context, 0);
          },
        ),
        GalleryExampleItemThumbnail(
          galleryExampleItem: galleryItems[2],
          onTap: () {
            open(context, 2);
          },
        ),
        GalleryExampleItemThumbnail(
          galleryExampleItem: galleryItems[3],
          onTap: () {
            open(context, 3);
          },
        ),
        GalleryExampleItemThumbnail(
          galleryExampleItem: galleryItems[4],
          onTap: () {
            open(context, 4);
          },
        ),
        GalleryExampleItemThumbnail(
          galleryExampleItem: galleryItems[5],
          onTap: () {
            open(context, 5);
          },
        ),
        GalleryExampleItemThumbnail(
          galleryExampleItem: galleryItems[6],
          onTap: () {
            open(context, 6);
          },
        ),
        GalleryExampleItemThumbnail(
          galleryExampleItem: galleryItems[7],
          onTap: () {
            open(context, 7);
          },
        ),
        GalleryExampleItemThumbnail(
          galleryExampleItem: galleryItems[1],
          onTap: () {
            open(context, 1);
          },
        ),
      ],
    );
  }

  SliverFillRemaining buildSliverFillRemaining(BuildContext context) {
    //var feeds = Provider.of<NewsFeed>(context);
    Feed news = inputNews;
    // var textTheme = Theme.of(context).textTheme.title;
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              buildRowIcon(
                  Icon(Icons.date_range), (news.event.edateTime.toString())),
              SizedBox10(),
              buildRowIcon(
                  Icon(Icons.home), (news.event.eventLocation.toString())),
              new SizedBox10(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Icon(Icons.star), new RatingStar()],
              ),
              new SizedBox10(),
              new SizedBox10(),
              buildTextTemplate('keterangan event', 30),
              Divider(
                color: Colors.black,
              ),
              buildTextTemplate(
                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse ',
                  20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 5.0,
                  color: Colors.black,
                ),
              ),
              SizedBox10(),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    //var feeds = Provider.of<NewsFeed>(context);
    Feed news = inputNews;
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      // floating: true,
      // snap: true,
      flexibleSpace: FlexibleSpaceBar(
          title: Text(news.event.eventName),
          background:
              //  Image.network(
              //   'https://gunung.id/wp-content/uploads/2018/08/gunung-prau.jpg', // <===   Add your own image to assets or use a .network image instead.

              //   fit: BoxFit.cover,
              // ),
              Image.asset(
            "assets/images/" + news.event.imagePath + ".png",
            fit: BoxFit.cover,
          )),
    );
  }

  Widget listItem(Color color, String title) => Container(
        height: 100.0,
        color: color,
        child: Center(
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

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

// class GambarContainer extends StatelessWidget {
//   const GambarContainer({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       height: 150,
//       child: Image.network(
//           'https://gunung.id/wp-content/uploads/2018/08/gunung-prau.jpg'),
//     );
//   }
// }

// class ContainerKosongan extends StatelessWidget {
//   const ContainerKosongan({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100,
//       width: 100,
//       color: Colors.grey,
//     );
//   }
// }

// class Sizedbox5 extends StatelessWidget {
//   const Sizedbox5({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 5,
//       height: 5,
//     );
//   }
// }

class RatingStar extends StatelessWidget {
  const RatingStar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new StarFull(),
        new StarFull(),
        new StarHalf(),
        new StarEmpty(),
        new StarEmpty(),
      ],
    );
  }
}

Row buildRowTemplate(String isiLabel, String isiStringnya) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      buildTextTemplate(isiLabel, 30),
      buildTextTemplate(isiStringnya, 30),
    ],
  );
}

Row buildRowIcon<Icon, String>(icon, isinya) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      icon,
      buildTextTemplate(isinya, 30),
    ],
  );
}

Text buildTextTemplate(String isiString, [double size]) {
  return Text(
    isiString,
    style: TextStyle(fontSize: size ?? 30),
    textAlign: TextAlign.justify,
  );
}

class FloatingButtonTemplate extends StatelessWidget {
  const FloatingButtonTemplate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.input),
      tooltip: 'daftar',

      // child: Text(
      //   'Daftar',
      //   style: TextStyle(),
      // ),
    );
  }
}

class SizedBox10 extends StatelessWidget {
  const SizedBox10({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
    );
  }
}
