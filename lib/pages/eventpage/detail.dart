import 'dart:math';

import 'package:flutter/material.dart';
import 'package:religi_app/widget/_widgets.dart';
// import 'package:religi_app/widgets/textform.da5rt';

// import 'package:religi_app/widget/_widgets.dart';

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
                    buildTextTemplate('keterangan event', 30),
                    Divider(
                      color: Colors.black,
                    ),
                    buildTextTemplate(
                        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse ',
                        20),
                    Divider(
                      thickness: 10.0,
                      color: Colors.black,
                    ),
                    SizedBox10(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: <Widget>[
                  buildTextTemplate('Maps'),
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.green,
                    child: buildTextTemplate('ini maps'),
                  ),
                  buildTextTemplate('Photo'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
                          new ContainerKosongan(),
                          new Sizedbox5(),
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
