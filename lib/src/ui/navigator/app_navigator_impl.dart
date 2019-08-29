import 'package:flutter/material.dart';
import 'package:flutter_app/src/ui/navigator/app_navigator.dart';

class AppNavigatorImpl implements AppNavigator {
  @override
  void goToMangaDetail(BuildContext context, String pageRouteName,
      {Object arguments}) {
    Navigator.pushNamed(context, pageRouteName, arguments: arguments);
  }

  @override
  void goToReadingChapter(BuildContext context, String pageRouteName,
      {Object arguments}) {
    // TODO: implement goToReadingChapter
  }
}
