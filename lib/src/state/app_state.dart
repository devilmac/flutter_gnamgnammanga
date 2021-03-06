import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/src/domain/category.dart' as domainCategory;
import 'package:flutter_app/src/domain/chapter_image.dart';
import 'package:flutter_app/src/domain/manga.dart';
import 'package:flutter_app/src/domain/manga_detail.dart';
import 'package:flutter_app/src/domain/manga_language.dart';
import 'package:flutter_app/src/repository/repository.dart';
import 'package:flutter_app/src/state/mangaeden/mangaeden_state.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  final Repository _repository = Repository();

  @observable
  MangaDetail mangaDetail;

  @observable
  List<Manga> mangaList;

  @observable
  List<ChapterImage> currentReadingChapter;

  @observable
  List<Manga> favoriteMangaList;

  @observable
  bool checkMangaFavorite = false;

  @observable
  FirebaseUser firebaseUser;

  @observable
  List<domainCategory.Category> categories;

  num selectedLanguage = 0;

  @action
  Future getManga(num selectedLanguage) async {
    this.selectedLanguage = selectedLanguage;

    var _response = await _repository.getAllManga(selectedLanguage);

    // Add category to database
    if (_response != null) {
      compute(addCategoriesToDB, _response);
    }

    this.mangaList = _response;
  }

  @action
  Future getMangaDetail(String mangaID, num lastChapterDate) async {
    var isMangaUpToDate =
        await _repository.isMangaUpToDate(mangaID, lastChapterDate);

    var _response = await _repository.getMangaDetail(mangaID, isMangaUpToDate);

    this.mangaDetail = _response;
  }

  @action
  Future getChapterDetail(String chapterID) async {
    this.currentReadingChapter = null;

    var _response = await _repository.getChapterDetail(chapterID);

    this.currentReadingChapter = _response;
  }

  @action
  Future addRemoveMangaFavorite(Manga manga) async {
    await _repository.addRemoveFavoriteManga(manga);

    checkMangaFavorite = await _repository.isMangaFavorite(manga.mangaID);

    getFavorites(mangaedenState.selectedLanguage);
  }

  @action
  Future getFavorites(num selectedLanguage) async {
    var _response = await _repository.getFavorites(selectedLanguage);

    this.favoriteMangaList = _response;
  }

  @action
  Future isMangaFavorite(String mangaID) async {
    var _response = await _repository.isMangaFavorite(mangaID);

    checkMangaFavorite = _response;
  }

  @action
  Future signWithGoogle(
      GoogleSignIn googleSignIn, FirebaseAuth firebaseAuth) async {
    var googleUser = await googleSignIn.signIn();
    var googleAuth = await googleUser.authentication;

    var credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    var authResult = await firebaseAuth.signInWithCredential(credential);

    var user = authResult.user;

    this.firebaseUser = user;
  }

  @action
  Future getCategories() async {
    var selectedLanguage = mangaedenState.selectedLanguage;

    _repository.getCategories(mangaLanguage[selectedLanguage]);
  }
}

final appState = AppState();

addCategoriesToDB(List<Manga> mangaList) async {
  appState._repository.addCategoriesToDB(mangaList, appState.selectedLanguage);
}
