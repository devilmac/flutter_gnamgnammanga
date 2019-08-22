import 'package:json_annotation/json_annotation.dart';

part 'manga.g.dart';

@JsonSerializable()
class Manga {
  @JsonKey(name: "i", required: true)
  final String mangaID;

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

  @JsonKey(name: "c")
  final List<String> categories;

  final List<List<dynamic>> chapters;

  @JsonKey(name: "chapters_len")
  final int chaptersLen;
  final double created;
  final String description;
  final int hits;

  @JsonKey(name: "im")
  final String image;
  final String imageURL;
  final int language;

  @JsonKey(name: "ld")
  final double lastChapterDate;
  final List<double> random;
  final int released;
  final String startsWith;

  @JsonKey(name: "s")
  final int status;

  @JsonKey(name: "t")
  final String title;

  @JsonKey(name: "title_kw")
  final List<String> titleKw;
  final int type;
  final bool updatedKeywords;

  Manga(
      this.mangaID,
      this.aka,
      this.akaAlias,
      this.alias,
      this.artist,
      this.artistKw,
      this.author,
      this.authorKw,
      this.baka,
      this.categories,
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
      this.status,
      this.title,
      this.titleKw,
      this.type,
      this.updatedKeywords);

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);
  Map<String, dynamic> toJson() => _$MangaToJson(this);
}
