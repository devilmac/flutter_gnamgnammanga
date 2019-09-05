import 'package:flutter_app/src/config/configuration.dart';
import 'package:flutter_app/src/preferences/manga_preferences.dart';
import 'package:flutter_app/src/preferences/mangaeden/mangaeden_prefs.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class MangaPreferencesMangaeden implements MangaPreferences<MangaedenPrefs> {
  MangaPreferencesMangaeden(StreamingSharedPreferences sharedPreferences)
      : prefs = sharedPreferences.getCustomValue(
            MangaPrefsType.MANGAEDEN.toString(),
            defaultValue: MangaedenPrefs.defaultPrefs(),
            adapter: JsonAdapter(
                deserializer: (value) => MangaedenPrefs.fromJson(value)));

  final Preference<MangaedenPrefs> prefs;

  @override
  Stream<MangaedenPrefs> getValue() {
    return prefs;
  }

  @override
  void setValue(MangaedenPrefs value) {
    prefs.setValue(value);
  }
}
