import 'dart:convert';

import 'package:flutter_app/domain/chapter.dart' as domain;
import 'package:flutter_app/domain/manga.dart' as domain;
import 'package:flutter_app/domain/manga_language.dart';
import 'package:flutter_app/domain/manga_status.dart';
import 'package:flutter_app/repository/network/model/mangaeden/manga.dart'
    as network;
import 'package:flutter_app/repository/network/service/manga_service.dart';
import 'package:http/http.dart' as http;

const String BASE_URL = "https://www.mangaeden.com/api";
const String MANGA_LIST = "$BASE_URL/list/1/";

class MangaedenService extends MangaService {
  @override
  Future<List<domain.Manga>> getManga() async {
    final response = await http.get(MANGA_LIST);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
    }

    return null;
  }

  @override
  Future<domain.Manga> getMangaDetail(String mangaID) {
    // TODO: implement getMangaDetail
    return null;
  }

  domain.Manga _mapManga(network.Manga manga) {
    domain.Manga result = domain.Manga(
        manga.aka,
        manga.author,
        manga.categories,
        _mapChapters(manga.chapters),
        manga.chaptersLen,
        manga.description,
        manga.image,
        _mapLanguage(manga.language),
        manga.lastChapterDate,
        manga.released,
        _mapStatus(manga.status),
        manga.title);
    return result;
  }

  List<domain.Chapter> _mapChapters(List<List<dynamic>> chaptersFromNetwork) {
    var chapters = chaptersFromNetwork.map((List<dynamic> chapter) {
      return domain.Chapter(chapter[0] as double, chapter[1] as double,
          chapter[2] as String, chapter[3] as String);
    }).toList();

    return chapters;
  }

  String _mapStatus(int status) {
    return mangaStatus[status];
  }

  String _mapLanguage(int language) {
    return mangaLanguage[language];
  }
}
