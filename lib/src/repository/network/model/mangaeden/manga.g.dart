// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manga _$MangaFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['i']);
  return Manga(
    json['i'] as String,
    (json['aka'] as List)?.map((e) => e as String)?.toList(),
    (json['aka-alias'] as List)?.map((e) => e as String)?.toList(),
    json['alias'] as String,
    json['artist'] as String,
    (json['artist_kw'] as List)?.map((e) => e as String)?.toList(),
    json['author'] as String,
    (json['author_kw'] as List)?.map((e) => e as String)?.toList(),
    json['baka'] as bool,
    (json['c'] as List)?.map((e) => e as String)?.toList(),
    (json['chapters'] as List)?.map((e) => e as List)?.toList(),
    json['chapters_len'] as int,
    (json['created'] as num)?.toDouble(),
    json['description'] as String,
    json['hits'] as int,
    json['im'] as String,
    json['imageURL'] as String,
    json['language'] as int,
    (json['ld'] as num)?.toDouble(),
    (json['random'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
    json['released'] as int,
    json['startsWith'] as String,
    json['s'] as int,
    json['t'] as String,
    (json['title_kw'] as List)?.map((e) => e as String)?.toList(),
    json['type'] as int,
    json['updatedKeywords'] as bool,
  );
}

Map<String, dynamic> _$MangaToJson(Manga instance) => <String, dynamic>{
      'i': instance.mangaID,
      'aka': instance.aka,
      'aka-alias': instance.akaAlias,
      'alias': instance.alias,
      'artist': instance.artist,
      'artist_kw': instance.artistKw,
      'author': instance.author,
      'author_kw': instance.authorKw,
      'baka': instance.baka,
      'c': instance.categories,
      'chapters': instance.chapters,
      'chapters_len': instance.chaptersLen,
      'created': instance.created,
      'description': instance.description,
      'hits': instance.hits,
      'im': instance.image,
      'imageURL': instance.imageURL,
      'language': instance.language,
      'ld': instance.lastChapterDate,
      'random': instance.random,
      'released': instance.released,
      'startsWith': instance.startsWith,
      's': instance.status,
      't': instance.title,
      'title_kw': instance.titleKw,
      'type': instance.type,
      'updatedKeywords': instance.updatedKeywords,
    };
