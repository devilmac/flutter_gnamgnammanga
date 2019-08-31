import 'package:json_annotation/json_annotation.dart';

part 'manga.g.dart';

@JsonSerializable()
class Manga {
  @JsonKey(name: "i")
  final String i;

  @JsonKey(name: "c")
  final List<String> c;

  @JsonKey(name: "h")
  final num h;

  @JsonKey(name: "a")
  final String a;

  @JsonKey(name: "im")
  final String im;

  @JsonKey(name: "ld")
  final double ld;

  @JsonKey(name: "s")
  final int s;

  @JsonKey(name: "t")
  final String t;

  Manga(this.i, this.c, this.im, this.s, this.ld, this.t, this.h, this.a);

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

  Map<String, dynamic> toJson() => _$MangaToJson(this);

  @override
  String toString() {
    return 'Manga{i: $i, c: $c, h: $h, a: $a, im: $im, ld: $ld, s: $s, t: $t}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Manga &&
          runtimeType == other.runtimeType &&
          i == other.i &&
          c == other.c &&
          h == other.h &&
          a == other.a &&
          im == other.im &&
          ld == other.ld &&
          s == other.s &&
          t == other.t;

  @override
  int get hashCode =>
      i.hashCode ^
      c.hashCode ^
      h.hashCode ^
      a.hashCode ^
      im.hashCode ^
      ld.hashCode ^
      s.hashCode ^
      t.hashCode;
}
