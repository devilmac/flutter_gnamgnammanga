import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';

class Manga {
  String mangaID;
  List<String> categories;
  String image;
  num lastChapterDate;
  String title;

  MangaDetail mangaDetail;

  Manga(
      {this.mangaID,
      this.categories,
      this.image,
      this.lastChapterDate,
      this.title,
      this.mangaDetail});

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

  Manga.fromMap(Map<String, dynamic> map) {
    mangaID = map[SqliteUtilMangaeden.MANGA_ID_COLUMN];
    categories =
        (map[SqliteUtilMangaeden.CATEGORIES_COLUMN] as String).split("|");
    image = map[SqliteUtilMangaeden.IMAGE_COLUMN];
    lastChapterDate = map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN];
    title = map[SqliteUtilMangaeden.TITLE_COLUMN];

    mangaDetail = MangaDetail();
    mangaDetail.aka =
        (map[SqliteUtilMangaeden.AKA_COLUMN] as String).split("|");
    mangaDetail.description = map[SqliteUtilMangaeden.DESCRIPTION_COLUMN];
    mangaDetail.language = map[SqliteUtilMangaeden.LANGUAGE_COLUMN];
    mangaDetail.released = map[SqliteUtilMangaeden.RELEASED_COLUMN];
    mangaDetail.status = map[SqliteUtilMangaeden.STATUS_COLUMN];
    mangaDetail.author = map[SqliteUtilMangaeden.AUTHOR_COLUMN];
    mangaDetail.lastChapterDate =
        map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN];
    mangaDetail.categories =
        (map[SqliteUtilMangaeden.CATEGORIES_COLUMN] as String).split("|");
  }

  @override
  String toString() {
    return 'Manga{mangaID: $mangaID, categories: $categories, image: $image, lastChapterDate: $lastChapterDate, title: $title, mangaDetail: $mangaDetail}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Manga &&
          runtimeType == other.runtimeType &&
          mangaID == other.mangaID &&
          categories == other.categories &&
          image == other.image &&
          lastChapterDate == other.lastChapterDate &&
          title == other.title &&
          mangaDetail == other.mangaDetail;

  @override
  int get hashCode =>
      mangaID.hashCode ^
      categories.hashCode ^
      image.hashCode ^
      lastChapterDate.hashCode ^
      title.hashCode ^
      mangaDetail.hashCode;
}
