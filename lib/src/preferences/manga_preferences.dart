import 'package:flutter_app/src/config/configuration.dart';

abstract class MangaPreferences<T> {
  Stream<T> getValue();
  void setValue(T value);
}
