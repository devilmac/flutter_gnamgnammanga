import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart' as domain;
import 'package:flutter_app/src/repository/local/manga_db_factory.dart';

import '../manga_adapter.dart';
import 'manga_database.dart';

class MangaDbAdapter implements MangaAdapter {
  final MangaDbAbstractFactory dbFactory;

  MangaDatabase _database;

  MangaDbAdapter(this.dbFactory) {
    _database = dbFactory.createMangaDatabase();
  }

  @override
  Future<List<domain.Manga>> getMangaList() {
    return _database.getFavorites();
  }

  @override
  Future<domain.Manga> getMangaDetail(String mangaID) {
    throw UnsupportedError("Unneeded operation");
  }

  @override
  Future<List<ChapterImage>> getChapterDetail(String chapterID) {}
}
