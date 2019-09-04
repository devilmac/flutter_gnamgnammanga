import 'package:flutter_app/src/repository/network/model/mangaeden/chapter.dart';
import 'package:flutter_app/src/repository/network/model/mangaeden/manga.dart';
import 'package:flutter_app/src/repository/network/model/mangaeden/manga_detail.dart';
import 'package:test/test.dart';

main() {
  group("Manga class of network package", () {
    Manga manga = Manga("", ["", ""], "", 0, 342, "", 4543, "");

    test("Convert manga to JSON", () {
      var json = manga.toJson();

      expect(json, isA<Map<String, dynamic>>());
    });
  });

  group("MangaDetail class of network package", () {
    MangaDetail mangaDetail = MangaDetail(
        ["", ""],
        ["", ""],
        "",
        "",
        ["", ""],
        "",
        [""],
        false,
        [],
        0,
        4334543,
        "",
        5345,
        "fkhsfi",
        "dkfbsdf",
        0,
        454344,
        [4532],
        543523,
        "",
        "",
        [""],
        5245,
        false,
        [""],
        2);

    test("Convert manga detail to JSON", () {
      var json = mangaDetail.toJson();

      expect(json, isA<Map<String, dynamic>>());
    });
  });

  group("Chapter class of network package", () {
    Chapter chapter = Chapter(images: [[]]);

    test("Convert chapter to JSON", () {
      var json = chapter.toJson();

      expect(json, isA<Map<String, dynamic>>());
    });
  });
}
