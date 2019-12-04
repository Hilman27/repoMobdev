import 'package:flutter/material.dart';
// import 'package:religi_app/widgets/textform.da5rt';
import 'package:religi_app/widgets/_widgets.dart';

class SilverAppBarContoh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_box),
      ),
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
                    buildTextTemplate('keterangan event'),
                    Divider(
                      color: Colors.black,
                    ),
                    buildTextTemplate(
                        'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ')
                  ],
                ),
              ),
            ),
          )
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

  Row buildRowIcon(Icon icon, String isiStringnya) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        icon,
        buildTextTemplate(isiStringnya),
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
