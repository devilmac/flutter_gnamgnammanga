import 'package:flutter_app/src/domain/category.dart';
import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';

abstract class MangaDatabase {
  var dbName = "";
  var dbVersion = 1;

  /// Add/remove the manga to/from database
  Future<void> addRemoveToFavorites(Manga manga);

  /// Get manga favorites list
  Future<List<Manga>> getFavorites(num selectedLanguage);

  /// Get manga favorite from the specified mangaID
  Future<MangaDetail> getFavorite(String mangaID);

  /// Get chapters for the specific mangaID
  Future<List<Chapter>> getChapters(String mangaID);

  /// Get chapter pages for the specifi chapterID
  Future<List<ChapterImage>> getChapterDetail(String chapterID);

  /// Check if a mangaID is already into database or not
  Future<bool> isMangaFavorite(String mangaID);

  /// Check if a manga is up to date
  Future<bool> isMangaUpToDate(String mangaID, num lastChapterDate);

  /// Add a category to database
  Future<void> addCategory(Category category);

  /// Get manga categories
  Future<List<Category>> getCategories();
}
