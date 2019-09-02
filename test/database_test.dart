import 'package:flutter_app/src/domain/chapter.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/repository/local/manga_database.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockMangaDatabase extends Mock implements MangaDatabase {}

void main() {
  final adapter = MockMangaDatabase();

  group("Get manga from database", () {
    test("Return manga list", () async {
      when(adapter.getFavorites())
          .thenAnswer((_) async => <Manga>[Manga(), Manga(), Manga()]);

      expect(await adapter.getFavorites(), TypeMatcher<List<Manga>>());
      verify(await adapter.getFavorites()).called(1);
    });
    test("Return null if no favorite are into database", () async {
      when(adapter.getFavorites()).thenAnswer((_) async => null);

      expect(await adapter.getFavorites(), isNull);
      verify(await adapter.getFavorites()).called(1);
    });
  });

  group("Get manga detail from database", () {
    test("Return manga detail", () async {
      when(adapter.getFavorite(any)).thenAnswer((_) async => MangaDetail());

      expect(await adapter.getFavorite(any), TypeMatcher<MangaDetail>());
      verify(await adapter.getFavorite(any)).called(1);
    });
    test("Return null if no manga detail is present into database", () async {
      when(adapter.getFavorite(any)).thenAnswer((_) async => null);

      expect(await adapter.getFavorite(any), isNull);
      verify(await adapter.getFavorite(any)).called(1);
    });
  });

  group("Get chapters of a manga from database", () {
    test("Return chapters", () async {
      when(adapter.getChapters(any))
          .thenAnswer((_) async => <Chapter>[Chapter(), Chapter(), Chapter()]);

      expect(await adapter.getChapters(any), TypeMatcher<List<Chapter>>());
      verify(await adapter.getChapters(any)).called(1);
    });
    test("Return null if a manga has no chapters", () async {
      when(adapter.getChapters(any)).thenAnswer((_) => null);

      expect(await adapter.getChapters(any), isNull);
      verify(await adapter.getChapters(any)).called(1);
    });
  });
}
