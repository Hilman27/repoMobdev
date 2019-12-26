import 'package:religi_app/model/_model.dart';

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
