import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';

class Chapter {
  String number;
  num date;
  String title;
  String chapterID;
  String mangaID;
  List<ChapterImage> images;

  Chapter({this.number, this.date, this.title, this.chapterID});

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

  Chapter.fromMap(Map<String, dynamic> map) {
    mangaID = map[SqliteUtilMangaeden.CHAPTER_MANGA_ID_COLUMN];
    number = map[SqliteUtilMangaeden.CHAPTER_NUMBER_COLUMN];
    title = map[SqliteUtilMangaeden.CHAPTER_TITLE_COLUMN];
    date = map[SqliteUtilMangaeden.CHAPTER_DATE_COLUMN];
    chapterID = map[SqliteUtilMangaeden.CHAPTER_ID_COLUMN];
  }

  Chapter setMangaID(String mangaID) {
    this.mangaID = mangaID;
    return this;
  }

  @override
  String toString() {
    return 'Chapter{number: $number, date: $date, title: $title, id: $chapterID}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Chapter &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          date == other.date &&
          title == other.title &&
          chapterID == other.chapterID &&
          mangaID == other.mangaID &&
          images == other.images;

  @override
  int get hashCode =>
      number.hashCode ^
      date.hashCode ^
      title.hashCode ^
      chapterID.hashCode ^
      mangaID.hashCode ^
      images.hashCode;
}
