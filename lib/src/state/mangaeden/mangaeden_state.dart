import 'package:flutter_app/src/config/configuration.dart';
import 'package:flutter_app/src/preferences/mangaeden/mangaeden_prefs.dart';
import 'package:flutter_app/src/state/app_state.dart';
import 'package:mobx/mobx.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

part 'mangaeden_state.g.dart';

class MangaedenState = _MangaedenState with _$MangaedenState;

abstract class _MangaedenState with Store {
  @observable
  num selectedLanguage;

  @observable
  StreamingSharedPreferences sharedPreferences;

  @action
  Future getSharedPreferences() async {
    sharedPreferences = await StreamingSharedPreferences.instance;

    var mangaedenPrefs = sharedPreferences
        .getCustomValue(MangaPrefsType.MANGAEDEN.toString(),
            defaultValue: MangaedenPrefs.defaultPrefs(),
            adapter: JsonAdapter(
                deserializer: (value) => MangaedenPrefs.fromJson(value)))
        .getValue();

    selectedLanguage = mangaedenPrefs.mangaLanguage;

    appState.getManga(selectedLanguage);
  }
}

final mangaedenState = MangaedenState();
