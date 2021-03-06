import 'dart:convert';

import 'package:flutter_app/src/domain/chapter.dart' as domain;
import 'package:flutter_app/src/domain/chapter_image.dart' as domain;
import 'package:flutter_app/src/domain/manga.dart' as domain;
import 'package:flutter_app/src/domain/manga_detail.dart' as domain;
import 'package:flutter_app/src/domain/manga_language.dart';
import 'package:flutter_app/src/domain/manga_status.dart';
import 'package:flutter_app/src/repository/network/model/mangaeden/chapter.dart'
    as network;
import 'package:flutter_app/src/repository/network/model/mangaeden/manga.dart'
    as network;
import 'package:flutter_app/src/repository/network/model/mangaeden/manga_detail.dart'
    as network;
import 'package:flutter_app/src/repository/network/service/manga_service.dart';
import 'package:http/http.dart' as http;

const String BASE_URL = "https://www.mangaeden.com/api";
const String MANGA_LIST = "$BASE_URL/list/";
const String MANGA_DETAIL = "$BASE_URL/manga/";
const String CHAPTER_DETAIL = "$BASE_URL/chapter/";

String baseImageUrl = "https://cdn.mangaeden.com/mangasimg/";

domain.Manga _mapManga(network.Manga manga) {
  domain.Manga result = domain.Manga(
      mangaID: manga.i,
      categories: manga.c,
      image: _mapImage(manga.im),
      lastChapterDate: manga.ld,
      title: manga.t);
  return result;
}

domain.MangaDetail _mapMangaDetail(network.MangaDetail mangaDetail) {
  domain.MangaDetail result = domain.MangaDetail(
      lastChapterDate: mangaDetail.lastChapterDate,
      categories: mangaDetail.categories,
      aka: mangaDetail.aka,
      author: mangaDetail.author,
      description: mangaDetail.description,
      chapters: _mapChapters(mangaDetail.chapters),
      language: _mapLanguage(mangaDetail.language),
      released: mangaDetail.released,
      status: mangaDetail.status == 1
          ? mangaStatus.IN_PROGRESS
          : mangaStatus.COMPLETED);
  return result;
}

List<domain.Chapter> _mapChapters(List<List<dynamic>> chaptersFromNetwork) {
  var chapters = chaptersFromNetwork?.map((List<dynamic> chapter) {
    return domain.Chapter(
        number: chapter[0].toString(),
        date: chapter[1] as double,
        title: chapter[2] as String,
        chapterID: chapter[3] as String);
  })?.toList();

  return chapters;
}

List<domain.ChapterImage> _mapChapterDetail(List<List<dynamic>> chapterImages) {
  var images = chapterImages?.map((element) {
    return domain.ChapterImage(
        page: element[0] as int,
        imageUrl: _mapImage(element[1]),
        height: element[2] as int,
        width: element[3] as int);
  })?.toList();

  return List.from(images.reversed);
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
  final http.Client _client;

  MangaedenService(this._client);

  @override
  Future<List<domain.Manga>> getMangaList(num selectedLanguage) async {
    final response = await _client.get("$MANGA_LIST$selectedLanguage");

    if (response.statusCode == 200) {
      List<domain.Manga> result;

      try {
        var body = jsonDecode(response.body);

        var mangaList = body["manga"] as List;

        var mappedList =
            mangaList.map((json) => network.Manga.fromJson(json)).toList();

        result = mappedList
            .map((networkManga) => _mapManga(networkManga))
            .toSet()
            .toList();
      } on FormatException {}

      return result;
    }

    return null;
  }

  @override
  Future<domain.MangaDetail> getMangaDetail(String mangaID) async {
    final response = await _client.get("$MANGA_DETAIL$mangaID");

    if (response.statusCode == 200) {
      domain.MangaDetail result;

      try {
        var body = jsonDecode(response.body);

        var mangaDetail = network.MangaDetail.fromJson(body);

        result = _mapMangaDetail(mangaDetail);
      } on FormatException {}

      return result;
    }

    return null;
  }

  @override
  Future<List<domain.ChapterImage>> getChapterDetail(String chapterID) async {
    var response = await _client.get("$CHAPTER_DETAIL$chapterID");

    if (response.statusCode == 200) {
      List<domain.ChapterImage> result;

      try {
        var body = jsonDecode(response.body);

        var chapter = network.Chapter.fromJson(body);

        result = _mapChapterDetail(chapter.images);
      } on FormatException {}

      return result;
    }

    return null;
  }
}
