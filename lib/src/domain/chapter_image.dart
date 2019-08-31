import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';

class ChapterImage {
  int page;
  String imageUrl;
  int height;
  int width;

  ChapterImage(this.page, this.imageUrl, this.height, this.width);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteUtilMangaeden.CHAPTER_PAGE_NUMBER_COLUMN: page,
      SqliteUtilMangaeden.CHAPTER_IMAGE_URL_COLUMN: imageUrl,
      SqliteUtilMangaeden.CHAPTER_HEIGHT_COLUMN: height,
      SqliteUtilMangaeden.CHAPTER_WIDTH_COLUMN: width,
    };

    return map;
  }

  ChapterImage.fromMap(Map<String, dynamic> map) {
    page = map[SqliteUtilMangaeden.CHAPTER_PAGE_NUMBER_COLUMN];
    width = map[SqliteUtilMangaeden.CHAPTER_WIDTH_COLUMN];
    height = map[SqliteUtilMangaeden.CHAPTER_HEIGHT_COLUMN];
    imageUrl = map[SqliteUtilMangaeden.CHAPTER_IMAGE_URL_COLUMN];
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
          width == other.width;

  @override
  int get hashCode =>
      page.hashCode ^ imageUrl.hashCode ^ height.hashCode ^ width.hashCode;
}
