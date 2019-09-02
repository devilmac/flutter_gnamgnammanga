import 'package:flutter_app/src/config/service_locator.dart';
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
    ServiceLocator().initServices();
    ServiceLocator().serviceLocator.allowReassignment = true;
    service = MockMangaService();

    ServiceLocator().serviceLocator.registerSingleton<MangaService>(service);
  });

  group("Get all manga", () {
    test("Return manga list", () async {
      when(service.getManga()).thenAnswer((_) async => Future.value(<Manga>[
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

      var networkAdapter =
          MangaNetworkAdapter(ServiceLocator().serviceLocator<MangaService>());

      await networkAdapter.getMangaList();

      expect(await networkAdapter.getMangaList(), TypeMatcher<List<Manga>>());
      verify(networkAdapter.getMangaList());
    });

    test("Return null if some error occurs", () async {
      when(service.getManga()).thenAnswer((_) async => null);

      var networkAdapter =
          MangaNetworkAdapter(ServiceLocator().serviceLocator<MangaService>());

      await networkAdapter.getMangaList();

      expect(await networkAdapter.getMangaList(), isNull);
      verify(networkAdapter.getMangaList());
    });
  });

  group("Get manga detail", () {
    test("Return manga detail", () async {
      when(service.getMangaDetail(any)).thenAnswer((_) async => Future.value(
          MangaDetail(
              aka: [],
              categories: [],
              lastChapterDate: 4535,
              status: "",
              released: 45353,
              language: "",
              chapters: [],
              description: "",
              author: "")));

      var networkAdapter =
          MangaNetworkAdapter(ServiceLocator().serviceLocator<MangaService>());

      await networkAdapter.getMangaDetail(any);

      expect(
          await networkAdapter.getMangaDetail(any), TypeMatcher<MangaDetail>());
      verify(networkAdapter.getMangaDetail(any));
    });

    test("Return null if some error occurs", () async {
      when(service.getMangaDetail(any)).thenAnswer((_) async => null);

      var networkAdapter =
          MangaNetworkAdapter(ServiceLocator().serviceLocator<MangaService>());

      await networkAdapter.getMangaDetail(any);

      expect(await networkAdapter.getMangaDetail(any), isNull);
      verify(networkAdapter.getMangaDetail(any));
    });
  });

  group("Get chapter detail", () {
    test("Return chapter detail", () async {
      when(service.getChapterDetail(any)).thenAnswer(
          (_) async => [ChapterImage(), ChapterImage(), ChapterImage()]);

      var networkAdapter =
          MangaNetworkAdapter(ServiceLocator().serviceLocator<MangaService>());

      await networkAdapter.getChapterDetail(any);

      expect(await networkAdapter.getChapterDetail(any),
          TypeMatcher<List<ChapterImage>>());
      verify(networkAdapter.getChapterDetail(any));
    });

    test("Return null if some error occurs", () async {
      when(service.getChapterDetail(any)).thenAnswer((_) async => null);

      var networkAdapter =
          MangaNetworkAdapter(ServiceLocator().serviceLocator<MangaService>());

      await networkAdapter.getChapterDetail(any);

      expect(await networkAdapter.getChapterDetail(any), isNull);
      verify(networkAdapter.getChapterDetail(any));
    });
  });
}
