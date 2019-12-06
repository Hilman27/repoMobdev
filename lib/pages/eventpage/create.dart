import 'package:flutter/material.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'package:religi_app/widget/textform.dart';

class CreateEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingButton(
          icon: Icon(Icons.save),
        ),
        appBar: AppBar(
          title: Text('Create event'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Create event',
                  style: TextStyle(fontSize: 20),
                ),
                FormTextBiasa(
                  namaLabel: 'judul',
                ),
                FormTextBiasa(
                  namaLabel: 'tangal',
                ),
                FormTextBiasa(
                  namaLabel: 'kategori',
                ),
                FormTextBiasa(
                  namaLabel: 'deskripsi acara',
                ),
                FormTextBiasa(
                  namaLabel: 'lokasi',
                ),
                FormTextBiasa(
                  namaLabel: 'pengisi acara',
                ),
                FormTextBiasa(
                  namaLabel: 'judul',
                ),
                FormTextBiasa(
                  namaLabel: 'jenis tiket',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
