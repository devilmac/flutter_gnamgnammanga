import 'package:flutter/material.dart';
import 'package:flutter_app/src/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  String get tabAllManga {
    return Intl.message("All manga",
        name: "tabAllManga",
        desc: "Label of all manga's TabView on the home page");
  }

  String get tabFavoritesManga {
    return Intl.message("Favorites",
        name: "tabFavoritesManga",
        desc: "Label of favorite manga's TabView on the home page");
  }
}
