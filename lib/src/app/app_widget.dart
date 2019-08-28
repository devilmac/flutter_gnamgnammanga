import 'package:flutter/material.dart';
import 'package:flutter_app/src/locale/app_localizations_delegate.dart';
import 'package:flutter_app/src/resource/resource_string.dart';
import 'package:flutter_app/src/ui/detail/detail_manga_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/src/ui/home/home_page_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

    return MaterialApp(
      title: APP_NAME,
      debugShowMaterialGrid: false,
      theme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: Color.fromARGB(255, 97, 21, 238),
          accentColor: Color.fromARGB(255, 162, 238, 21)),
      home: MangaHomePage(title: 'Manga'),
      routes: {DetailMangaWidget.routeName: (context) => DetailMangaWidget()},
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
