import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/repository/network/manga_network_adapter.dart';
import 'package:flutter_app/src/repository/network/service/mangaeden/mangaeden_service.dart';
import 'package:mobx/mobx.dart';

part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  final _mangaAdapter = MangaNetworkAdapter(MangaedenService());

  @observable
  List<Manga> mangaList;

  @observable
  Manga manga;

  @action
  Future getManga() async {
    var _response = await _mangaAdapter.getMangaList();

    this.mangaList = _response;
  }

  @action
  Future getMangaDetail(String mangaID) async {
    var _response = await _mangaAdapter.getMangaDetail(mangaID);

    this.manga = _response;
  }
}

final appState = AppState();
