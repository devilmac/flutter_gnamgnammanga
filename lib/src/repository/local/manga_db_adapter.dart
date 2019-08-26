import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/manga.dart' as domain;

import '../manga_adapter.dart';
import 'manga_database.dart';

class MangaDbAdapter implements MangaAdapter {
  MangaDatabase _mangaDatabase;

  @override
  Future<List<domain.Manga>> getMangaList() {
    return null;
  }

  @override
  Future<domain.Manga> getMangaDetail(String mangaID) {
    return null;
  }

  @override
  Future<Chapter> getChapterDetail(String chapterID) {
    return null;
  }
}
