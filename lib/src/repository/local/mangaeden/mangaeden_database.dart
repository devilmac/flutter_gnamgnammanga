import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/repository/local/manga_database.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';
import 'package:flutter_app/src/repository/local/sqlite_util.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///Mangaeden specific database implementation
class MangaedenDatabase extends MangaDatabase {
  @override
  String get dbName => "mangaeden.db";

  @override
  int get dbVersion => 1;

  Database _db;

  @override
  Future<List<Manga>> getFavorites() async {
    await _openDatabase();

    List<Map<String, dynamic>> query =
        await _db.query(SqliteUtilMangaeden.MANGA_TABLE_NAME, columns: null);

    _db.close();

    if (query.isNotEmpty) {
      return query.map((Map map) {
        return Manga.fromMap(map);
      }).toList();
    }

    return null;
  }

  @override
  Future<Manga> addRemoveToFavorites(Manga manga) async {
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
      }

      //case no
      else {
        await transaction.insert(
            SqliteUtilMangaeden.MANGA_TABLE_NAME, manga.toMap());
      }
    });

    _db.close();

    return null;
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
      return query.map((Map map) {
        return Chapter.fromMap(map);
      }).toList();
    }

    return null;
  }

  @override
  Future<ChapterImage> getChapterDetail(String chapterID) async {
    await _openDatabase();

    var query = await _db.query(SqliteUtilMangaeden.CHAPTER_IMAGE_TABLE_NAME,
        columns: null,
        where: "${SqliteUtilMangaeden.CHAPTER_IMAGE_CHAPTER_ID_COLUMN} = ?",
        whereArgs: [chapterID]);

    if (query.isNotEmpty && query.length == 1) {
      return ChapterImage.fromMap(query[0]);
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

    if (query.isNotEmpty && query.length == 1) {
      var manga = Manga.fromMap(query[0]);

      return manga != null;
    }

    return false;
  }

  Future<void> _openDatabase() async {
    _db = await openDatabase(join(await _getDatabasePath(), dbName),
        version: dbVersion, onCreate: _onCreate, onConfigure: _onConfigure);
  }

  Future<String> _getDatabasePath() async {
    return await getDatabasesPath();
  }

  _onCreate(Database db, int version) async {
    await db.transaction((transaction) async {
      transaction.execute(SqliteUtilMangaeden.createMangaTable);
      transaction.execute(SqliteUtilMangaeden.createChapterTable);
      transaction.execute(SqliteUtilMangaeden.createChapterImageTable);
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
}
