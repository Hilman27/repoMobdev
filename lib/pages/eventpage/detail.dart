import 'dart:math';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'package:youtube_player/youtube_player.dart';

// import 'package:religi_app/widgets/textform.da5rt';

// import 'package:religi_app/widget/_widgets.dart';

class PageDetailEvent extends StatefulWidget {
  @override
  _PageDetailEventState createState() => _PageDetailEventState();
}

class _PageDetailEventState extends State<PageDetailEvent> {
  bool verticalGallery = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingButtonTemplate(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            // floating: true,
            // snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Nama Event'),
              background: Image.network(
                'https://gunung.id/wp-content/uploads/2018/08/gunung-prau.jpg', // <===   Add your own image to assets or use a .network image instead.
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    buildRowIcon(Icon(Icons.date_range), 'tanggal 4 Juli 2020'),
                    SizedBox10(),
                    buildRowIcon(Icon(Icons.home), 'masjid jami\' '),
                    new SizedBox10(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Icon(Icons.star), new RatingStar()],
                    ),
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
          ),
          SliverToBoxAdapter(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: <Widget>[
                            // new GambarContainer(),
                            // new Sizedbox5(),
                            // new GambarContainer(),
                            // new Sizedbox5(),
                            // new GambarContainer(),
                            // new Sizedbox5(),
                            // new GambarContainer(),
                            // new Sizedbox5(),
                            // new GambarContainer(),
                            // new Sizedbox5(),
                            // new GambarContainer(),
                            // new Sizedbox5(),
                            // new GambarContainer(),
                            // new Sizedbox5(),
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
                        ),
                      ),
                    ),
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
          )
        ],
      ),
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

class GambarContainer extends StatelessWidget {
  const GambarContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Image.network(
          'https://gunung.id/wp-content/uploads/2018/08/gunung-prau.jpg'),
    );
  }
}

class CardKomentar extends StatelessWidget {
  const CardKomentar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.pink[200],
                        child: Icon(Icons.person),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        buildTextTemplate('@nama user  ', 20),
                        Sizedbox5(),
                        buildTextTemplate('20 desember 2018', 20)
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'ini adalah komentar yang panjang, ini adalah komentar yang panjang, ini adalah komentar yang panjang, '),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerKosongan extends StatelessWidget {
  const ContainerKosongan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.grey,
    );
  }
}

class Sizedbox5 extends StatelessWidget {
  const Sizedbox5({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 5,
      height: 5,
    );
  }
}

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

class StarEmpty extends StatelessWidget {
  const StarEmpty({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star_border);
  }
}

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

class GalleryExampleItem {
  GalleryExampleItem({this.id, this.resource, this.isSvg = false});

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail(
      {Key key, this.galleryExampleItem, this.onTap})
      : super(key: key);

  final GalleryExampleItem galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryExampleItem.id,
          child: Image.asset(galleryExampleItem.resource, height: 200.0),
        ),
      ),
    );
  }
}

List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
  GalleryExampleItem(
    id: "tag1",
    resource: "assets/images/profil.png",
  ),
  GalleryExampleItem(id: "tag2", resource: "assets/images/profil.png"),
  GalleryExampleItem(
    id: "tag3",
    resource: "assets/images/profil.png",
  ),
  GalleryExampleItem(
    id: "tag5",
    resource: "assets/images/profil.png",
  ),
  GalleryExampleItem(
    id: "tag6",
    resource: "assets/images/profil.png",
  ),
  GalleryExampleItem(
    id: "tag7",
    resource: "assets/images/profil.png",
  ),
  GalleryExampleItem(
    id: "tag8",
    resource: "assets/images/profil.png",
  ),
  GalleryExampleItem(
    id: "tag9",
    resource: "assets/images/profil.png",
  ),
];

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

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingChild,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex,
    @required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<GalleryExampleItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: galleryItems.length,
              loadingChild: widget.loadingChild,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Image ${currentIndex + 1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  decoration: null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryExampleItem item = widget.galleryItems[index];
    return item.isSvg
        ? PhotoViewGalleryPageOptions.customChild(
            child: Container(
              width: 300,
              height: 300,
            ),
            childSize: const Size(300, 300),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 1.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          )
        : PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(item.resource),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 1.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          );
  }
}

// start ######################### VIDEO #############

class VideoSection extends StatefulWidget {
  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  TextEditingController _idController = TextEditingController();
  String id = "bqgBxuAEscQ";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleChildScrollView(
          child: YoutubePlayer(
            context: context,
            source: id,
            quality: YoutubeQuality.HD,
            autoPlay: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _idController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter youtube \<video id\> or \<link\>"),
          ),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              id = _idController.text;
            });
          },
          child: Text("Play"),
        ),
      ],
    );
  }
}
