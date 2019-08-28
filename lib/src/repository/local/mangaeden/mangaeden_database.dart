import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/repository/local/manga_database.dart';
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
    _openDatabase();

    List<Map<String, dynamic>> query = await _db.query("manga", columns: null);

    _db.close();

    if (query.isNotEmpty) {
      return query.map((Map map) {
        return Manga.fromMap(map);
      }).toList();
    }

    return null;
  }

  @override
  Future<Manga> addRemoveToFavorites(String mangaID) {
    _db.close();

    return null;
  }

  @override
  Future<List<dynamic>> getChapters(String mangaID) {
    _db.close();

    return null;
  }

  @override
  Future<dynamic> getChapterDetail(String chapterID) {
    _db.close();

    return null;
  }

  Future<void> _openDatabase() async {
    _db = await openDatabase(join(await _getDatabasePath(), dbName),
        version: dbVersion, onConfigure: _onConfigure);
  }

  Future<String> _getDatabasePath() async {
    return await getDatabasesPath();
  }

  _onConfigure(Database db) async {
    // Add support for cascade delete

    await db.transaction((transaction) async {
      var batch = transaction.batch();
      batch.execute("PRAGMA foreign_keys = ON");
      batch.execute("CREATE TABLE manga (manga_id TEXT PRIMARY KEY, "
          "aka TEXT, "
          "author TEXT, "
          "categories TEXT, "
          "description TEXT, "
          "image TEXT, "
          "language TEXT, "
          "last_chapter_date REAL, "
          "released INTEGER, "
          "status TEXT, "
          "title TEXT)");
      batch.execute("CREATE TABLE chapter(chapter_id TEXT PRIMARY KEY, "
          "number TEXT, "
          "date REAL, "
          "title TEXT,"
          "mangaID TEXT NOT NULL,"
          "FOREIGN KEY(mangaID) REFERENCES manga(mangaID) ON DELETE CASCADE");
      batch.execute("CREATE TABLE chapter_image(page_number INTEGER, "
          "imageUrl TEXT, "
          "width INTEGER, "
          "height INTEGER, "
          "chapter_id TEXT,"
          "FOREIGN KEY(chapter_id) REFERENCES chapter(chapter_id) ON DELETE CASCADE");
    });
  }
}
