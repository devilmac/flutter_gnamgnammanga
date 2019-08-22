import 'dart:io';

import 'package:path_provider/path_provider.dart';

const String FILE_NAME = "manga.json";

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/$FILE_NAME');
}

Future<File> getAppDirectory() {
  return _localFile;
}
