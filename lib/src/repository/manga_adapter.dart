import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';

abstract class MangaAdapter {
  Future<List<Manga>> getMangaList(num selectedLanguage);

  Future<MangaDetail> getMangaDetail(String mangaID);

  Future<List<ChapterImage>> getChapterDetail(String chapterID);
}
