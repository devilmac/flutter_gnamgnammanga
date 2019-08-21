import 'package:flutter_app/domain/manga.dart' as domain;

abstract class MangaAdapter {
  Future<List<domain.Manga>> getMangaList();

  Future<domain.Manga> getMangaDetail(String mangaID);
}
