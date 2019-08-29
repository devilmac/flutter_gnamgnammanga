import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';

class ChapterImage {
  int page;
  String imageUrl;
  int height;
  int width;
  String chapterID;

  ChapterImage(this.page, this.imageUrl, this.height, this.width);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteUtilMangaeden.CHAPTER_IMAGE_PAGE_NUMBER_COLUMN: page,
      SqliteUtilMangaeden.CHAPTER_IMAGE_URL_COLUMN: imageUrl,
      SqliteUtilMangaeden.CHAPTER_IMAGE_HEIGHT_COLUMN: height,
      SqliteUtilMangaeden.CHAPTER_IMAGE_WIDTH_COLUMN: width,
    };

    if (chapterID != null) {
      map[SqliteUtilMangaeden.CHAPTER_IMAGE_CHAPTER_ID_COLUMN] = chapterID;
    } else {
      throw ArgumentError("chapterID field must be not null");
    }

    return map;
  }

  ChapterImage.fromMap(Map<String, dynamic> map) {
    chapterID = map[SqliteUtilMangaeden.CHAPTER_IMAGE_CHAPTER_ID_COLUMN];
    page = map[SqliteUtilMangaeden.CHAPTER_IMAGE_PAGE_NUMBER_COLUMN];
    width = map[SqliteUtilMangaeden.CHAPTER_IMAGE_WIDTH_COLUMN];
    height = map[SqliteUtilMangaeden.CHAPTER_IMAGE_HEIGHT_COLUMN];
    chapterID = map[SqliteUtilMangaeden.CHAPTER_IMAGE_CHAPTER_ID_COLUMN];
  }

  @override
  String toString() {
    return 'ChapterImage{page: $page, imageUrl: $imageUrl, height: $height, width: $width}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterImage &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          imageUrl == other.imageUrl &&
          height == other.height &&
          width == other.width &&
          chapterID == other.chapterID;

  @override
  int get hashCode =>
      page.hashCode ^
      imageUrl.hashCode ^
      height.hashCode ^
      width.hashCode ^
      chapterID.hashCode;
}
