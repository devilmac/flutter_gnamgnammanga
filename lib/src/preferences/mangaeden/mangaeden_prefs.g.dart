// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mangaeden_prefs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaedenPrefs _$MangaedenPrefsFromJson(Map<String, dynamic> json) {
  return MangaedenPrefs(
    json['mangaLanguage'] as num,
    json['shouldReadJapaneseStyle'] as bool,
  );
}

Map<String, dynamic> _$MangaedenPrefsToJson(MangaedenPrefs instance) =>
    <String, dynamic>{
      'mangaLanguage': instance.mangaLanguage,
      'shouldReadJapaneseStyle': instance.shouldReadJapaneseStyle,
    };
