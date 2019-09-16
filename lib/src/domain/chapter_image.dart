import 'package:equatable/equatable.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqflite/sqlite_util.dart';

class ChapterImage extends Equatable {
  final int page;
  final String imageUrl;
  final int height;
  final int width;

  ChapterImage({this.page, this.imageUrl, this.height, this.width})
      : super([page, imageUrl, height, width]);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteUtilMangaeden.CHAPTER_PAGE_NUMBER_COLUMN: page,
      SqliteUtilMangaeden.CHAPTER_IMAGE_URL_COLUMN: imageUrl,
      SqliteUtilMangaeden.CHAPTER_HEIGHT_COLUMN: height,
      SqliteUtilMangaeden.CHAPTER_WIDTH_COLUMN: width,
    };

    return map;
  }

  ChapterImage.fromMap(Map<String, dynamic> map)
      : this(
          page: map[SqliteUtilMangaeden.CHAPTER_PAGE_NUMBER_COLUMN],
          width: map[SqliteUtilMangaeden.CHAPTER_WIDTH_COLUMN],
          height: map[SqliteUtilMangaeden.CHAPTER_HEIGHT_COLUMN],
          imageUrl: map[SqliteUtilMangaeden.CHAPTER_IMAGE_URL_COLUMN],
        );

  @override
  String toString() {
    return 'ChapterImage{page: $page, imageUrl: $imageUrl, height: $height, width: $width}';
  }
}
