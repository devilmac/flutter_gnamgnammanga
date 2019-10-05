import 'package:equatable/equatable.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqflite/sqlite_util.dart';

class Category extends Equatable {
  final String name;
  final String language;

  Category(this.name, this.language);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteUtilMangaeden.CATEGORY_NAME_COLUMN: name,
    };

    return map;
  }

  Category.fromMap(Map<String, dynamic> map)
      : this(map[SqliteUtilMangaeden.CATEGORY_NAME_COLUMN],
            map[SqliteUtilMangaeden.CATEGORY_LANGUAGE_COLUMN]);

  @override
  String toString() {
    return 'Category{name: $name, language: $language}';
  }

  @override
  List<Object> get props => [name, language];
}
