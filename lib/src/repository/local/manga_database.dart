abstract class MangaDatabase {
  var dbName = "";
  var dbVersion = 1;

  Future getLanguage();

  Future<void> closeDatabase();
}
