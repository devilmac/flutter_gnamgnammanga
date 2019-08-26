import 'package:flutter_app/src/domain/chapter_image.dart' as domain;
import 'package:flutter_app/src/domain/manga.dart' as domain;

abstract class MangaAdapter {
  Future<List<domain.Manga>> getMangaList();

  Future<domain.Manga> getMangaDetail(String mangaID);

  Future<List<domain.ChapterImage>> getChapterDetail(String chapterID);
}
