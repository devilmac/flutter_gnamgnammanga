import 'package:flutter_app/src/repository/local/manga_database.dart';
import 'package:flutter_app/src/repository/local/manga_db_factory.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqflite/mangaeden_database.dart';
import 'package:flutter_app/src/repository/local/sqlite_util.dart';

class MangaEdenDbFactory implements MangaDbAbstractFactory {
  @override
  MangaDatabase createMangaDatabase(sqlType type) {
    switch (type) {
      case sqlType.sqflite:
        return MangaedenDatabase();
        break;

      case sqlType.moor:
        return null;
        break;

      default:
        throw ArgumentError("Invalid SQL type");
    }
  }
}
