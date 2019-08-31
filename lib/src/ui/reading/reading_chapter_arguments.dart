import 'package:flutter_app/src/domain/chapter.dart';

class ReadingChapterArguments {
  final Chapter _chapter;

  ReadingChapterArguments(this._chapter);

  Chapter get chapter => _chapter;
}
