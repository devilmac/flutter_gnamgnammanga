import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/src/locale/app_localizations_delegate.dart';
import 'package:flutter_app/src/resource/resource_string.dart';
import 'package:flutter_app/src/ui/detail/detail_manga_widget.dart';
import 'package:flutter_app/src/ui/home/home_page_widget.dart';
import 'package:flutter_app/src/ui/reading/reading_chapter_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

    return MaterialApp(
      title: APP_NAME,
      debugShowMaterialGrid: false,
      theme: ThemeData(
          textTheme: Typography.blackMountainView.apply(
              displayColor: Color(0xFF212121), bodyColor: Color(0xFF757575)),
          iconTheme: IconThemeData(),
          dividerColor: Color(0xFFBDBDBD),
          primaryColorLight: Color(0xFFD1C4E9),
          primaryColor: Color(0xFF673AB7),
          primaryColorDark: Color(0xFF512DA8),
          accentColor: Color(0xFFFFC107)),
      home: MangaHomePage(title: 'Manga'),
      routes: {
        DetailMangaWidget.routeName: (context) => DetailMangaWidget(),
        ReadingChapterWidget.routeName: (context) => ReadingChapterWidget()
      },
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("en", "EN"),
        const Locale("it", "IT"),
      ],
    );
  }
}
