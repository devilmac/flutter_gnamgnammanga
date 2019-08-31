///Interface of agnostic manga service API.
abstract class MangaService {
  ///Get the list of all manga
  Future<List<dynamic>> getManga();

  ///Get the detail of the manga specified by the mangaID parameter
  Future<dynamic> getMangaDetail(String mangaID);

  ///Get the list of pages of the chapter using the chapterID parameter
  Future<dynamic> getChapterDetail(String chapterID);
}
