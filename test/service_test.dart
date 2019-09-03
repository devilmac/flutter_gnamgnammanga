import 'dart:convert';

import 'package:flutter_app/src/config/service_locator.dart';
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements Client {}

void main() {
  Client client;

  setUpAll(() {
    ServiceLocator().initServices();
    ServiceLocator().serviceLocator.allowReassignment = true;

    client = MockClient();

    ServiceLocator().serviceLocator.registerSingleton<Client>(client);
  });

  group("Get manga list", () {
    test("Return manga list from service", () async {
      when(client.get(any)).thenAnswer((_) async => Response(
          "{\"manga\": [{\"a\": \"joshiraku\",\"c\": [\"Comedy\",\"Shounen\",\"Slice of Life\"],\"h\": 0,\"i\": \"5bfdd0ff719a162b3c196677\",\"im\": \"4e/4e55aeda6ba2044eb2762124688b61e74f24880515e71827f1f1e2c4.png\",\"ld\": 1543389646.0,\"s\": 2,\"t\": \"Joshiraku\"}]}",
          200));

      var service = MangaedenService(ServiceLocator().serviceLocator<Client>());

      await service.getMangaList();

      verify(await client.get(any));
      expect(await service.getMangaList(), TypeMatcher<List<Manga>>());
    });

    test("Return null from service", () async {
      when(client.get(any)).thenAnswer((_) async => Response("", 200));

      var service = MangaedenService(ServiceLocator().serviceLocator<Client>());

      await service.getMangaList();

      verify(await client.get(any));
      expect(service.getMangaList(),
          throwsA(TypeMatcher<JsonUnsupportedObjectError>()));
    });
  });

  group("Get manga detail", () {
    test("Return manga detail from service", () async {
      when(client.get(any)).thenAnswer((_) async => Response("{}", 200));

      var service = MangaedenService(ServiceLocator().serviceLocator<Client>());

      await service.getMangaDetail("");

      verify(await client.get(any));
      expect(await service.getMangaDetail(""), TypeMatcher<MangaDetail>());
    });

    test("Return null from service", () async {
      when(client.get(any)).thenAnswer((_) async => Response("", 200));

      var service = MangaedenService(ServiceLocator().serviceLocator<Client>());

      await service.getMangaDetail("");

      verify(await client.get(any));
      expect(await service.getMangaDetail(""),
          throwsA(TypeMatcher<JsonUnsupportedObjectError>()));
    });
  });

  group("Get chapter detail", () {
    test("Return chapter detail from service", () async {
      when(client.get(any)).thenAnswer((_) async => Response(
          "{\"images\": [[13,\"1d/1d760a468c7b76d4cfc7ff6bef2794404256a693c41981cf213e579b.jpg\",728,1033]]}",
          200));

      var service = MangaedenService(ServiceLocator().serviceLocator<Client>());

      await service.getChapterDetail("");

      verify(await client.get(any));
      expect(await service.getChapterDetail(""),
          TypeMatcher<List<ChapterImage>>());
    });

    test("Return null from service", () async {
      when(client.get(any)).thenAnswer((_) async => Response("", 200));

      var service = MangaedenService(ServiceLocator().serviceLocator<Client>());

      await service.getChapterDetail("");

      verify(await client.get(any));
      expect(await service.getChapterDetail(""),
          throwsA(TypeMatcher<JsonUnsupportedObjectError>()));
    });
  });
}
