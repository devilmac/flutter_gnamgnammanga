import 'package:flutter_app/src/config/service_locator.dart';
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
      when(client.get(any))
          .thenAnswer((_) async => Response("{\"manga\": []}", 200));

      var service = MangaedenService(ServiceLocator().serviceLocator<Client>());

      await service.getManga();

      verify(await client.get(any));
      expect(await service.getManga(), TypeMatcher<List<Manga>>());
    });

    test("Return null from service", () async {
      when(client.get(any)).thenAnswer((_) async => Response("", 200));

      var service = MangaedenService(ServiceLocator().serviceLocator<Client>());

      await service.getManga();

      verify(await client.get(any));
      expect(await service.getManga(), isNull);
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
      expect(await service.getMangaDetail(""), isNull);
    });
  });
}
