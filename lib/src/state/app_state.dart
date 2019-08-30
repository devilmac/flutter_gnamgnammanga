import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/repository/repository.dart';
import 'package:mobx/mobx.dart';

part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  final Repository _repository = Repository();

  @observable
  Manga manga;

  @observable
  List<Manga> mangaList;

  @observable
  List<ChapterImage> currentReadingChapter;

  @observable
  List<Manga> favoriteMangaList;

  @observable
  bool checkMangaFavorite = false;

  @action
  Future getManga() async {
    var _response = await _repository.getAllManga();

    this.mangaList = _response;
  }

  @action
  Future getMangaDetail(String mangaID) async {
    var _response = await _repository.getMangaDetail(mangaID);

    this.manga = _response;
  }

  @action
  Future getChapterDetail(String chapterID) async {
    var _response = await _repository.getChapterDetail(chapterID);

    this.currentReadingChapter = _response;
  }

  @action
  Future addRemoveMangaFavorite(Manga manga) async {
    await _repository.addRemoveFavoriteManga(manga);

    checkMangaFavorite = await _repository.isMangaFavorite(manga.mangaID);

    getFavorites();
  }

  @action
  Future getFavorites() async {
    var _response = await _repository.getFavorites();

    this.favoriteMangaList = _response;
  }

  @action
  Future isMangaFavorite(String mangaID) async {
    var _response = await _repository.isMangaFavorite(mangaID);

    checkMangaFavorite = _response;
  }
}

final appState = AppState();
