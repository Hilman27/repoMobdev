import 'package:flutter/material.dart';

class FormTextBiasa extends StatelessWidget {
  final namaLabel;
  final maxLines;
  final controller;
  final tipeInput;

  const FormTextBiasa(
      {Key key, this.namaLabel, this.maxLines, this.controller, this.tipeInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        keyboardType: tipeInput ?? TextInputType.text,
        controller: controller,
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
