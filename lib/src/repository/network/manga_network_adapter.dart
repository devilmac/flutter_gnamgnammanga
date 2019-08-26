import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/manga.dart' as domain;

import '../manga_adapter.dart';
import 'service/manga_service.dart';

class MangaNetworkAdapter implements MangaAdapter {
  final MangaService _mangaService;

  MangaNetworkAdapter(this._mangaService);

  @override
  Future<List<domain.Manga>> getMangaList() async {
    return _mangaService.getManga();
  }

  @override
  Future<domain.Manga> getMangaDetail(String mangaID) async {
    return _mangaService.getMangaDetail(mangaID);
  }

  @override
  Future<Chapter> getChapterDetail(String chapterID) async {
    return _mangaService.getChapterDetail(chapterID);
  }
}
