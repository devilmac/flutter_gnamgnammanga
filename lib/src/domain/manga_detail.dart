import 'package:equatable/equatable.dart';
import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/manga_status.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqflite/sqlite_util.dart';

class MangaDetail extends Equatable {
  final List<String> aka;
  final String author;
  final String description;
  final List<Chapter> chapters;
  final String language;
  final num released;
  final mangaStatus status;
  final num lastChapterDate;
  final List<String> categories;

  MangaDetail(
      {this.aka,
      this.author,
      this.description,
      this.chapters,
      this.language,
      this.released,
      this.status,
      this.lastChapterDate,
      this.categories});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteUtilMangaeden.AKA_COLUMN: aka.join("|"),
      SqliteUtilMangaeden.AUTHOR_COLUMN: author,
      SqliteUtilMangaeden.DESCRIPTION_COLUMN: description,
      SqliteUtilMangaeden.LANGUAGE_COLUMN: language,
      SqliteUtilMangaeden.RELEASED_COLUMN: released,
      SqliteUtilMangaeden.STATUS_COLUMN: status,
      SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN: lastChapterDate,
      SqliteUtilMangaeden.CATEGORIES_COLUMN: categories.join("|"),
    };

    return map;
  }

  MangaDetail.fromMap(Map<String, dynamic> map)
      : this(
          aka: (map[SqliteUtilMangaeden.AKA_COLUMN] as String).split("|"),
          description: map[SqliteUtilMangaeden.DESCRIPTION_COLUMN],
          language: map[SqliteUtilMangaeden.LANGUAGE_COLUMN],
          released: map[SqliteUtilMangaeden.RELEASED_COLUMN],
          status: map[SqliteUtilMangaeden.STATUS_COLUMN],
          author: map[SqliteUtilMangaeden.AUTHOR_COLUMN],
          lastChapterDate: map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN],
          categories:
              (map[SqliteUtilMangaeden.AUTHOR_COLUMN] as String).split("|"),
        );

  static MangaDetail copyWithChapters(
          MangaDetail oldMangaDetail, List<Chapter> chapters,
          {List<String> aka,
          String author,
          String description,
          String language,
          num released,
          num status,
          num lastChapterDate,
          List<String> categories}) =>
      MangaDetail(
        chapters: chapters,
        aka: aka != null ? aka : oldMangaDetail.aka,
        author: author != null ? author : oldMangaDetail.author,
        description:
            description != null ? description : oldMangaDetail.description,
        language: language != null ? language : oldMangaDetail.language,
        released: released != null ? released : oldMangaDetail.released,
        status: status != null ? status : oldMangaDetail.status,
        lastChapterDate: lastChapterDate != null
            ? lastChapterDate
            : oldMangaDetail.lastChapterDate,
        categories: categories != null ? categories : oldMangaDetail.categories,
      );

  @override
  String toString() {
    return 'MangaDetail{aka: $aka, author: $author, description: $description, language: $language, released: $released, status: $status, lastChapterDate: $lastChapterDate, categories: $categories}';
  }

  @override
  List<Object> get props => [
        aka,
        author,
        description,
        chapters,
        lastChapterDate,
        language,
        released,
        status,
        categories
      ];
}
