import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/src/domain/chapter.dart' as domain;
import 'package:flutter_app/src/domain/chapter_image.dart' as domain;
import 'package:flutter_app/src/domain/manga.dart' as domain;
import 'package:flutter_app/src/domain/manga_language.dart';
import 'package:flutter_app/src/domain/manga_status.dart';
import 'package:flutter_app/src/helper/configuration.dart' as configuration;
import 'package:flutter_app/src/repository/network/model/mangaeden/chapter.dart'
    as network;
import 'package:flutter_app/src/repository/network/model/mangaeden/manga.dart'
    as network;
import 'package:flutter_app/src/repository/network/service/manga_service.dart';
import 'package:http/http.dart' as http;

const String BASE_URL = "https://www.mangaeden.com/api";
String mangaList = "$BASE_URL/list/${configuration.mangaLanguage}";
const String MANGA_DETAIL = "$BASE_URL/manga/";
const String CHAPTER_DETAIL = "$BASE_URL/chapter/";

String baseImageUrl = "https://cdn.mangaeden.com/mangasimg/";

List<domain.Manga> manageGetMangaListResponse(String responseBody) {
  List<domain.Manga> result;

  var body = json.decode(responseBody);

  var mangaList = body["manga"] as List;

  var mappedList =
      mangaList.map((json) => network.Manga.fromJson(json)).toList();

  result = mappedList
      .map((networkManga) => _mapManga(networkManga))
      .toSet()
      .toList();

  return result;
}

domain.Manga manageGetMangaDetailResponse(String responseBody) {
  domain.Manga result;

  var body = json.decode(responseBody);

  var manga = network.Manga.fromJson(body);

  result = _mapManga(manga);

  return result;
}

List<domain.ChapterImage> manageGetChapterDetailResponse(String responseBody) {
  List<domain.ChapterImage> result;

  var body = json.decode(responseBody);

  var chapter = network.Chapter.fromJson(body);

  result = _mapChapterDetail(chapter.images);

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

List<domain.ChapterImage> _mapChapterDetail(List<List<dynamic>> chapterImages) {
  var images = chapterImages?.map((element) {
    return domain.ChapterImage(element[0] as int, _mapImage(element[1]),
        element[2] as int, element[3] as int);
  })?.toList();

  return images;
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

class MangaedenService extends MangaService {
  @override
  Future<List<domain.Manga>> getManga() async {
    final response = await http.get(mangaList);

    if (response.statusCode == 200) {
      return compute(manageGetMangaListResponse, response.body);
    }

    return null;
  }

  @override
  Future<domain.Manga> getMangaDetail(String mangaID) async {
    final response = await http.get("$MANGA_DETAIL$mangaID");

    if (response.statusCode == 200) {
      return compute(manageGetMangaDetailResponse, response.body);
    }

    return null;
  }

  @override
  Future<List<domain.ChapterImage>> getChapterDetail(String chapterID) async {
    var response = await http.get("$CHAPTER_DETAIL$chapterID");

    if (response.statusCode == 200) {
      return compute(manageGetChapterDetailResponse, response.body);
    }

    return null;
  }
}
