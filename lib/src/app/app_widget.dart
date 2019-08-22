import 'package:flutter/material.dart';
import 'package:flutter_app/src/resource/resource_string.dart';
import 'package:flutter_app/src/ui/splash/splash_screen_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(
          primaryColor: Colors.indigoAccent, primaryColorDark: Colors.indigo),
      home: SplashScreenWidget(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale("it", "IT"), const Locale("en", "EN")],
    );
  }
}
