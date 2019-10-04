import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manga_detail.g.dart';

@JsonSerializable()
class MangaDetail extends Equatable {
  @JsonKey(name: "aka")
  final List<String> aka;

  @JsonKey(name: "aka-alias")
  final List<String> akaAlias;

  final String alias;

  final String artist;

  @JsonKey(name: "artist_kw")
  final List<String> artistKw;

  final String author;

  @JsonKey(name: "author_kw")
  final List<String> authorKw;

  final bool baka;

  final List<String> categories;

  final List<List<dynamic>> chapters;

  @JsonKey(name: "chapters_len")
  final num chaptersLen;

  final num created;
  final String description;
  final num hits;
  final String image;
  final String imageURL;
  final num language;

  @JsonKey(name: "last_chapter_date")
  final num lastChapterDate;

  final List<num> random;
  final num released;
  final String startsWith;
  final num status;
  final String title;

  @JsonKey(name: "title_kw")
  final List<String> titleKw;

  final num type;
  final bool updatedKeywords;

  MangaDetail(
    this.aka,
    this.akaAlias,
    this.alias,
    this.artist,
    this.artistKw,
    this.author,
    this.authorKw,
    this.baka,
    this.chapters,
    this.chaptersLen,
    this.created,
    this.description,
    this.hits,
    this.image,
    this.imageURL,
    this.language,
    this.lastChapterDate,
    this.random,
    this.released,
    this.startsWith,
    this.title,
    this.titleKw,
    this.type,
    this.updatedKeywords,
    this.categories,
    this.status,
  );

  factory MangaDetail.fromJson(Map<String, dynamic> json) =>
      _$MangaDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MangaDetailToJson(this);

  @override
  String toString() {
    return 'Manga{aka: $aka, akaAlias: $akaAlias, alias: $alias, artist: $artist, artistKw: $artistKw, author: $author, authorKw: $authorKw, baka: $baka, categories: $categories, chaptersLen: $chaptersLen, created: $created, description: $description, hits: $hits, image: $image, imageURL: $imageURL, language: $language, lastChapterDate: $lastChapterDate, random: $random, released: $released, startsWith: $startsWith, status: $status, title: $title, titleKw: $titleKw, type: $type, updatedKeywords: $updatedKeywords}';
  }

  @override
  List<Object> get props => [
        aka,
        akaAlias,
        artist,
        artistKw,
        author,
        authorKw,
        baka,
        chapters,
        chaptersLen,
        created,
        description,
        hits,
        image,
        imageURL,
        language,
        lastChapterDate,
        random,
        released,
        startsWith,
        title,
        titleKw,
        type,
        updatedKeywords,
        categories,
        status
      ];
}
