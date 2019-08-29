import 'package:json_annotation/json_annotation.dart';

part 'manga.g.dart';

@JsonSerializable()
class Manga {
  @JsonKey(name: "i")
  final String i;

  @JsonKey(ignore: true)
  String mangaID;

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
  final List<String> c;

  List<String> categories;

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
  final double ld;

  @JsonKey(name: "last_chapter_date")
  final double lastChapterDate;

  final List<double> random;
  final int released;
  final String startsWith;

  @JsonKey(name: "s")
  final int s;

  int status;

  @JsonKey(name: "t")
  final String t;

  final String title;

  @JsonKey(name: "title_kw")
  final List<String> titleKw;
  final int type;
  final bool updatedKeywords;

  Manga(
      this.i,
      this.aka,
      this.akaAlias,
      this.alias,
      this.artist,
      this.artistKw,
      this.author,
      this.authorKw,
      this.baka,
      this.c,
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
      this.s,
      this.title,
      this.titleKw,
      this.type,
      this.updatedKeywords,
      this.ld,
      this.t) {
    mangaID = i;
    categories = c;
  }

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

  Map<String, dynamic> toJson() => _$MangaToJson(this);

  @override
  String toString() {
    return 'Manga{mangaID: $mangaID, title: $title}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Manga &&
          runtimeType == other.runtimeType &&
          i == other.i &&
          mangaID == other.mangaID &&
          aka == other.aka &&
          akaAlias == other.akaAlias &&
          alias == other.alias &&
          artist == other.artist &&
          artistKw == other.artistKw &&
          author == other.author &&
          authorKw == other.authorKw &&
          baka == other.baka &&
          c == other.c &&
          categories == other.categories &&
          chapters == other.chapters &&
          chaptersLen == other.chaptersLen &&
          created == other.created &&
          description == other.description &&
          hits == other.hits &&
          image == other.image &&
          imageURL == other.imageURL &&
          language == other.language &&
          ld == other.ld &&
          lastChapterDate == other.lastChapterDate &&
          random == other.random &&
          released == other.released &&
          startsWith == other.startsWith &&
          s == other.s &&
          status == other.status &&
          t == other.t &&
          title == other.title &&
          titleKw == other.titleKw &&
          type == other.type &&
          updatedKeywords == other.updatedKeywords;

  @override
  int get hashCode =>
      i.hashCode ^
      mangaID.hashCode ^
      aka.hashCode ^
      akaAlias.hashCode ^
      alias.hashCode ^
      artist.hashCode ^
      artistKw.hashCode ^
      author.hashCode ^
      authorKw.hashCode ^
      baka.hashCode ^
      c.hashCode ^
      categories.hashCode ^
      chapters.hashCode ^
      chaptersLen.hashCode ^
      created.hashCode ^
      description.hashCode ^
      hits.hashCode ^
      image.hashCode ^
      imageURL.hashCode ^
      language.hashCode ^
      ld.hashCode ^
      lastChapterDate.hashCode ^
      random.hashCode ^
      released.hashCode ^
      startsWith.hashCode ^
      s.hashCode ^
      status.hashCode ^
      t.hashCode ^
      title.hashCode ^
      titleKw.hashCode ^
      type.hashCode ^
      updatedKeywords.hashCode;
}
