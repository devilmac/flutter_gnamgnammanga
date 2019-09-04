// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppState on _AppState, Store {
  final _$mangaDetailAtom = Atom(name: '_AppState.mangaDetail');

  @override
  MangaDetail get mangaDetail {
    _$mangaDetailAtom.context.enforceReadPolicy(_$mangaDetailAtom);
    _$mangaDetailAtom.reportObserved();
    return super.mangaDetail;
  }

  @override
  set mangaDetail(MangaDetail value) {
    _$mangaDetailAtom.context.conditionallyRunInAction(() {
      super.mangaDetail = value;
      _$mangaDetailAtom.reportChanged();
    }, _$mangaDetailAtom, name: '${_$mangaDetailAtom.name}_set');
  }

  final _$mangaListAtom = Atom(name: '_AppState.mangaList');

  @override
  List<Manga> get mangaList {
    _$mangaListAtom.context.enforceReadPolicy(_$mangaListAtom);
    _$mangaListAtom.reportObserved();
    return super.mangaList;
  }

  @override
  set mangaList(List<Manga> value) {
    _$mangaListAtom.context.conditionallyRunInAction(() {
      super.mangaList = value;
      _$mangaListAtom.reportChanged();
    }, _$mangaListAtom, name: '${_$mangaListAtom.name}_set');
  }

  final _$currentReadingChapterAtom =
      Atom(name: '_AppState.currentReadingChapter');

  @override
  List<ChapterImage> get currentReadingChapter {
    _$currentReadingChapterAtom.context
        .enforceReadPolicy(_$currentReadingChapterAtom);
    _$currentReadingChapterAtom.reportObserved();
    return super.currentReadingChapter;
  }

  @override
  set currentReadingChapter(List<ChapterImage> value) {
    _$currentReadingChapterAtom.context.conditionallyRunInAction(() {
      super.currentReadingChapter = value;
      _$currentReadingChapterAtom.reportChanged();
    }, _$currentReadingChapterAtom,
        name: '${_$currentReadingChapterAtom.name}_set');
  }

  final _$favoriteMangaListAtom = Atom(name: '_AppState.favoriteMangaList');

  @override
  List<Manga> get favoriteMangaList {
    _$favoriteMangaListAtom.context.enforceReadPolicy(_$favoriteMangaListAtom);
    _$favoriteMangaListAtom.reportObserved();
    return super.favoriteMangaList;
  }

  @override
  set favoriteMangaList(List<Manga> value) {
    _$favoriteMangaListAtom.context.conditionallyRunInAction(() {
      super.favoriteMangaList = value;
      _$favoriteMangaListAtom.reportChanged();
    }, _$favoriteMangaListAtom, name: '${_$favoriteMangaListAtom.name}_set');
  }

  final _$checkMangaFavoriteAtom = Atom(name: '_AppState.checkMangaFavorite');

  @override
  bool get checkMangaFavorite {
    _$checkMangaFavoriteAtom.context
        .enforceReadPolicy(_$checkMangaFavoriteAtom);
    _$checkMangaFavoriteAtom.reportObserved();
    return super.checkMangaFavorite;
  }

  @override
  set checkMangaFavorite(bool value) {
    _$checkMangaFavoriteAtom.context.conditionallyRunInAction(() {
      super.checkMangaFavorite = value;
      _$checkMangaFavoriteAtom.reportChanged();
    }, _$checkMangaFavoriteAtom, name: '${_$checkMangaFavoriteAtom.name}_set');
  }

  final _$firebaseUserAtom = Atom(name: '_AppState.firebaseUser');

  @override
  FirebaseUser get firebaseUser {
    _$firebaseUserAtom.context.enforceReadPolicy(_$firebaseUserAtom);
    _$firebaseUserAtom.reportObserved();
    return super.firebaseUser;
  }

  @override
  set firebaseUser(FirebaseUser value) {
    _$firebaseUserAtom.context.conditionallyRunInAction(() {
      super.firebaseUser = value;
      _$firebaseUserAtom.reportChanged();
    }, _$firebaseUserAtom, name: '${_$firebaseUserAtom.name}_set');
  }

  final _$getMangaAsyncAction = AsyncAction('getManga');

  @override
  Future getManga() {
    return _$getMangaAsyncAction.run(() => super.getManga());
  }

  final _$getMangaDetailAsyncAction = AsyncAction('getMangaDetail');

  @override
  Future getMangaDetail(String mangaID) {
    return _$getMangaDetailAsyncAction.run(() => super.getMangaDetail(mangaID));
  }

  final _$getChapterDetailAsyncAction = AsyncAction('getChapterDetail');

  @override
  Future getChapterDetail(String chapterID) {
    return _$getChapterDetailAsyncAction
        .run(() => super.getChapterDetail(chapterID));
  }

  final _$addRemoveMangaFavoriteAsyncAction =
      AsyncAction('addRemoveMangaFavorite');

  @override
  Future addRemoveMangaFavorite(Manga manga) {
    return _$addRemoveMangaFavoriteAsyncAction
        .run(() => super.addRemoveMangaFavorite(manga));
  }

  final _$getFavoritesAsyncAction = AsyncAction('getFavorites');

  @override
  Future getFavorites() {
    return _$getFavoritesAsyncAction.run(() => super.getFavorites());
  }

  final _$isMangaFavoriteAsyncAction = AsyncAction('isMangaFavorite');

  @override
  Future isMangaFavorite(String mangaID) {
    return _$isMangaFavoriteAsyncAction
        .run(() => super.isMangaFavorite(mangaID));
  }

  final _$signWithGoogleAsyncAction = AsyncAction('signWithGoogle');

  @override
  Future signWithGoogle(GoogleSignIn googleSignIn, FirebaseAuth firebaseAuth) {
    return _$signWithGoogleAsyncAction
        .run(() => super.signWithGoogle(googleSignIn, firebaseAuth));
  }
}
