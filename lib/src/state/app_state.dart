import 'package:flutter_app/src/domain/manga.dart';
import 'package:mobx/mobx.dart';

part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  @observable
  List<Manga> mangaList = <Manga>[];
}

final appState = AppState();
