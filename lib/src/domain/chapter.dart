import 'package:equatable/equatable.dart';
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqflite/sqlite_util.dart';

class Chapter extends Equatable {
  final String number;
  final num date;
  final String title;
  final String chapterID;
  final String mangaID;
  final List<ChapterImage> images;

  Chapter(
      {this.number,
      this.date,
      this.title,
      this.chapterID,
      this.mangaID,
      this.images})
      : super([number, date, title, chapterID]);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteUtilMangaeden.CHAPTER_NUMBER_COLUMN: number,
      SqliteUtilMangaeden.CHAPTER_DATE_COLUMN: date,
      SqliteUtilMangaeden.CHAPTER_TITLE_COLUMN: title,
    };

    if (chapterID != null) {
      map[SqliteUtilMangaeden.CHAPTER_ID_COLUMN] = chapterID;
    }

    if (mangaID != null) {
      map[SqliteUtilMangaeden.CHAPTER_MANGA_ID_COLUMN] = mangaID;
    } else {
      throw ArgumentError("mangaID field must be not null");
    }

    return map;
  }

  Chapter.fromMap(Map<String, dynamic> map)
      : this(
          title: map[SqliteUtilMangaeden.CHAPTER_TITLE_COLUMN],
          date: map[SqliteUtilMangaeden.CHAPTER_DATE_COLUMN],
          number: map[SqliteUtilMangaeden.CHAPTER_NUMBER_COLUMN],
          mangaID: map[SqliteUtilMangaeden.CHAPTER_MANGA_ID_COLUMN],
          chapterID: map[SqliteUtilMangaeden.CHAPTER_ID_COLUMN],
        );

  static Chapter copyWithMangaID(Chapter oldChapter, String mangaID,
          {num date,
          String number,
          String title,
          String chapterID,
          List<ChapterImage> images}) =>
      Chapter(
        mangaID: mangaID,
        date: date != null ? date : oldChapter.date,
        chapterID: chapterID != null ? chapterID : oldChapter.chapterID,
        number: number != null ? number : oldChapter.number,
        title: title != null ? title : oldChapter.title,
        images: images != null ? images : oldChapter.images,
      );

  @override
  String toString() {
    return 'Chapter{number: $number, date: $date, title: $title, chapterID: $chapterID, mangaID: $mangaID, images: $images}';
  }
}
