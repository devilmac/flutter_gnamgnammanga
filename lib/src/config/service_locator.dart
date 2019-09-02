import 'package:flutter_app/src/repository/local/manga_db_adapter.dart';
import 'package:flutter_app/src/repository/local/manga_db_factory.dart';
import 'package:flutter_app/src/repository/local/mangaeden/mangaeden_db_factory.dart';
import 'package:flutter_app/src/repository/manga_adapter.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/manga_service.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

class ServiceLocator {
  GetIt _serviceLocator = GetIt.instance;

  void initServices() {
    _serviceLocator.registerSingleton<Client>(Client());

    _serviceLocator.registerLazySingleton<MangaService>(
        () => MangaedenService(_serviceLocator<Client>()));

    _serviceLocator.registerFactory<MangaAdapter>(
        () => MangaNetworkAdapter(_serviceLocator<MangaService>()),
        "networkAdapter");

    _serviceLocator.registerFactory<MangaDbAbstractFactory>(() {
      return MangaEdenDbFactory();
    });

    _serviceLocator.registerLazySingleton<MangaAdapter>(() {
      return MangaDbAdapter(_serviceLocator<MangaEdenDbFactory>());
    });
  }

  GetIt get serviceLocator => _serviceLocator;
}
