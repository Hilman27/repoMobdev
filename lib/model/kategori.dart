import 'package:flutter_tagging/flutter_tagging.dart';

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
