import 'package:flutter_app/src/repository/local/manga_database.dart';
import 'package:flutter_app/src/repository/local/manga_db_factory.dart';
import 'package:flutter_app/src/repository/local/mangaeden/mangaeden_database.dart';

class MangaEdenDbFactory implements MangaDbAbstractFactory {
  @override
  MangaDatabase createMangaDatabase() {
    return MangaedenDatabase();
  }
}
