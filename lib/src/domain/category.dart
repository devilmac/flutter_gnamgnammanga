import 'package:equatable/equatable.dart';
import 'package:flutter_app/src/repository/local/mangaeden/sqflite/sqlite_util.dart';

class Category extends Equatable {
  final String name;

  Category(this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SqliteUtilMangaeden.CATEGORY_NAME_COLUMN: name,
    };

    return map;
  }

  Category.fromMap(Map<String, dynamic> map)
      : this(
          map[SqliteUtilMangaeden.CATEGORY_NAME_COLUMN],
        );

  @override
  String toString() {
    return 'Category{id: name: $name}';
  }

  @override
  List<Object> get props => [name];
}
