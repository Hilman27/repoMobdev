import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

import 'dart:async';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
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
  List<Language> _selectedLanguages;

  @override
  void initState() {
    _selectedLanguages = [];
    super.initState();
  }

  @override
  void dispose() {
    _selectedLanguages.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(
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
              namaLabel: 'judul',
            ),

            buildFormTags(),
            SizedBox(
              height: 20.0,
            ),
            FormTextBiasa(
              namaLabel: 'deskripsi',
              maxLines: 4,
            ),
            FormTextBiasa(
              namaLabel: 'agenda',
              maxLines: 4,
            ),
            FormTextBiasa(
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
      child: FlutterTagging<Language>(
        initialItems: _selectedLanguages,
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
        findSuggestions: LanguageService.getLanguages,
        additionCallback: (value) {
          return Language(
            name: value,
            position: 0,
          );
        },
        configureSuggestion: (lang) {
          return SuggestionConfiguration(
            title: Text(lang.name),
            subtitle: Text(lang.position.toString()),
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
        configureChip: (lang) {
          return ChipConfiguration(
            label: Text(lang.name),
            backgroundColor: Colors.green,
            labelStyle: TextStyle(color: Colors.white),
            deleteIconColor: Colors.white,
          );
        },
        onChanged: () {
          setState(() {
            // _selectedValuesJson = _selectedLanguages
            //     .map<String>((lang) => '\n${lang.toJson()}')
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

/// LanguageService
class LanguageService {
  /// Mocks fetching language from network API with delay of 500ms.
  static Future<List<Language>> getLanguages(String query) async {
    await Future.delayed(Duration(milliseconds: 500), null);
    return <Language>[
      Language(name: 'Pengajian', position: 1),
      Language(name: 'Ceramah', position: 2),
      Language(name: 'Sholat', position: 3),
      Language(name: 'Perayaan', position: 4),
      Language(name: 'Event', position: 5),
    ]
        .where((lang) => lang.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

/// Language Class
class Language extends Taggable {
  ///
  final String name;

  ///
  final int position;

  /// Creates Language
  Language({
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
                      ? Container(
                          color: Colors.grey,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: Center(child: Text('Silahkan pilih Gambar')),
                        )
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
