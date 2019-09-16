import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqlite_util.dart';
import 'package:test/test.dart';

main() {
  group("Manga class of domain package", () {
    Manga manga;
    MangaDetail mangaDetail;
    Map<String, dynamic> map = Map();

    setUp(() {
      mangaDetail = MangaDetail(
          lastChapterDate: 354235,
          categories: ["srwguf"],
          chapters: [Chapter()],
          aka: ["djfvsjk"],
          author: "dfgsfhsi",
          status: "dfukhsfiuhfl");

      manga = Manga(
          mangaID: "sdjhfgsdf",
          mangaDetail: mangaDetail,
          categories: ["dfsjk", "difsgi"],
          lastChapterDate: 45355,
          title: "dsjfsgj",
          image: "dfsjdhfks");

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

      expect(map, isA<Map<String, dynamic>>());
    });

    test("Convert map to Manga", () {
      var manga = Manga.fromMap(map);

      expect(manga, isA<Manga>());
    });
  });

  group("MangaDetail class of domain package", () {
    MangaDetail mangaDetail;
    Map<String, dynamic> map = Map();

    setUp(() {
      mangaDetail = MangaDetail(
          lastChapterDate: 354235,
          categories: ["srwguf"],
          chapters: [Chapter()],
          aka: ["djfvsjk"],
          author: "dfgsfhsi",
          status: "dfukhsfiuhfl");

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

      expect(map, isA<Map<String, dynamic>>());
    });

    test("Convert a map to manga detail", () {
      var mangaDetail = MangaDetail.fromMap(map);

      expect(mangaDetail, isA<MangaDetail>());
    });
  });

  group("Chapter class of domain package", () {
    Chapter chapter;
    Map<String, dynamic> map = Map();

    setUp(() {
      chapter = Chapter(
          title: "dkfgsdfl",
          mangaID: "dklfsfhsif",
          chapterID: "dfskdfbilf",
          images: [
            ChapterImage(
                imageUrl: "sfgsdfuidi", height: 432, page: 4534, width: 4523)
          ],
          number: "fsff",
          date: 354353);

      map[SqliteUtilMangaeden.CHAPTER_MANGA_ID_COLUMN] = "";
      map[SqliteUtilMangaeden.CHAPTER_NUMBER_COLUMN] = "";
      map[SqliteUtilMangaeden.CHAPTER_TITLE_COLUMN] = "";
      map[SqliteUtilMangaeden.CHAPTER_DATE_COLUMN] = 525;
      map[SqliteUtilMangaeden.CHAPTER_ID_COLUMN] = "eewrw";
    });

    test("Convert a chapter to map", () {
      var map = chapter.toMap();

      expect(map, isA<Map<String, dynamic>>());
    });

    test("Convert a chapter to map when chapter has mangaID null", () {
      chapter = Chapter.copyWithMangaID(chapter, null);

      try {
        chapter.toMap();
      } on ArgumentError catch (e) {
        expect(e, isArgumentError);
      }
    });

    test("Set mangaID to chapter", () {
      chapter = Chapter.copyWithMangaID(chapter, null);

      chapter = Chapter.copyWithMangaID(chapter, "rfgsfh");

      expect(chapter.mangaID, isNotNull);
    });

    test("Convert a map to chapter", () {
      var chapter = Chapter.fromMap(map);

      expect(chapter, isA<Chapter>());
    });
  });

  group("ChapterImage class of domain package", () {
    ChapterImage chapterImage;
    Map<String, dynamic> map = Map();

    setUp(() {
      chapterImage = ChapterImage(
          page: 5234, height: 5342, width: 45423, imageUrl: "ufhsiofhof");

      map[SqliteUtilMangaeden.CHAPTER_PAGE_NUMBER_COLUMN] = 432;
      map[SqliteUtilMangaeden.CHAPTER_WIDTH_COLUMN] = 5345;
      map[SqliteUtilMangaeden.CHAPTER_HEIGHT_COLUMN] = 534;
      map[SqliteUtilMangaeden.CHAPTER_IMAGE_URL_COLUMN] = "rjfbsdf";
    });

    test("Convert chapter image to map", () {
      var map = chapterImage.toMap();

      expect(map, isA<Map<String, dynamic>>());
    });

    test("Convert map to chapter image", () {
      var chapterImage = ChapterImage.fromMap(map);

      expect(chapterImage, isA<ChapterImage>());
    });
  });
}
