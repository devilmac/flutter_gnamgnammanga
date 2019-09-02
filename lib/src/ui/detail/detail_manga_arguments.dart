import 'package:flutter_app/src/domain/manga.dart';

class DetailMangaArguments {
  final Manga _manga;

  DetailMangaArguments(this._manga);

  Manga get manga => _manga;
}
