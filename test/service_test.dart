import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  http.Client client;

  setUpAll(() {
    client = MockClient();
  });

  group("Get manga list", () {
    test("Return manga list from service", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response(
          "{\"manga\": [{\"a\": \"joshiraku\",\"c\": [\"Comedy\",\"Shounen\",\"Slice of Life\"],\"h\": 0,\"i\": \"5bfdd0ff719a162b3c196677\",\"im\": \"4e/4e55aeda6ba2044eb2762124688b61e74f24880515e71827f1f1e2c4.png\",\"ld\": 1543389646.0,\"s\": 2,\"t\": \"Joshiraku\"}]}",
          200));

      var service = MangaedenService(client);

      await service.getMangaList(0);

      verify(await client.get(any));
      expect(await service.getMangaList(0), isA<List<Manga>>());
    });

    test("Return null from service", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response(
          "{\"manga\": [{\"a\": \"joshiraku\",\"c\": [\"Comedy\",\"Shounen\",\"Slice of Life\"],\"h\": 0,\"i\": \"5bfdd0ff719a162b3c196677\",\"im\": \"4e/4e55aeda6ba2044eb2762124688b61e74f24880515e71827f1f1e2c4.png\",\"ld\": 1543389646.0,\"s\": 2,\"t\": \"Joshiraku\"}}",
          200));

      var service = MangaedenService(client);

      await service.getMangaList(0);

      verify(await client.get(any));
      expect(await service.getMangaList(0), isNull);
    });

    test("Return exception from service", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response(
          "{\"manga\": [{\"a\": \"joshiraku\",\"c\": [\"Comedy\",\"Shounen\",\"Slice of Life\"],\"h\": 0,\"i\": \"5bfdd0ff719a162b3c196677\",\"im\": \"4e/4e55aeda6ba2044eb2762124688b61e74f24880515e71827f1f1e2c4.png\",\"ld\": 1543389646.0,\"s\": 2,\"t\": \"Joshiraku\"}}",
          200));

      var service = MangaedenService(client);

      try {
        verify(await client.get(any));
        await service.getMangaList(0);
      } on FormatException catch (e) {
        expect(e, isFormatException);
      }
    });
  });

  group("Get manga detail", () {
    test("Return manga detail from service", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response(
          '{'
          '"chapters":['
          '[0, 1537857456.0, "[ONESHOT]", "5ba9d7b0719a169a01635cda"]]'
          '}',
          200));

      var service = MangaedenService(client);

      await service.getMangaDetail("");

      verify(await client.get(any));
      expect(await service.getMangaDetail(""), isA<MangaDetail>());
    });

    test("Return null from service", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response("", 200));

      var service = MangaedenService(client);

      await service.getMangaDetail("");

      verify(await client.get(any));
      expect(await service.getMangaDetail(""), isNull);
    });

    test("Return exception from service", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response("", 200));

      var service = MangaedenService(client);

      try {
        verify(await client.get(any));
        await service.getMangaDetail("");
      } on FormatException catch (e) {
        expect(e, isFormatException);
      }
    });
  });

  group("Get chapter detail", () {
    test("Return chapter detail from service", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response(
          "{\"images\": [[13,\"1d/1d760a468c7b76d4cfc7ff6bef2794404256a693c41981cf213e579b.jpg\",728,1033]]}",
          200));

      var service = MangaedenService(client);

      await service.getChapterDetail("");

      verify(await client.get(any));
      expect(await service.getChapterDetail(""), isA<List<ChapterImage>>());
    });

    test("Return null from service", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response("", 200));

      var service = MangaedenService(client);

      await service.getChapterDetail("");

      verify(await client.get(any));
      expect(await service.getChapterDetail(""), isNull);
    });

    test("Return exception from service", () async {
      when(client.get(any)).thenAnswer((_) async => http.Response("", 200));

      var service = MangaedenService(client);

      try {
        verify(await client.get(any));
        await service.getChapterDetail("");
      } on FormatException catch (e) {
        expect(e, isFormatException);
      }
    });
  });
}
