import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/local/manga_db_adapter.dart';
import 'package:flutter_app/src/repository/local/mangaeden/mangaeden_db_factory.dart';
import 'package:flutter_app/src/repository/local/sqlite_util.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';
import 'package:http/http.dart';

import 'manga_adapter.dart';

class Repository {
  final MangaAdapter _mangaNetworkAdapter =
      MangaNetworkAdapter(MangaedenService(Client()));
  final MangaDbAdapter _mangaDbAdapter =
      MangaDbAdapter(MangaEdenDbFactory(), sqlType.sqflite);

  Future<List<Manga>> getAllManga(num selectedLanguage) async =>
      await _mangaNetworkAdapter.getMangaList(selectedLanguage);

  Future<List<Manga>> getFavorites(num selectedLanguage) async =>
      await _mangaDbAdapter.getMangaList(selectedLanguage);

  Future<MangaDetail> getMangaDetail(String mangaID) async {
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

    if (chapterPages != null && chapterPages.isNotEmpty) {
      return chapterPages;
    } else {
      return await _mangaNetworkAdapter.getChapterDetail(chapterID);
    }
  }

  Future<void> addRemoveFavoriteManga(Manga manga) async {
    await _mangaDbAdapter.addRemoveMangaFavorite(manga);
  }

  Future<bool> isMangaFavorite(String mangaID) async =>
      await _mangaDbAdapter.isMangaFavorite(mangaID);
}
