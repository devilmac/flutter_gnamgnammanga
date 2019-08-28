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
      MANGA_ID_COLUMN: aka,
      AUTHOR_COLUMN: author,
      CATEGORIES_COLUMN: categories.join("|"),
      DESCRIPTION_COLUMN: description,
      IMAGE_COLUMN: image,
      LANGUAGE_COLUMN: language,
      LAST_CHAPTER_DATE_COLUMN: lastChapterDate,
      RELEASED_COLUMN: released,
      STATUS_COLUMN: status,
      TITLE_COLUMN: title
    };

    if (mangaID != null) {
      map[MANGA_ID_COLUMN] = mangaID;
    }

    return map;
  }

  Manga.fromMap(Map<String, dynamic> map) {
    mangaID = map[MANGA_ID_COLUMN];
    aka = map[AKA_COLUMN];
    author = map[AUTHOR_COLUMN];
    categories = (map[AUTHOR_COLUMN] as String).split("|");
    description = map[DESCRIPTION_COLUMN];
    image = map[IMAGE_COLUMN];
    language = map[LANGUAGE_COLUMN];
    lastChapterDate = map[LAST_CHAPTER_DATE_COLUMN];
    released = map[RELEASED_COLUMN];
    status = map[STATUS_COLUMN];
    title = map[TITLE_COLUMN];
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
