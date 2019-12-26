// import 'dart:io';
// import 'dart:async';
// import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:religi_app/model/_model.dart';
import 'package:religi_app/pages/eventpage/detail.dart';
import 'package:religi_app/widget/_widgets.dart';

///
class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  // String _selectedValuesJson = "Nothing to show";
  List<Kategori> _selectedKategoris;
  TextEditingController eventID = TextEditingController(text: '1');
  TextEditingController imagePath =
      TextEditingController(text: 'placeholderImage');
  TextEditingController eventName = TextEditingController(text: 'nama event');
  TextEditingController eventLocation = TextEditingController(text: 'jogja');
  TextEditingController caption =
      TextEditingController(text: 'pengajian bersama dengan isinya');
  TextEditingController newsType = TextEditingController(text: '1');
  TextEditingController edateTime =
      TextEditingController(text: '1974-03-20 00:00:00.000');
  @override
  void initState() {
    _selectedKategoris = [];
    super.initState();
  }

  @override
  void dispose() {
    _selectedKategoris.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var value;
    return Scaffold(
      floatingActionButton: FloatingButton(
        onpress: () {
          var event = Event(
              eventID: int.parse(eventID.text),
              imagePath: imagePath.text,
              eventName: eventName.text,
              eventLocation: eventLocation.text,
              caption: caption.text,
              newsType: int.parse(newsType.text),
              edateTime: DateTime.parse(edateTime.text));
          NewsFeed.dummyEvents.add(event);
          Navigator.pop(context);

          // print(event.toString());
        },
        icon: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text('Create event'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PilihImage(),
            FormTextBiasa(
              namaLabel: 'image*',
              controller: imagePath,
            ),
            FormTextBiasa(
              tipeInput: TextInputType.number,
              namaLabel: 'event id',
              controller: eventID,
            ),
            FormTextBiasa(
              namaLabel: 'judul',
              controller: eventName,
            ),

            buildFormTags(),
            SizedBox(
              height: 20.0,
            ),
            FormTextBiasa(
              controller: caption,
              namaLabel: 'deskripsi',
              maxLines: 4,
            ),
            FormTextBiasa(
              namaLabel: 'tanggal',
              controller: edateTime,
            ),
            FormTextBiasa(
              namaLabel: 'news type',
              controller: newsType,
            ),
            FormTextBiasa(
              controller: eventLocation,
              namaLabel: 'nama tempat',
            ),
            FormTextBiasa(
              namaLabel: 'lokasi',
            ),
            // FormTextBiasa(
            //   namaLabel: 'format tiket',
            // ),
            buildTextTemplate('tiket'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: 'gratis',
                      groupValue: '',
                      onChanged: (String nilai) {
                        setState(() {});
                      },
                    ),
                    Text('gratis'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      onChanged: value,
                      value: 'donasi',
                      groupValue: '',
                    ),
                    Text('donasi'),
                  ],
                ),
              ],
            ),
            // Expanded(
            //   child: SyntaxView(
            //     code: _selectedValuesJson,
            //     syntax: Syntax.JAVASCRIPT,
            //     withLinesCount: false,
            //     syntaxTheme: SyntaxTheme.standard(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Padding buildFormTags() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlutterTagging<Kategori>(
        initialItems: _selectedKategoris,
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            // filled: true,
            // fillColor: Colors.green.withAlpha(30),
            hintText: "Masukkan Tags",
            labelText: "Tags",
          ),
        ),
        findSuggestions: KategoriService.getKategoris,
        additionCallback: (value) {
          return Kategori(
            name: value,
            position: 0,
          );
        },
        configureSuggestion: (kategori) {
          return SuggestionConfiguration(
            title: Text(kategori.name),
            subtitle: Text(kategori.position.toString()),
            additionWidget: Chip(
              avatar: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              label: Text('Tambahkan Tag'),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
              ),
              backgroundColor: Colors.green,
            ),
          );
        },
        configureChip: (kategori) {
          return ChipConfiguration(
            label: Text(kategori.name),
            backgroundColor: Colors.green,
            labelStyle: TextStyle(color: Colors.white),
            deleteIconColor: Colors.white,
          );
        },
        onChanged: () {
          setState(() {
            // _selectedValuesJson = _selectedKategoris
            //     .map<String>((kategori) => '\n${kategori.toJson()}')
            //     .toList()
            //     .toString();
            // _selectedValuesJson =
            //     _selectedValuesJson.replaceFirst('}]', '}\n]');
          });
        },
      ),
    );
  }
}

/// KategoriService

/// Kategori Class

// start ############# pilih Image ##############
