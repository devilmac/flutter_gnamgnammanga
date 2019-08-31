import 'package:json_annotation/json_annotation.dart';

part 'manga_detail.g.dart';

@JsonSerializable()
class MangaDetail {
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaDetail &&
          runtimeType == other.runtimeType &&
          aka == other.aka &&
          akaAlias == other.akaAlias &&
          alias == other.alias &&
          artist == other.artist &&
          artistKw == other.artistKw &&
          author == other.author &&
          authorKw == other.authorKw &&
          baka == other.baka &&
          categories == other.categories &&
          chapters == other.chapters &&
          chaptersLen == other.chaptersLen &&
          created == other.created &&
          description == other.description &&
          hits == other.hits &&
          image == other.image &&
          imageURL == other.imageURL &&
          language == other.language &&
          lastChapterDate == other.lastChapterDate &&
          random == other.random &&
          released == other.released &&
          startsWith == other.startsWith &&
          status == other.status &&
          title == other.title &&
          titleKw == other.titleKw &&
          type == other.type &&
          updatedKeywords == other.updatedKeywords;

  @override
  int get hashCode =>
      aka.hashCode ^
      akaAlias.hashCode ^
      alias.hashCode ^
      artist.hashCode ^
      artistKw.hashCode ^
      author.hashCode ^
      authorKw.hashCode ^
      baka.hashCode ^
      categories.hashCode ^
      chapters.hashCode ^
      chaptersLen.hashCode ^
      created.hashCode ^
      description.hashCode ^
      hits.hashCode ^
      image.hashCode ^
      imageURL.hashCode ^
      language.hashCode ^
      lastChapterDate.hashCode ^
      random.hashCode ^
      released.hashCode ^
      startsWith.hashCode ^
      status.hashCode ^
      title.hashCode ^
      titleKw.hashCode ^
      type.hashCode ^
      updatedKeywords.hashCode;
}
