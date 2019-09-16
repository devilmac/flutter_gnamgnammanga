import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/locale/app_localizations.dart';

class LanguageMap {
  Map<String, _MangaedenLanguage> mangaEdenLanguage;

  LanguageMap(BuildContext context)
      : mangaEdenLanguage = {
          itLocale: _MangaedenLanguage(AppLocalizations.of(context).itLang, 1),
          enLocale: _MangaedenLanguage(AppLocalizations.of(context).enLang, 0)
        };
}

const itLocale = "it";
const enLocale = "en";

class _MangaedenLanguage extends Equatable {
  final String name;
  final num value;

  _MangaedenLanguage(this.name, this.value) : super([name, value]);
}
