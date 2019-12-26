import 'package:flutter/material.dart';
import 'package:religi_app/pages/eventpage/detail.dart';

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
                        SizedBox10(),
                        buildTextTemplate('20 des 2018', 20)
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
