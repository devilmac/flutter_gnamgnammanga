import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  final List<List<dynamic>> images;

  Chapter({this.images});

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}
