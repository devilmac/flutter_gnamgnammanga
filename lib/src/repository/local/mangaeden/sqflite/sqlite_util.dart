import 'package:flutter_app/src/repository/local/sqlite_util.dart';

class SqliteUtilMangaeden extends SqliteUtil {
  /// Manga table name
  static const MANGA_TABLE_NAME = "manga";

  /// Chapter table name
  static const CHAPTER_TABLE_NAME = "chapter";

  /// Chapters images table name
  static const CHAPTER_IMAGE_TABLE_NAME = "chapter_image";

  /// Category table name
  static const CATEGORY_TABLE_NAME = "category";

  // Manga table columns
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

  // Chapter table columns
  static const CHAPTER_ID_COLUMN = "chapter_id";
  static const CHAPTER_NUMBER_COLUMN = "number";
  static const CHAPTER_DATE_COLUMN = "date";
  static const CHAPTER_TITLE_COLUMN = "title";
  static const CHAPTER_MANGA_ID_COLUMN = "manga_id";

  // Chapter image table columns
  static const CHAPTER_PAGE_NUMBER_COLUMN = "page_number";
  static const CHAPTER_IMAGE_URL_COLUMN = "image_url";
  static const CHAPTER_WIDTH_COLUMN = "width";
  static const CHAPTER_HEIGHT_COLUMN = "height";
  static const CHAPTER_IMAGE_CHAPTER_ID_COLUMN = "chapter_id";

  // Category table columns
  static const CATEGORY_ID_COLUMN = "category_id";
  static const CATEGORY_NAME_COLUMN = "category_name";
  static const CATEGORY_LANGUAGE_COLUMN = "category_language";

  static const createMangaTable =
      "CREATE TABLE $MANGA_TABLE_NAME ($MANGA_ID_COLUMN TEXT PRIMARY KEY, "
      "$AKA_COLUMN TEXT, "
      "$AUTHOR_COLUMN TEXT, "
      "$CATEGORIES_COLUMN TEXT, "
      "$DESCRIPTION_COLUMN TEXT, "
      "$IMAGE_COLUMN TEXT, "
      "$LANGUAGE_COLUMN TEXT, "
      "$LAST_CHAPTER_DATE_COLUMN REAL, "
      "$RELEASED_COLUMN INTEGER, "
      "$STATUS_COLUMN INTEGER, "
      "$TITLE_COLUMN TEXT)";

  static const createChapterTable =
      "CREATE TABLE $CHAPTER_TABLE_NAME($CHAPTER_ID_COLUMN TEXT PRIMARY KEY, "
      "$CHAPTER_NUMBER_COLUMN TEXT, "
      "$CHAPTER_DATE_COLUMN REAL, "
      "$CHAPTER_TITLE_COLUMN TEXT,"
      "$CHAPTER_MANGA_ID_COLUMN TEXT NOT NULL,"
      "FOREIGN KEY($CHAPTER_MANGA_ID_COLUMN) REFERENCES $MANGA_TABLE_NAME($MANGA_ID_COLUMN) ON DELETE CASCADE)";

  static const createChapterImageTable =
      "CREATE TABLE $CHAPTER_IMAGE_TABLE_NAME($CHAPTER_IMAGE_URL_COLUMN TEXT,"
      "$CHAPTER_PAGE_NUMBER_COLUMN INTEGER,"
      "$CHAPTER_WIDTH_COLUMN INTEGER,"
      "$CHAPTER_HEIGHT_COLUMN INTEGER,"
      "$CHAPTER_IMAGE_CHAPTER_ID_COLUMN TEXT,"
      "FOREIGN KEY($CHAPTER_IMAGE_CHAPTER_ID_COLUMN) REFERENCES $CHAPTER_TABLE_NAME($CHAPTER_ID_COLUMN) ON DELETE CASCADE)";

  static const createCategoryTable =
      "CREATE TABLE $CATEGORY_TABLE_NAME($CATEGORY_NAME_COLUMN TEXT,"
      "$CATEGORY_LANGUAGE_COLUMN TEXT,"
      "PRIMARY KEY($CATEGORY_NAME_COLUMN, $CATEGORY_LANGUAGE_COLUMN))";

  // Alter SQL query to migrate from DB version 1 to DB version 2
  static const alterMangaDetailTableChangeStatusType =
      "PRAGMA foreign_keys=off;\n"
      "BEGIN TRANSACTION;\n"
      "ALTER TABLE $MANGA_TABLE_NAME RENAME TO _${MANGA_TABLE_NAME}_old;\n"
      "$createMangaTable;\n"
      "INSERT INTO $MANGA_TABLE_NAME ($MANGA_ID_COLUMN, $AKA_COLUMN, $AUTHOR_COLUMN, $CATEGORIES_COLUMN, $DESCRIPTION_COLUMN, $IMAGE_COLUMN, $LANGUAGE_COLUMN, $LAST_CHAPTER_DATE_COLUMN, $RELEASED_COLUMN, $STATUS_COLUMN, $TITLE_COLUMN) SELECT $MANGA_ID_COLUMN, $AKA_COLUMN, $AUTHOR_COLUMN, $CATEGORIES_COLUMN, $DESCRIPTION_COLUMN, $IMAGE_COLUMN, $LANGUAGE_COLUMN, $LAST_CHAPTER_DATE_COLUMN, $RELEASED_COLUMN, $STATUS_COLUMN, $TITLE_COLUMN FROM _${MANGA_TABLE_NAME}_old;\n"
      "COMMIT;\n"
      "PRAGMA foreign_keys=on;";

  static const alterAddCategoryTable = "PRAGMA foreign_keys=off;\n"
      "BEGIN TRANSACTION;\n"
      "$createCategoryTable;\n"
      "COMMIT;\n"
      "PRAGMAN foreign_keys=on;";
}
