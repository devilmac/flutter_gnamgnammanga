import 'package:flutter_app/src/repository/local/sqlite_util.dart';

class SqliteUtilMangaeden extends SqliteUtil {
  ///Manga table name
  static const MANGA_TABLE_NAME = "manga";

  ///Chapter table name
  static const CHAPTER_TABLE_NAME = "chapter";

  ///Chapter image table name
  static const CHAPTER_IMAGE_TABLE_NAME = "chapter_image";

  //Manga table columns
  static const MANGA_ID_COLUMN = "manga_id";
  static const AKA_COLUMN = "aka";
  static const AUTHOR_COLUMN = "author";
  static const CATEGORIES_COLUMN = "categories";
  static const DESCRIPTION_COLUMN = "description";
  static const IMAGE_COLUMN = "image";
  static const LANGUAGE_COLUMN = "language";
  static const LAST_CHAPTER_DATE_COLUMN = "last_chapter_date";
  static const RELEASED_COLUMN = "released";
  static const STATUS_COLUMN = "status";
  static const TITLE_COLUMN = "title";

  //Chapter table columns
  static const CHAPTER_ID_COLUMN = "chapter_id";
  static const CHAPTER_NUMBER_COLUMN = "number";
  static const CHATER_DATE_COLUMN = "date";
  static const CHAPTER_TITLE_COLUMN = "title";
  static const CHAPTER_MANGA_ID_COLUMN = "manga_id";

  //Chapter image table columns
  static const CHAPTER_IMAGE_PAGE_NUMBER_COLUMN = "page_number";
  static const CHAPTER_IMAGE_URL_COLUMN = "image_url";
  static const CHAPTER_IMAGE_WIDTH_COLUMN = "width";
  static const CHAPTER_IMAGE_HEIGHT_COLUMN = "height";
  static const CHAPTER_IMAGE_CHAPTER_ID_COLUMN = "chapter_id";

  /// String mangaID;
  //  List<String> categories;
  //  String image;
  //  num lastChapterDate;
  //  String title;
  ///List<String> aka;
  //  String author;
  //  String description;
  //  List<Chapter> chapters;
  //  String language;
  //  num released;
  //  String status;
  //  num lastChapterDate;
  //  List<String> categories;

  static const String createMangaTable =
      "CREATE TABLE $MANGA_TABLE_NAME ($MANGA_ID_COLUMN TEXT PRIMARY KEY, "
      "$AKA_COLUMN TEXT, "
      "$AUTHOR_COLUMN TEXT, "
      "$CATEGORIES_COLUMN TEXT, "
      "$DESCRIPTION_COLUMN TEXT, "
      "$IMAGE_COLUMN TEXT, "
      "$LANGUAGE_COLUMN TEXT, "
      "$LAST_CHAPTER_DATE_COLUMN REAL, "
      "$RELEASED_COLUMN INTEGER, "
      "$STATUS_COLUMN TEXT, "
      "$TITLE_COLUMN TEXT)";

  static const String createChapterTable =
      "CREATE TABLE $CHAPTER_TABLE_NAME($CHAPTER_ID_COLUMN TEXT PRIMARY KEY, "
      "$CHAPTER_NUMBER_COLUMN TEXT, "
      "$CHATER_DATE_COLUMN REAL, "
      "$CHAPTER_TITLE_COLUMN TEXT,"
      "$CHAPTER_MANGA_ID_COLUMN TEXT NOT NULL,"
      "FOREIGN KEY($CHAPTER_MANGA_ID_COLUMN) REFERENCES $MANGA_TABLE_NAME($MANGA_ID_COLUMN) ON DELETE CASCADE)";

  static const String createChapterImageTable =
      "CREATE TABLE $CHAPTER_IMAGE_TABLE_NAME($CHAPTER_IMAGE_PAGE_NUMBER_COLUMN INTEGER, "
      "$CHAPTER_IMAGE_URL_COLUMN TEXT, "
      "$CHAPTER_IMAGE_WIDTH_COLUMN INTEGER, "
      "$CHAPTER_IMAGE_HEIGHT_COLUMN INTEGER, "
      "$CHAPTER_IMAGE_CHAPTER_ID_COLUMN TEXT,"
      "FOREIGN KEY($CHAPTER_IMAGE_CHAPTER_ID_COLUMN) REFERENCES $CHAPTER_TABLE_NAME($CHAPTER_ID_COLUMN) ON DELETE CASCADE)";
}
