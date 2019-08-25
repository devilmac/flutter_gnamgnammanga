import 'dart:convert';

import 'package:flutter_app/src/domain/chapter.dart' as domain;
import 'package:flutter_app/src/domain/manga.dart' as domain;
import 'package:flutter_app/src/domain/manga_language.dart';
import 'package:flutter_app/src/domain/manga_status.dart';
import 'package:flutter_app/src/repository/network/model/mangaeden/manga.dart'
    as network;
import 'package:flutter_app/src/repository/network/service/manga_service.dart';
import 'package:http/http.dart' as http;

const String BASE_URL = "https://www.mangaeden.com/api";
const String MANGA_LIST = "$BASE_URL/list/1/";
const String MANGA_DETAIL = "$BASE_URL/manga/";

String baseImageUrl = "https://cdn.mangaeden.com/mangasimg/";

class MangaedenService extends MangaService {
  @override
  Future<List<domain.Manga>> getManga() async {
    List<domain.Manga> result;

    final response = await http.get(MANGA_LIST);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      var mangaList = body["manga"] as List;

      var mappedList =
          mangaList.map((json) => network.Manga.fromJson(json)).toList();

      result =
          mappedList.map((networkManga) => _mapManga(networkManga)).toList();
    }

    return result;
  }

  @override
  Future<domain.Manga> getMangaDetail(String mangaID) async {
    domain.Manga result;

    final response = await http.get("$MANGA_DETAIL$mangaID");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      var manga = network.Manga.fromJson(body);

      result = _mapManga(manga);
    }

    return result;
  }

  domain.Manga _mapManga(network.Manga manga) {
    domain.Manga result = domain.Manga(
        mangaID: manga.mangaID,
        aka: manga.aka,
        author: manga.author,
        categories: manga.c != null ? manga.c : manga.categories,
        chapters: _mapChapters(manga.chapters),
        chaptersLen: manga.chaptersLen,
        description: manga.description,
        image: _mapImage(manga.image),
        language: _mapLanguage(manga.language),
        lastChapterDate: manga.ld != null ? manga.ld : manga.lastChapterDate,
        released: manga.released,
        status: _mapStatus(manga.status),
        title: manga.t != null ? manga.t : manga.title);
    return result;
  }

  List<domain.Chapter> _mapChapters(List<List<dynamic>> chaptersFromNetwork) {
    var chapters = chaptersFromNetwork?.map((List<dynamic> chapter) {
      return domain.Chapter(chapter[0].toString(), chapter[1] as double,
          chapter[2] as String, chapter[3] as String);
    })?.toList();

    return chapters;
  }

  String _mapStatus(int status) {
    return mangaStatus[status];
  }

  String _mapLanguage(int language) {
    return mangaLanguage[language];
  }

  String _mapImage(String image) {
    String result;

    if (image != null) {
      result = "$baseImageUrl$image";
    }

    return result;
  }
}
