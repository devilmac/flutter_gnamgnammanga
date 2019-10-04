import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';

///Interface of agnostic manga service API.
abstract class MangaService {
  ///Get the list of all manga
  Future<List<Manga>> getMangaList(num selectedLanguage);

  ///Get the detail of the manga specified by the mangaID parameter
  Future<MangaDetail> getMangaDetail(String mangaID);

  ///Get the list of pages of the chapter using the chapterID parameter
  Future<List<ChapterImage>> getChapterDetail(String chapterID);
}
