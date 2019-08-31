import 'package:flutter_app/src/domain/manga.dart';

class MangaDetailArguments {
  final Manga _manga;

  MangaDetailArguments(this._manga);

  Manga get manga => _manga;
}
