import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/local/manga_db_factory.dart';
import 'package:flutter_app/src/repository/local/sqlite_util.dart';
import 'package:flutter_app/src/domain/category.dart';

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
  Future<List<Manga>> getMangaList(num selectedLanguage) {
    return _database.getFavorites(selectedLanguage);
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
    return _database.addRemoveToFavorites(manga);
  }

  Future<bool> isMangaFavorite(String mangaID) {
    return _database.isMangaFavorite(mangaID);
  }

  Future<bool> isMangaUpToDate(String mangaID, num lastChapterDate) {
    return _database.isMangaUpToDate(mangaID, lastChapterDate);
  }

  void addCategories(List<String> categories) {
    categories.forEach((category){
      return _database.addCategory(Category(category));
    });
  }
}
