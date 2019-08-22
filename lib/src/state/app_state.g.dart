// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppState on _AppState, Store {
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
}
