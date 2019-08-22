import 'chapter.dart';

class Manga {
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
}
