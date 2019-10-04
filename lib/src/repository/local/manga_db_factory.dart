import 'package:flutter_app/src/repository/local/manga_database.dart';
import 'package:flutter_app/src/repository/local/sqlite_util.dart';

abstract class MangaDbAbstractFactory {
  MangaDatabase createMangaDatabase(sqlType type);
}
