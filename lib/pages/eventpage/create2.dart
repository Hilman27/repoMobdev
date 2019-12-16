import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

import 'dart:async';

import 'package:religi_app/model/_model.dart';
import 'package:religi_app/pages/eventpage/detail.dart';
import 'package:religi_app/widget/_widgets.dart';
import 'package:image_picker/image_picker.dart';

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
class KategoriService {
  /// Mocks fetching Kategori from network API with delay of 500ms.
  static Future<List<Kategori>> getKategoris(String query) async {
    await Future.delayed(Duration(milliseconds: 500), null);
    return <Kategori>[
      Kategori(name: 'Pengajian', position: 1),
      Kategori(name: 'Ceramah', position: 2),
      Kategori(name: 'Sholat', position: 3),
      Kategori(name: 'Perayaan', position: 4),
      Kategori(name: 'Event', position: 5),
    ]
        .where((kategori) =>
            kategori.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

/// Kategori Class
class Kategori extends Taggable {
  ///
  final String name;

  ///
  final int position;

  /// Creates Kategori
  Kategori({
    this.name,
    this.position,
  });

  @override
  List<Object> get props => [name];

  /// Converts the class to json string.
  String toJson() => '''  {
    "name": $name,\n
    "position": $position\n
  }''';
}

// start ############# pilih Image ##############
class PilihImage extends StatefulWidget {
  @override
  _PilihImageState createState() => _PilihImageState();
}

class _PilihImageState extends State<PilihImage> {
  File _imageFile;
  dynamic _pickImageError;
  String _retrieveDataError;

  Future getImageCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imageFile = image;
    });
  }

  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  // width: 200,
                  child: _imageFile == null
                      ? new PlaceHolderImage()
                      : Image.file(_imageFile),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: getImageCamera,
                      tooltip: 'pilih foto',
                      icon: Icon(Icons.add_a_photo),
                    ),
                    IconButton(
                      onPressed: getImageGallery,
                      tooltip: 'pilih foto',
                      icon: Icon(Icons.image),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      return Image.file(_imageFile);
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
}

class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(child: buildTextTemplate('silahkan pilih gambar')),
        Image.asset('assets/images/placeholder-image-icon-14.jpg'),
      ],
    );
  }
}

class TEsttt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
