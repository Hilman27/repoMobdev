import 'package:flutter/material.dart';
// import 'package:religi_app/widgets/textform.da5rt';
import 'package:religi_app/widgets/_widgets.dart';

class SilverAppBarContoh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              children: <Widget>[
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
                buildRowTemplate('nama: ', 'ini isinya panjang ya'),
              ],
            ),
          )
          // SliverFillRemaining(
          //   child: Column(
          //     children: List<int>.generate(50, (index) => index)
          //         .map((index) => Container(
          //               height: 40,
          //               margin: EdgeInsets.symmetric(vertical: 10),
          //               color: Colors.grey[300],
          //               alignment: Alignment.center,
          //               child: Text('Heading $index'),
          //             ))
          //         .toList(),
          //   ),
          // ),
        ],
      ),
    );
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

  Text buildTextTemplate(String isiString) {
    return Text(
      isiString,
      style: TextStyle(fontSize: 30),
    );
  }
}

class RowTemplate extends StatelessWidget {
  final label;
  final isinya;

  const RowTemplate({Key key, this.label, this.isinya}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[],
    );
  }
}
