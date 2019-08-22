import 'package:flutter/material.dart';
import 'package:flutter_app/src/resource/resource_string.dart';
import 'package:flutter_app/src/ui/home/home_page_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
          primaryColor: Colors.indigoAccent, primaryColorDark: Colors.indigo),
      home: MangaHomePage.gnamGnamHomePage(title: 'Manga'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale("it", "IT"), const Locale("en", "EN")],
    );
  }
}
