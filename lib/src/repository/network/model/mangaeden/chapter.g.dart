// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return Chapter(
    images: (json['images'] as List)?.map((e) => e as List)?.toList(),
  );
}

Map<String, dynamic> _$ChapterToJson(Chapter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('images', instance.images);
  return val;
}
