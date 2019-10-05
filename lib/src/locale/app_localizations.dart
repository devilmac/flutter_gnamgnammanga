import 'package:flutter/material.dart';
import 'package:flutter_app/src/locale/l10n/messages_all.dart';
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
        locale: "en",
        name: "tabAllManga",
        desc: "Label of all manga's TabView on the home page");
  }

  String get tabFavoritesManga {
    return Intl.message("Favorites",
        locale: "en",
        name: "tabFavoritesManga",
        desc: "Label of favorite manga's TabView on the home page");
  }

  String get detailAuthor {
    return Intl.message("Author",
        locale: "en",
        name: "detailAuthor",
        desc: "Author label on detail page");
  }

  String get detailUpdated {
    return Intl.message("Updated",
        locale: "en",
        name: "detailUpdated",
        desc: "Updated label on detail page");
  }

  String get detailStatus {
    return Intl.message("Status",
        locale: "en",
        name: "detailStatus",
        desc: "Status label on detail page");
  }

  String get statusCompleted {
    return Intl.message("Completed",
        locale: "en", name: "statusCompleted", desc: "Value for label status");
  }

  String get statusInProgress {
    return Intl.message("In progress",
        locale: "en", name: "statusInProgress", desc: "Value for label status");
  }

  String get detailChapters {
    return Intl.message("Chapters",
        locale: "en",
        name: "detailChapters",
        desc: "Chapter label on detail page");
  }

  String get enLang {
    return Intl.message("English", locale: "en", name: "enLang");
  }

  String get itLang {
    return Intl.message("Italian", locale: "en", name: "itLang");
  }

  String get selectMangaLanguage {
    return Intl.message("Select manga language",
        locale: "en", name: "selectMangaLanguage");
  }

  String get searchMangaHint {
    return Intl.message("Search a manga...",
        locale: "en", name: "searchMangaHint");
  }
}
