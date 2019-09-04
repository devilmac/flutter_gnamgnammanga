import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable(includeIfNull: false)
class Chapter extends Equatable {
  final List<List<dynamic>> images;

  Chapter({this.images}) : super([images]);

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);

  @override
  String toString() {
    return 'Chapter{images: $images}';
  }
}
