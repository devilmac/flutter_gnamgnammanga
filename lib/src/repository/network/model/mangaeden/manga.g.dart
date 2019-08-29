// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manga _$MangaFromJson(Map<String, dynamic> json) {
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
    (json['last_chapter_date'] as num)?.toDouble(),
    (json['random'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
    json['released'] as int,
    json['startsWith'] as String,
    json['s'] as int,
    json['title'] as String,
    (json['title_kw'] as List)?.map((e) => e as String)?.toList(),
    json['type'] as int,
    json['updatedKeywords'] as bool,
    (json['ld'] as num)?.toDouble(),
    json['t'] as String,
  )
    ..categories =
        (json['categories'] as List)?.map((e) => e as String)?.toList()
    ..status = json['status'] as int;
}

Map<String, dynamic> _$MangaToJson(Manga instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('i', instance.i);
  writeNotNull('aka', instance.aka);
  writeNotNull('aka-alias', instance.akaAlias);
  writeNotNull('alias', instance.alias);
  writeNotNull('artist', instance.artist);
  writeNotNull('artist_kw', instance.artistKw);
  writeNotNull('author', instance.author);
  writeNotNull('author_kw', instance.authorKw);
  writeNotNull('baka', instance.baka);
  writeNotNull('c', instance.c);
  writeNotNull('categories', instance.categories);
  writeNotNull('chapters', instance.chapters);
  writeNotNull('chapters_len', instance.chaptersLen);
  writeNotNull('created', instance.created);
  writeNotNull('description', instance.description);
  writeNotNull('hits', instance.hits);
  writeNotNull('im', instance.image);
  writeNotNull('imageURL', instance.imageURL);
  writeNotNull('language', instance.language);
  writeNotNull('ld', instance.ld);
  writeNotNull('last_chapter_date', instance.lastChapterDate);
  writeNotNull('random', instance.random);
  writeNotNull('released', instance.released);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('s', instance.s);
  writeNotNull('status', instance.status);
  writeNotNull('t', instance.t);
  writeNotNull('title', instance.title);
  writeNotNull('title_kw', instance.titleKw);
  writeNotNull('type', instance.type);
  writeNotNull('updatedKeywords', instance.updatedKeywords);
  return val;
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic
