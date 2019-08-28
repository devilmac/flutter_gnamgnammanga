import 'dart:io';

import 'package:flutter_app/src/repository/local/manga_database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MangaedenDatabase extends MangaDatabase {
  @override
  String get dbName => "mangaeden.db";

  @override
  int get dbVersion => 1;

  Database _db;

  @override
  Future getLanguage() {
    return null;
  }

  Future<String> _getDatabasePath() async {
    return await getDatabasesPath();
  }

  Future<void> _openDatabase() async {
    _db = await openDatabase(join(await _getDatabasePath(), dbName),
        singleInstance: true, version: dbVersion);
  }

  @override
  Future<void> closeDatabase() async {
    await _db.close();
  }
}
