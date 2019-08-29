import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';

import 'chapter.dart';

class Manga {
  String mangaID;
  List<String> aka;
  String author;
  List<String> categories;
  String description;
  List<Chapter> chapters;
  int chaptersLen;
  String image;
  String language;
  double lastChapterDate;
  int released;
  String status;
  String title;

  Manga({
    this.mangaID,
    this.aka,
    this.author,
    this.categories,
    this.chapters,
    this.chaptersLen,
    this.description,
    this.image,
    this.language,
    this.lastChapterDate,
    this.released,
    this.status,
    this.title,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteUtilMangaeden.MANGA_ID_COLUMN: aka,
      SqliteUtilMangaeden.AUTHOR_COLUMN: author,
      SqliteUtilMangaeden.CATEGORIES_COLUMN: categories.join("|"),
      SqliteUtilMangaeden.DESCRIPTION_COLUMN: description,
      SqliteUtilMangaeden.IMAGE_COLUMN: image,
      SqliteUtilMangaeden.LANGUAGE_COLUMN: language,
      SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN: lastChapterDate,
      SqliteUtilMangaeden.RELEASED_COLUMN: released,
      SqliteUtilMangaeden.STATUS_COLUMN: status,
      SqliteUtilMangaeden.TITLE_COLUMN: title
    };

    if (mangaID != null) {
      map[SqliteUtilMangaeden.MANGA_ID_COLUMN] = mangaID;
    }

    return map;
  }

  Manga.fromMap(Map<String, dynamic> map) {
    mangaID = map[SqliteUtilMangaeden.MANGA_ID_COLUMN];
    aka = map[SqliteUtilMangaeden.AKA_COLUMN];
    author = map[SqliteUtilMangaeden.AUTHOR_COLUMN];
    categories = (map[SqliteUtilMangaeden.AUTHOR_COLUMN] as String).split("|");
    description = map[SqliteUtilMangaeden.DESCRIPTION_COLUMN];
    image = map[SqliteUtilMangaeden.IMAGE_COLUMN];
    language = map[SqliteUtilMangaeden.LANGUAGE_COLUMN];
    lastChapterDate = map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN];
    released = map[SqliteUtilMangaeden.RELEASED_COLUMN];
    status = map[SqliteUtilMangaeden.STATUS_COLUMN];
    title = map[SqliteUtilMangaeden.TITLE_COLUMN];
  }

  @override
  String toString() {
    return 'Manga{mangaID: $mangaID, author: $author, title: $title}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Manga &&
          runtimeType == other.runtimeType &&
          mangaID == other.mangaID &&
          aka == other.aka &&
          author == other.author &&
          categories == other.categories &&
          description == other.description &&
          chapters == other.chapters &&
          chaptersLen == other.chaptersLen &&
          image == other.image &&
          language == other.language &&
          lastChapterDate == other.lastChapterDate &&
          released == other.released &&
          status == other.status &&
          title == other.title;

  @override
  int get hashCode =>
      mangaID.hashCode ^
      aka.hashCode ^
      author.hashCode ^
      categories.hashCode ^
      description.hashCode ^
      chapters.hashCode ^
      chaptersLen.hashCode ^
      image.hashCode ^
      language.hashCode ^
      lastChapterDate.hashCode ^
      released.hashCode ^
      status.hashCode ^
      title.hashCode;
}
