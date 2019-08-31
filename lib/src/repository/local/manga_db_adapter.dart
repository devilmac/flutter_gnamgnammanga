import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
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
  Future<List<Manga>> getMangaList() {
    return _database.getFavorites();
  }

  @override
  Future<MangaDetail> getMangaDetail(String mangaID) {
    return _database.getFavorite(mangaID);
  }

  @override
  Future<List<ChapterImage>> getChapterDetail(String chapterID) {
    return _database.getChapterDetail(chapterID);
  }

  Future<void> addRemoveMangaFavorite(Manga manga) {
    _database.addRemoveToFavorites(manga);
  }

  Future<bool> isMangaFavorite(String mangaID) {
    return _database.isMangaFavorite(mangaID);
  }
}
