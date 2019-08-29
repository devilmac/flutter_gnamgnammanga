import 'package:flutter_app/src/domain/manga.dart';

abstract class MangaDatabase {
  var dbName = "";
  var dbVersion = 1;

  ///Add/remove the manga to/from database
  Future<dynamic> addRemoveToFavorites(Manga manga);

  ///Get manga favorites list
  Future<List<dynamic>> getFavorites();

  ///Get chapters for the specific mangaID
  Future<List<dynamic>> getChapters(String mangaID);

  ///Get chapter pages for the specifi chapterID
  Future<dynamic> getChapterDetail(String chapterID);

  Future<dynamic> isMangaFavorite(String mangaID);
}
