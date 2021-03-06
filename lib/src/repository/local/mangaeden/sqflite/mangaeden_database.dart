import 'package:flutter_app/src/domain/category.dart';
import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/local/manga_database.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqflite/sqlite_util.dart';
import 'package:flutter_app/src/repository/local/sqlite_util.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///Mangaeden specific database implementation
class MangaedenDatabase extends MangaDatabase {
  @override
  String get dbName => "mangaeden.db";

  @override
  int get dbVersion => 3;

  Database _db;

  @override
  Future<List<Manga>> getFavorites(num selectedLanguage) async {
    await _openDatabase();

    List<Map<String, dynamic>> query =
        await _db.query(SqliteUtilMangaeden.MANGA_TABLE_NAME, columns: null);

    _db.close();

    if (query.isNotEmpty) {
      return query.map((Map map) => Manga.fromMap(map)).toList();
    }

    return null;
  }

  @override
  Future<MangaDetail> getFavorite(String mangaID) async {
    await _openDatabase();

    var mangaDetail = await _db.transaction((transaction) async {
      var query = await transaction.query(SqliteUtilMangaeden.MANGA_TABLE_NAME,
          where: "${SqliteUtilMangaeden.MANGA_ID_COLUMN} = ?",
          whereArgs: [mangaID]);

      if (query.isNotEmpty && query.length == 1) {
        var manga = Manga.fromMap(query[0]);

        var queryChapters = await transaction.query(
            SqliteUtilMangaeden.CHAPTER_TABLE_NAME,
            where: "${SqliteUtilMangaeden.CHAPTER_MANGA_ID_COLUMN} = ?",
            whereArgs: [mangaID]);

        if (queryChapters.isNotEmpty) {
          var chapters =
              queryChapters.map((map) => Chapter.fromMap(map)).toList();

          manga = Manga.copyWithMangaDetail(
              manga, MangaDetail.copyWithChapters(manga.mangaDetail, chapters));
        }

        return manga.mangaDetail;
      }

      return null;
    });

    _db.close();

    return mangaDetail;
  }

  @override
  Future<void> addRemoveToFavorites(Manga manga) async {
    await _openDatabase();

    await _db.transaction((transaction) async {
      //check if manga parameter is already into database
      List<Map<String, dynamic>> query = await transaction.query(
          SqliteUtilMangaeden.MANGA_TABLE_NAME,
          where: "${SqliteUtilMangaeden.MANGA_ID_COLUMN} = ?",
          whereArgs: [manga.mangaID]);

      //case yes
      if (query.isNotEmpty && query.length == 1) {
        await transaction.delete(SqliteUtilMangaeden.MANGA_TABLE_NAME,
            where: "${SqliteUtilMangaeden.MANGA_ID_COLUMN} = ?",
            whereArgs: [manga.mangaID]);

        return null;
      }

      //case no
      else {
        await transaction.insert(
            SqliteUtilMangaeden.MANGA_TABLE_NAME, manga.toMap());

        manga.mangaDetail.chapters.forEach((chapter) async {
          await transaction.insert(
              SqliteUtilMangaeden.CHAPTER_TABLE_NAME, chapter.toMap());
        });
      }
    });

    _db.close();
  }

  @override
  Future<List<Chapter>> getChapters(String mangaID) async {
    await _openDatabase();

    var query = await _db.query(SqliteUtilMangaeden.CHAPTER_TABLE_NAME,
        columns: null,
        where: "${SqliteUtilMangaeden.CHAPTER_MANGA_ID_COLUMN} = ?",
        whereArgs: [mangaID]);

    _db.close();

    if (query.isNotEmpty) {
      return query.map((Map map) => Chapter.fromMap(map)).toList();
    }

    return null;
  }

