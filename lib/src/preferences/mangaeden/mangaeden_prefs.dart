import 'package:flutter_app/src/config/configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mangaeden_prefs.g.dart';

@JsonSerializable()
class MangaedenPrefs {
  static const KEY = MangaPrefsType.MANGAEDEN;

  num mangaLanguage;
  bool shouldReadJapaneseStyle;

  MangaedenPrefs(this.mangaLanguage, this.shouldReadJapaneseStyle);

  MangaedenPrefs.defaultPrefs()
      : mangaLanguage = 0,
        shouldReadJapaneseStyle = false;

  factory MangaedenPrefs.fromJson(Map<String, dynamic> json) =>
      _$MangaedenPrefsFromJson(json);

  Map<String, dynamic> toJson() => _$MangaedenPrefsToJson(this);
}
