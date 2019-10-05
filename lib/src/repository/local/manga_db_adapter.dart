import 'package:flutter_app/src/domain/category.dart';
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/domain/manga_language.dart'
    as languageConverter;
import 'package:flutter_app/src/repository/local/manga_db_factory.dart';
import 'package:flutter_app/src/repository/local/sqlite_util.dart';

import '../manga_adapter.dart';
import 'manga_database.dart';

class MangaDbAdapter implements MangaAdapter {
  final MangaDbAbstractFactory _dbFactory;
  final sqlType _type;

  MangaDatabase _database;

  MangaDbAdapter(this._dbFactory, this._type) {
    _database = _dbFactory.createMangaDatabase(_type);
  }

  @override
  Future<List<Manga>> getMangaList(num selectedLanguage) =>
      _database.getFavorites(selectedLanguage);

  @override
  Future<MangaDetail> getMangaDetail(String mangaID) =>
      _database.getFavorite(mangaID);

  @override
  Future<List<ChapterImage>> getChapterDetail(String chapterID) =>
      _database.getChapterDetail(chapterID);

  Future<void> addRemoveMangaFavorite(Manga manga) =>
      _database.addRemoveToFavorites(manga);

  Future<bool> isMangaFavorite(String mangaID) =>
      _database.isMangaFavorite(mangaID);

  Future<bool> isMangaUpToDate(String mangaID, num lastChapterDate) =>
      _database.isMangaUpToDate(mangaID, lastChapterDate);

  void addCategories(List<Category> categories) {
    _database.addCategory(categories);
  }

  Future<List<Category>> getCategories(String selectedLanguage) =>
      _database.getCategories(selectedLanguage);
}
