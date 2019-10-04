abstract class MangaPreferences<T> {
  Stream<T> getValue();

  void setValue(T value);
}
