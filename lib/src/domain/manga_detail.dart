import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';

class MangaDetail {
  List<String> aka;
  String author;
  String description;
  List<Chapter> chapters;
  String language;
  num released;
  String status;
  num lastChapterDate;
  List<String> categories;

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

  MangaDetail.fromMap(Map<String, dynamic> map) {
    aka = (map[SqliteUtilMangaeden.AKA_COLUMN] as String).split("|");
    description = map[SqliteUtilMangaeden.DESCRIPTION_COLUMN];
    language = map[SqliteUtilMangaeden.LANGUAGE_COLUMN];
    released = map[SqliteUtilMangaeden.RELEASED_COLUMN];
    status = map[SqliteUtilMangaeden.STATUS_COLUMN];
    author = map[SqliteUtilMangaeden.AUTHOR_COLUMN];
    lastChapterDate = map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN];
    categories = (map[SqliteUtilMangaeden.AUTHOR_COLUMN] as String).split("|");
  }

  @override
  String toString() {
    return 'MangaDetail{aka: $aka, author: $author, description: $description, language: $language, released: $released, status: $status, lastChapterDate: $lastChapterDate, categories: $categories}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaDetail &&
          runtimeType == other.runtimeType &&
          aka == other.aka &&
          author == other.author &&
          description == other.description &&
          chapters == other.chapters &&
          language == other.language &&
          released == other.released &&
          status == other.status &&
          lastChapterDate == other.lastChapterDate &&
          categories == other.categories;

  @override
  int get hashCode =>
      aka.hashCode ^
      author.hashCode ^
      description.hashCode ^
      chapters.hashCode ^
      language.hashCode ^
      released.hashCode ^
      status.hashCode ^
      lastChapterDate.hashCode ^
      categories.hashCode;
}
