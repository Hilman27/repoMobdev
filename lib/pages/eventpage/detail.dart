import 'package:flutter/material.dart';
// import 'package:religi_app/widgets/textform.da5rt';

import 'package:religi_app/widget/_widgets.dart';

class PageDetailEvent extends StatelessWidget {
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
                    buildTextTemplate('keterangan event'),
                    Divider(
                      color: Colors.black,
                    ),
                    buildTextTemplate(
                        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse '),
                    Divider(
                      thickness: 10.0,
                      color: Colors.black,
                    ),
                    SizedBox10(),
                    buildRowIcon(Icon(Icons.photo), 'foto acara'),
                    SizedBox10(),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid(
            // key: header3,
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  // height: 100,
                  // width: 50,
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: new Text('Foto $index'),
                );
              },
              childCount: 8,
            ),
          ),
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
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
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
    return Icon(Icons.star_half);
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
      buildTextTemplate(isiLabel),
      buildTextTemplate(isiStringnya),
    ],
  );
}

Row buildRowIcon<Icon, String>(icon, isinya) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      icon,
      buildTextTemplate(isinya),
    ],
  );
}

Text buildTextTemplate(String isiString) {
  return Text(
    isiString,
    style: TextStyle(fontSize: 30),
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
      // child: Icon(Icons.add_box),
      child: Text(
        'Daftar',
        style: TextStyle(),
      ),
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
