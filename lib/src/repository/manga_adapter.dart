import 'package:flutter_app/src/domain/chapter.dart' as domain;
import 'package:flutter_app/src/domain/manga.dart' as domain;

abstract class MangaAdapter {
  Future<List<domain.Manga>> getMangaList();

  Future<domain.Manga> getMangaDetail(String mangaID);

  Future<domain.Chapter> getChapterDetail(String chapterID);
}