  @override
  Future<List<ChapterImage>> getChapterDetail(String chapterID) async {
    await _openDatabase();

    var query = await _db.query(SqliteUtilMangaeden.CHAPTER_IMAGE_TABLE_NAME,
        columns: null,
        where:
            "${SqliteUtilMangaeden.CHAPTER_IMAGE_CHAPTER_ID_COLUMN} = ? ORDER BY ${SqliteUtilMangaeden.CHAPTER_PAGE_NUMBER_COLUMN} ASC",
        whereArgs: [chapterID]);

    if (query.isNotEmpty && query.length == 1) {
      var pages = query.map((map) => ChapterImage.fromMap(map)).toList();

      return pages;
    }

    _db.close();

    return null;
  }

  @override
  Future<bool> isMangaFavorite(String mangaID) async {
    await _openDatabase();

    var query = await _db.query(SqliteUtilMangaeden.MANGA_TABLE_NAME,
        columns: [SqliteUtilMangaeden.MANGA_ID_COLUMN],
        where: "${SqliteUtilMangaeden.MANGA_ID_COLUMN} = ?",
        whereArgs: [mangaID]);

    _db.close();

    return query.isNotEmpty && query.length == 1;
  }

  @override
  Future<bool> isMangaUpToDate(String mangaID, num lastChapterDate) async {
    await _openDatabase();

    var query = await _db.query(SqliteUtilMangaeden.MANGA_TABLE_NAME,
        columns: [
          SqliteUtilMangaeden.MANGA_ID_COLUMN,
          SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN
        ],
        where: "${SqliteUtilMangaeden.MANGA_ID_COLUMN} = ?",
        whereArgs: [mangaID]);

    _db.close();

    if (query.isNotEmpty && query.length == 1) {
      var manga = Manga.fromMap(query[0]);

      if (manga.lastChapterDate.compareTo(lastChapterDate).isNegative) {
        return false;
      }
    }

    return true;
  }

  @override
  Future<void> addCategory(List<Category> categories) async {
    await _openDatabase();

//    categories.forEach((category) async {
//      await _db.transaction((transaction) async {
//        var batch = transaction.batch();
//        batch.insert(SqliteUtilMangaeden.CATEGORY_TABLE_NAME, category.toMap());
//        batch.commit();
//      });
//    });

    _db.close();
  }

  @override
  Future<List<Category>> getCategories(String selectedLanguage) async {
    await _openDatabase();

    var query = await _db.query(SqliteUtilMangaeden.CATEGORY_TABLE_NAME,
        columns: [
          SqliteUtilMangaeden.CATEGORY_ID_COLUMN,
          SqliteUtilMangaeden.CATEGORY_NAME_COLUMN
        ],
        where: "${SqliteUtilMangaeden.CATEGORY_LANGUAGE_COLUMN} = ?",
        whereArgs: [selectedLanguage]);

    if (query.isNotEmpty) {
      var categories = query.map((map) => Category.fromMap(map));
      return categories;
    }

    return null;
  }

  Future<void> _openDatabase() async {
    _db = await openDatabase(join(await _getDatabasePath(), dbName),
        version: dbVersion,
        onCreate: _onCreate,
        onConfigure: _onConfigure,
        onUpgrade: _onUpgrade);
  }

  Future<String> _getDatabasePath() async {
    return await getDatabasesPath();
  }

  _onCreate(Database db, int version) async {
    await db.transaction((transaction) async {
      transaction.execute(SqliteUtilMangaeden.createMangaTable);
      transaction.execute(SqliteUtilMangaeden.createChapterTable);
      transaction.execute(SqliteUtilMangaeden.createChapterImageTable);
      transaction.execute(SqliteUtilMangaeden.createCategoryTable);
    });
  }

  _onConfigure(Database db) async {
    await db.transaction((transaction) async {
      var batch = transaction.batch();
      // Add support for cascade delete
      batch.execute(SqliteUtil.SQL_PRAGMA_FOREIGN_KEY);
      batch.commit(noResult: true, continueOnError: false);
    });
  }

  _onUpgrade(Database db, int version, int oldVersion) async {
    if (oldVersion == 1 && version == 2) {
      await db
          .rawQuery(SqliteUtilMangaeden.alterMangaDetailTableChangeStatusType);
    }
  }
}
