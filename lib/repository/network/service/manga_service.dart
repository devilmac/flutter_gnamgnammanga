abstract class MangaService {
  Future<List<dynamic>> getManga();

  Future<dynamic> getMangaDetail(String mangaID);
}
