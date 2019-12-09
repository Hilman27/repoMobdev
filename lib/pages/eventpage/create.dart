import 'package:flutter/material.dart';
// import 'package:religi_app/pages/eventpage/tagKategori.dart';
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
                // Text(
                //   'Create event',
                //   style: TextStyle(fontSize: 20),
                // ),
                // FormTextBiasa(
                //   namaLabel: 'judul',
                // ),
                // FormTextBiasa(
                //   namaLabel: 'tangal',
                // ),
                // FormTextBiasa(
                //   namaLabel: 'kategori',
                // ),
                // FormTextBiasa(
                //   namaLabel: 'deskripsi acara',
                // ),
                // FormTextBiasa(
                //   namaLabel: 'lokasi',
                // ),
                // FormTextBiasa(
                //   namaLabel: 'pengisi acara',
                // ),
                // FormTextBiasa(
                //   namaLabel: 'judul',
                // ),
                FormTextBiasa(
                  namaLabel: 'jenis tiket',
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         filled: true,
                //         fillColor: Colors.red,
                //         border: OutlineInputBorder(
                //             // borderRadius: BorderRadius.circular(10.0)
                //             ),
                //         labelText: 'namaLabel',

                //         labelStyle:
                //             TextStyle(color: Colors.white, fontSize: 30),
                //         hintText: 'masukkan '.toLowerCase()),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TagSearchService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(milliseconds: 400), null);
    List<dynamic> tagList = <dynamic>[];
    tagList.add({'name': "Flutter", 'value': 1});
    tagList.add({'name': "HummingBird", 'value': 2});
    tagList.add({'name': "Dart", 'value': 3});
    List<dynamic> filteredTagList = <dynamic>[];
    if (query.isNotEmpty) {
      filteredTagList.add({'name': query, 'value': 0});
    }
    for (var tag in tagList) {
      if (tag['name'].toLowerCase().contains(query)) {
        filteredTagList.add(tag);
      }
    }
    return filteredTagList;
  }
}
