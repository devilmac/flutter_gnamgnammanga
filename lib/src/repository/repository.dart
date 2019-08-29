import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/repository/local/manga_db_adapter.dart';
import 'package:flutter_app/src/repository/local/mangaeden/mangaeden_db_factory.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';

class Repository {
  final MangaNetworkAdapter _mangaNetworkAdapter =
      MangaNetworkAdapter(MangaedenService());
  final MangaDbAdapter _mangaDbAdapter = MangaDbAdapter(MangaEdenDbFactory());

  Future<List<Manga>> getAllManga() async =>
      await _mangaNetworkAdapter.getMangaList();

  Future<List<Manga>> getFavorites() async =>
      await _mangaDbAdapter.getMangaList();

  Future<Manga> getMangaDetail(String mangaID) async {
    //before check if manga is saved into the database
    var isMangaFavorite = await _mangaDbAdapter.isMangaFavorite(mangaID);

    if (isMangaFavorite) {
      return await _mangaDbAdapter.getMangaDetail(mangaID);
    } else {
      return await _mangaNetworkAdapter.getMangaDetail(mangaID);
    }
  }

  Future<List<ChapterImage>> getChapterDetail(String chapterID) async {
    //before check if chapter is already saved into the database
    var chapterPages = await _mangaDbAdapter.getChapterDetail(chapterID);

    if (chapterPages.isNotEmpty && chapterPages.length == 1) {
      return chapterPages;
    } else {
      return await _mangaNetworkAdapter.getChapterDetail(chapterID);
    }
  }

  Future<void> addRemoveFavoriteManga(Manga manga) async {
    await _mangaDbAdapter.addRemoveMangaFavorite(manga);
  }
}
