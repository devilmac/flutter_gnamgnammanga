import 'package:equatable/equatable.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';

class Manga extends Equatable {
  final String mangaID;
  final List<String> categories;
  final String image;
  final num lastChapterDate;
  final String title;

  final MangaDetail mangaDetail;

  Manga(
      {this.mangaID,
      this.categories,
      this.image,
      this.lastChapterDate,
      this.title,
      this.mangaDetail})
      : super(
            [mangaID, categories, image, lastChapterDate, title, mangaDetail]);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteUtilMangaeden.AKA_COLUMN: mangaDetail.aka.join("|"),
      SqliteUtilMangaeden.AUTHOR_COLUMN: mangaDetail.author,
      SqliteUtilMangaeden.CATEGORIES_COLUMN: categories.join("|"),
      SqliteUtilMangaeden.DESCRIPTION_COLUMN: mangaDetail.description,
      SqliteUtilMangaeden.IMAGE_COLUMN: image,
      SqliteUtilMangaeden.LANGUAGE_COLUMN: mangaDetail.language,
      SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN: lastChapterDate,
      SqliteUtilMangaeden.RELEASED_COLUMN: mangaDetail.released,
      SqliteUtilMangaeden.STATUS_COLUMN: mangaDetail.status,
      SqliteUtilMangaeden.TITLE_COLUMN: title,
    };

    if (mangaID != null) {
      map[SqliteUtilMangaeden.MANGA_ID_COLUMN] = mangaID;
    }

    return map;
  }

  Manga.fromMap(Map<String, dynamic> map)
      : this(
          mangaID: map[SqliteUtilMangaeden.MANGA_ID_COLUMN],
          categories:
              (map[SqliteUtilMangaeden.CATEGORIES_COLUMN] as String).split("|"),
          image: map[SqliteUtilMangaeden.IMAGE_COLUMN],
          lastChapterDate: map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN],
          title: map[SqliteUtilMangaeden.TITLE_COLUMN],
          mangaDetail: MangaDetail(
            aka: (map[SqliteUtilMangaeden.AKA_COLUMN] as String).split("|"),
            description: map[SqliteUtilMangaeden.DESCRIPTION_COLUMN],
            language: map[SqliteUtilMangaeden.LANGUAGE_COLUMN],
            released: map[SqliteUtilMangaeden.RELEASED_COLUMN],
            status: map[SqliteUtilMangaeden.STATUS_COLUMN],
            author: map[SqliteUtilMangaeden.AUTHOR_COLUMN],
            lastChapterDate: map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN],
            categories: (map[SqliteUtilMangaeden.CATEGORIES_COLUMN] as String)
                .split("|"),
          ),
        );

  static Manga copyWithMangaDetail(
    Manga oldManga,
    MangaDetail mangaDetail, {
    String mangaID,
    List<String> categories,
    String image,
    num lastChapterDate,
    String title,
  }) =>
      Manga(
        mangaDetail: mangaDetail,
        mangaID: mangaID != null ? mangaID : oldManga.mangaID,
        categories: categories != null ? categories : oldManga.categories,
        image: image != null ? image : oldManga.image,
        lastChapterDate: lastChapterDate != null
            ? lastChapterDate
            : oldManga.lastChapterDate,
        title: title != null ? title : oldManga.title,
      );

  @override
  String toString() {
    return 'Manga{mangaID: $mangaID, categories: $categories, image: $image, lastChapterDate: $lastChapterDate, title: $title, mangaDetail: $mangaDetail}';
  }
}
