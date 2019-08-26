import 'package:flutter_app/src/domain/chapter_image.dart';

class Chapter {
  String number;
  double date;
  String title;
  String chapterID;
  List<ChapterImage> images;

  Chapter(this.number, this.date, this.title, this.chapterID);

  @override
  String toString() {
    return 'Chapter{number: $number, date: $date, title: $title, id: $chapterID}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Chapter &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          date == other.date &&
          title == other.title &&
          chapterID == other.chapterID &&
          images == other.images;

  @override
  int get hashCode =>
      number.hashCode ^
      date.hashCode ^
      title.hashCode ^
      chapterID.hashCode ^
      images.hashCode;
}
