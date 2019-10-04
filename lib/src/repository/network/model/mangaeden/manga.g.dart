// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manga _$MangaFromJson(Map<String, dynamic> json) {
  return Manga(
    json['i'] as String,
    (json['c'] as List)?.map((e) => e as String)?.toList(),
    json['im'] as String,
    json['s'] as int,
    (json['ld'] as num)?.toDouble(),
    json['t'] as String,
    json['h'] as num,
    json['a'] as String,
  );
}

Map<String, dynamic> _$MangaToJson(Manga instance) => <String, dynamic>{
      'i': instance.i,
      'c': instance.c,
      'h': instance.h,
      'a': instance.a,
      'im': instance.im,
      'ld': instance.ld,
      's': instance.s,
      't': instance.t,
    };
