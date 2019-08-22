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

const gridImagePlaceholder =
    "http://img2.wikia.nocookie.net/__cb20140715205720/theannoyingroleplayers/images/4/47/Placeholder.png";
