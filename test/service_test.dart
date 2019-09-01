import 'dart:convert';

import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/network/service/manga_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockMangaService extends Mock implements MangaService {}

void main() {
  group("Get all manga", () {
    final adapter = MockMangaService();

    test("Return manga list", () async {
      when(adapter.getManga())
          .thenAnswer((_) async => <Manga>[Manga(), Manga(), Manga()]);

      expect(await adapter.getManga(), TypeMatcher<List<Manga>>());
      verify(await adapter.getManga()).called(1);
    });

    test("Throws JsonUnsupportedObjectError on JSON decode failed", () async {
      when(adapter.getManga()).thenThrow(JsonUnsupportedObjectError);

      expect(() => adapter.getManga(), throwsA(JsonUnsupportedObjectError));
      verify(await adapter.getManga()).called(1);
    });

    test("Return null if some error occurs", () async {
      when(adapter.getManga()).thenAnswer((_) async => null);

      expect(await adapter.getManga(), isNull);
      verify(await adapter.getManga()).called(1);
    });
  });

  group("Get manga detail", () {
    final adapter = MockMangaService();

    test("Return manga detail", () async {
      when(adapter.getMangaDetail(any)).thenAnswer((_) async => MangaDetail());

      expect(await adapter.getMangaDetail(any), TypeMatcher<MangaDetail>());
      verify(await adapter.getMangaDetail(any)).called(1);
    });
    test("Throws JsonUnsupportedObjectError on JSON decode failed", () async {
      when(adapter.getMangaDetail(any)).thenThrow(JsonUnsupportedObjectError);

      expect(() => adapter.getMangaDetail(any),
          throwsA(JsonUnsupportedObjectError));
      verify(await adapter.getMangaDetail(any)).called(1);
    });
    test("Return null if some error occurs", () async {
      when(adapter.getMangaDetail(any)).thenAnswer((_) async => null);

      expect(await adapter.getMangaDetail(any), isNull);
      verify(await adapter.getMangaDetail(any)).called(1);
    });
  });

  group("Get chapter detail", () {
    final adapter = MockMangaService();

    test("Return chapter detail", () async {
      when(adapter.getChapterDetail(any)).thenAnswer(
          (_) async => [ChapterImage(), ChapterImage(), ChapterImage()]);

      expect(await adapter.getChapterDetail(any),
          TypeMatcher<List<ChapterImage>>());
      verify(await adapter.getChapterDetail(any)).called(1);
    });
    test("Throws JsonUnsupportedObjectError on JSON decode failed", () async {
      when(adapter.getChapterDetail(any)).thenThrow(JsonUnsupportedObjectError);

      expect(() => adapter.getChapterDetail(any),
          throwsA(JsonUnsupportedObjectError));
      verify(await adapter.getChapterDetail(any)).called(1);
    });
    test("Return null if some error occurs", () async {
      when(adapter.getChapterDetail(any)).thenAnswer((_) async => null);

      expect(await adapter.getChapterDetail(any), isNull);
      verify(await adapter.getChapterDetail(any)).called(1);
    });
  });
}
