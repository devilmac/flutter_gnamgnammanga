// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mangaeden_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MangaedenState on _MangaedenState, Store {
  final _$selectedLanguageAtom = Atom(name: '_MangaedenState.selectedLanguage');

  @override
  num get selectedLanguage {
    _$selectedLanguageAtom.context.enforceReadPolicy(_$selectedLanguageAtom);
    _$selectedLanguageAtom.reportObserved();
    return super.selectedLanguage;
  }

  @override
  set selectedLanguage(num value) {
    _$selectedLanguageAtom.context.conditionallyRunInAction(() {
      super.selectedLanguage = value;
      _$selectedLanguageAtom.reportChanged();
    }, _$selectedLanguageAtom, name: '${_$selectedLanguageAtom.name}_set');
  }

  final _$sharedPreferencesAtom =
      Atom(name: '_MangaedenState.sharedPreferences');

  @override
  StreamingSharedPreferences get sharedPreferences {
    _$sharedPreferencesAtom.context.enforceReadPolicy(_$sharedPreferencesAtom);
    _$sharedPreferencesAtom.reportObserved();
    return super.sharedPreferences;
  }

  @override
  set sharedPreferences(StreamingSharedPreferences value) {
    _$sharedPreferencesAtom.context.conditionallyRunInAction(() {
      super.sharedPreferences = value;
      _$sharedPreferencesAtom.reportChanged();
    }, _$sharedPreferencesAtom, name: '${_$sharedPreferencesAtom.name}_set');
  }

  final _$getSharedPreferencesAsyncAction = AsyncAction('getSharedPreferences');

  @override
  Future getSharedPreferences() {
    return _$getSharedPreferencesAsyncAction
        .run(() => super.getSharedPreferences());
  }

  final _$_MangaedenStateActionController =
      ActionController(name: '_MangaedenState');

  @override
  void reloadManga() {
    final _$actionInfo = _$_MangaedenStateActionController.startAction();
    try {
      return super.reloadManga();
    } finally {
      _$_MangaedenStateActionController.endAction(_$actionInfo);
    }
  }
}
