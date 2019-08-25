import 'chapter.dart';

class Manga {
  String mangaID;
  List<String> aka;
  String author;
  List<String> categories;
  String description;
  List<Chapter> chapters;
  int chaptersLen;
  String image;
  String language;
  double lastChapterDate;
  int released;
  String status;
  String title;

  Manga({
    this.mangaID,
    this.aka,
    this.author,
    this.categories,
    this.chapters,
    this.chaptersLen,
    this.description,
    this.image,
    this.language,
    this.lastChapterDate,
    this.released,
    this.status,
    this.title,
  });

  @override
  String toString() {
    return 'Manga{mangaID: $mangaID, author: $author, title: $title}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Manga &&
          runtimeType == other.runtimeType &&
          mangaID == other.mangaID &&
          aka == other.aka &&
          author == other.author &&
          categories == other.categories &&
          description == other.description &&
          chapters == other.chapters &&
          chaptersLen == other.chaptersLen &&
          image == other.image &&
          language == other.language &&
          lastChapterDate == other.lastChapterDate &&
          released == other.released &&
          status == other.status &&
          title == other.title;

  @override
  int get hashCode =>
      mangaID.hashCode ^
      aka.hashCode ^
      author.hashCode ^
      categories.hashCode ^
      description.hashCode ^
      chapters.hashCode ^
      chaptersLen.hashCode ^
      image.hashCode ^
      language.hashCode ^
      lastChapterDate.hashCode ^
      released.hashCode ^
      status.hashCode ^
      title.hashCode;
}
