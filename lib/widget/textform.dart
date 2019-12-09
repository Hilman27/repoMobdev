import 'package:flutter/material.dart';

class FormTextBiasa extends StatelessWidget {
  final namaLabel;
  final maxLines;

  const FormTextBiasa({Key key, this.namaLabel, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: namaLabel,
          hintText: 'masukkan $namaLabel'.toLowerCase(),
        ),
        maxLines: maxLines,
      ),
    );
  }
}
