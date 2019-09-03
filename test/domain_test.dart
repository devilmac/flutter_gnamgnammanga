import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';
import 'package:test/test.dart';

main() {
  group("Manga class of domain package", () {
    Manga manga;
    Map<String, dynamic> map = Map();

    setUp(() {
      manga = Manga();

      MangaDetail mangaDetail = MangaDetail();
      mangaDetail.lastChapterDate = 34214;
      mangaDetail.categories = ["", "", ""];
      mangaDetail.chapters = [Chapter()];
      mangaDetail.aka = [""];
      mangaDetail.author = "";
      mangaDetail.status = "";

      manga.mangaID = "";
      manga.categories = ["", "", ""];
      manga.lastChapterDate = 342421;
      manga.title = "";
      manga.image = "";

      manga.mangaDetail = mangaDetail;

      map[SqliteUtilMangaeden.MANGA_ID_COLUMN] = "";
      map[SqliteUtilMangaeden.CATEGORIES_COLUMN] = "ihfsihf|3jkrbo";
      map[SqliteUtilMangaeden.IMAGE_COLUMN] = "";
      map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN] = 543535;
      map[SqliteUtilMangaeden.TITLE_COLUMN] = "";
      map[SqliteUtilMangaeden.AKA_COLUMN] = "fgasgku|dgakgak";
      map[SqliteUtilMangaeden.DESCRIPTION_COLUMN] = "";
      map[SqliteUtilMangaeden.LANGUAGE_COLUMN] = "";
      map[SqliteUtilMangaeden.RELEASED_COLUMN] = 759920;
      map[SqliteUtilMangaeden.STATUS_COLUMN] = "";
      map[SqliteUtilMangaeden.AUTHOR_COLUMN] = "";
      map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN] = 5435634;
      map[SqliteUtilMangaeden.CATEGORIES_COLUMN] = "dga|0frurp";
    });

    test("Convert a Manga to a map of its properties", () {
      var map = manga.toMap();

      expect(map, TypeMatcher<Map<String, dynamic>>());
    });

    test("Convert map to Manga", () {
      var manga = Manga.fromMap(map);

      expect(manga, TypeMatcher<Manga>());
    });
  });

  group("MangaDetail class of domain package", () {
    MangaDetail mangaDetail;
    Map<String, dynamic> map = Map();

    setUp(() {
      mangaDetail = MangaDetail();
      mangaDetail.lastChapterDate = 34214;
      mangaDetail.categories = ["", "", ""];
      mangaDetail.chapters = [Chapter()];
      mangaDetail.aka = [""];
      mangaDetail.author = "";
      mangaDetail.status = "";

      map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN] = 543535;
      map[SqliteUtilMangaeden.TITLE_COLUMN] = "";
      map[SqliteUtilMangaeden.AKA_COLUMN] = "fgasgku|dgakgak";
      map[SqliteUtilMangaeden.DESCRIPTION_COLUMN] = "";
      map[SqliteUtilMangaeden.LANGUAGE_COLUMN] = "";
      map[SqliteUtilMangaeden.RELEASED_COLUMN] = 759920;
      map[SqliteUtilMangaeden.STATUS_COLUMN] = "";
      map[SqliteUtilMangaeden.AUTHOR_COLUMN] = "";
      map[SqliteUtilMangaeden.LAST_CHAPTER_DATE_COLUMN] = 5435634;
      map[SqliteUtilMangaeden.CATEGORIES_COLUMN] = "dga|0frurp";
    });

    test("Convert manga detail to map", () {
      var map = mangaDetail.toMap();

      expect(map, TypeMatcher<Map<String, dynamic>>());
    });

    test("Convert a map to manga detail", () {
      var mangaDetail = MangaDetail.fromMap(map);

      expect(mangaDetail, TypeMatcher<MangaDetail>());
    });
  });

  group("Chapter class of domain package", () {
    Chapter chapter;
    Map<String, dynamic> map = Map();

    setUp(() {
      chapter = Chapter();
      chapter.title = "";
      chapter.mangaID = "";
      chapter.chapterID = "";
      chapter.images = [
        ChapterImage(height: 423, imageUrl: "", page: 342, width: 4534)
      ];
      chapter.number = "";
      chapter.date = 37523502;

      map[SqliteUtilMangaeden.CHAPTER_MANGA_ID_COLUMN] = "";
      map[SqliteUtilMangaeden.CHAPTER_NUMBER_COLUMN] = "";
      map[SqliteUtilMangaeden.CHAPTER_TITLE_COLUMN] = "";
      map[SqliteUtilMangaeden.CHAPTER_DATE_COLUMN] = 525;
      map[SqliteUtilMangaeden.CHAPTER_ID_COLUMN] = "eewrw";
    });

    test("Convert a chapter to map", () {
      var map = chapter.toMap();

      expect(map, TypeMatcher<Map<String, dynamic>>());
    });

    test("Convert a map to chapter", () {
      var chapter = Chapter.fromMap(map);

      expect(chapter, TypeMatcher<Chapter>());
    });
  });
}
