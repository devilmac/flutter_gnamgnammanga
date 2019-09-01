import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/src/config/configuration.dart' as configuration;
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
String mangaList = "$BASE_URL/list/${configuration.mangaLanguage}";
const String MANGA_DETAIL = "$BASE_URL/manga/";
const String CHAPTER_DETAIL = "$BASE_URL/chapter/";

String baseImageUrl = "https://cdn.mangaeden.com/mangasimg/";

List<domain.Manga> manageGetMangaListResponse(String responseBody) {
  List<domain.Manga> result;

  try {
    var body = json.decode(responseBody);

    var mangaList = body["manga"] as List;

    var mappedList =
        mangaList.map((json) => network.Manga.fromJson(json)).toList();

    result = mappedList
        .map((networkManga) => _mapManga(networkManga))
        .toSet()
        .toList();
  } on JsonUnsupportedObjectError {
    throw JsonUnsupportedObjectError(responseBody);
  } on Exception catch (e) {
    print("Network error: $e");
  } catch (e) {
    print("Unknown error: $e");
  }

  return result;
}

domain.MangaDetail manageGetMangaDetailResponse(String responseBody) {
  domain.MangaDetail result;

  try {
    var body = json.decode(responseBody);

    var mangaDetail = network.MangaDetail.fromJson(body);

    result = _mapMangaDetail(mangaDetail);
  } on JsonUnsupportedObjectError {
    throw JsonUnsupportedObjectError(responseBody);
  } on Exception catch (e) {
    print("Network error: $e");
  } catch (e) {
    print("Unknown error: $e");
  }

  return result;
}

List<domain.ChapterImage> manageGetChapterDetailResponse(String responseBody) {
  List<domain.ChapterImage> result;

  try {
    var body = json.decode(responseBody);

    var chapter = network.Chapter.fromJson(body);

    result = _mapChapterDetail(chapter.images);
  } on JsonUnsupportedObjectError {
    throw JsonUnsupportedObjectError(responseBody);
  } on Exception catch (e) {
    print("Network error: $e");
  } catch (e) {
    print("Unknown error: $e");
  }
  return result;
}

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
      status: _mapStatus(mangaDetail.status));
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
  Future<domain.MangaDetail> getMangaDetail(String mangaID) async {
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
