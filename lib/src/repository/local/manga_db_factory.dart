import 'package:flutter_app/src/repository/local/manga_database.dart';

abstract class MangaDbAbstractFactory {
  MangaDatabase createMangaDatabase();
}
