import 'package:flutter/cupertino.dart';

abstract class AppNavigator {
  void goToMangaDetail(BuildContext context, String pageRouteName,
      {Object arguments});

  void goToReadingChapter(BuildContext context, String pageRouteName,
      {Object arguments});
}
