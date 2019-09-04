// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaDetail _$MangaDetailFromJson(Map<String, dynamic> json) {
  return MangaDetail(
    (json['aka'] as List)?.map((e) => e as String)?.toList(),
    (json['aka-alias'] as List)?.map((e) => e as String)?.toList(),
    json['alias'] as String,
    json['artist'] as String,
    (json['artist_kw'] as List)?.map((e) => e as String)?.toList(),
    json['author'] as String,
    (json['author_kw'] as List)?.map((e) => e as String)?.toList(),
    json['baka'] as bool,
    (json['chapters'] as List)?.map((e) => e as List)?.toList(),
    json['chapters_len'] as num,
    json['created'] as num,
    json['description'] as String,
    json['hits'] as num,
    json['image'] as String,
    json['imageURL'] as String,
    json['language'] as num,
    json['last_chapter_date'] as num,
    (json['random'] as List)?.map((e) => e as num)?.toList(),
    json['released'] as num,
    json['startsWith'] as String,
    json['title'] as String,
    (json['title_kw'] as List)?.map((e) => e as String)?.toList(),
    json['type'] as num,
    json['updatedKeywords'] as bool,
    (json['categories'] as List)?.map((e) => e as String)?.toList(),
    json['status'] as num,
  );
}

Map<String, dynamic> _$MangaDetailToJson(MangaDetail instance) =>
    <String, dynamic>{
      'aka': instance.aka,
      'aka-alias': instance.akaAlias,
      'alias': instance.alias,
      'artist': instance.artist,
      'artist_kw': instance.artistKw,
      'author': instance.author,
      'author_kw': instance.authorKw,
      'baka': instance.baka,
      'categories': instance.categories,
      'chapters': instance.chapters,
      'chapters_len': instance.chaptersLen,
      'created': instance.created,
      'description': instance.description,
      'hits': instance.hits,
      'image': instance.image,
      'imageURL': instance.imageURL,
      'language': instance.language,
      'last_chapter_date': instance.lastChapterDate,
      'random': instance.random,
      'released': instance.released,
      'startsWith': instance.startsWith,
      'status': instance.status,
      'title': instance.title,
      'title_kw': instance.titleKw,
      'type': instance.type,
      'updatedKeywords': instance.updatedKeywords,
    };
