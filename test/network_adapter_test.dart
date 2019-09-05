import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/manga_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockMangaService extends Mock implements MangaService {}

main() {
  MangaService service;

  setUpAll(() {
    service = MockMangaService();
  });

  group("Get all manga", () {
    test("Return manga list", () async {
      when(service.getMangaList(any))
          .thenAnswer((_) async => Future.value(<Manga>[
                Manga(
                    mangaID: "",
                    categories: [],
                    image: "",
                    title: "",
                    lastChapterDate: 3453343,
                    mangaDetail: MangaDetail(
                        aka: [],
                        author: "",
                        description: "",
                        chapters: [],
                        language: "",
                        released: 34542,
                        status: "",
                        lastChapterDate: 542352,
                        categories: []))
              ]));

      var networkAdapter = MangaNetworkAdapter(service);

      await networkAdapter.getMangaList(any);

      expect(await networkAdapter.getMangaList(any), isA<List<Manga>>());
      verify(networkAdapter.getMangaList(any));
    });

    test("Return null if some error occurs", () async {
      when(service.getMangaList(any)).thenAnswer((_) async => null);

      var networkAdapter = MangaNetworkAdapter(service);

      await networkAdapter.getMangaList(any);

      expect(await networkAdapter.getMangaList(any), isNull);
      verify(networkAdapter.getMangaList(any));
    });
  });

  group("Get manga detail", () {
    test("Return manga detail", () async {
      when(service.getMangaDetail(any)).thenAnswer(
        (_) async => Future.value(MangaDetail(
            aka: [],
            categories: [],
            lastChapterDate: 4535,
            status: "",
            released: 45353,
            language: "",
            chapters: [
              Chapter(title: "", chapterID: "", date: 5443523, number: ""),
            ],
            description: "",
            author: "")),
      );

      var networkAdapter = MangaNetworkAdapter(service);

      await networkAdapter.getMangaDetail(any);

      expect(await networkAdapter.getMangaDetail(any), isA<MangaDetail>());
      verify(networkAdapter.getMangaDetail(any));
    });

    test("Return null if some error occurs", () async {
      when(service.getMangaDetail(any)).thenAnswer((_) async => null);

      var networkAdapter = MangaNetworkAdapter(service);

      await networkAdapter.getMangaDetail(any);

      expect(await networkAdapter.getMangaDetail(any), isNull);
      verify(networkAdapter.getMangaDetail(any));
    });
  });

  group("Get chapter detail", () {
    test("Return chapter detail", () async {
      when(service.getChapterDetail(any)).thenAnswer(
          (_) async => [ChapterImage(), ChapterImage(), ChapterImage()]);

      var networkAdapter = MangaNetworkAdapter(service);

      await networkAdapter.getChapterDetail(any);

      expect(await networkAdapter.getChapterDetail(any),
          isA<List<ChapterImage>>());
      verify(networkAdapter.getChapterDetail(any));
    });

    test("Return null if some error occurs", () async {
      when(service.getChapterDetail(any)).thenAnswer((_) async => null);

      var networkAdapter = MangaNetworkAdapter(service);

      await networkAdapter.getChapterDetail(any);

      expect(await networkAdapter.getChapterDetail(any), isNull);
      verify(networkAdapter.getChapterDetail(any));
    });
  });
}
