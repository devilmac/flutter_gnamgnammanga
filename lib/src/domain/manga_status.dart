import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/locale/app_localizations.dart';

enum mangaStatus { IN_PROGRESS, COMPLETED }

String getLocalizedStatus(BuildContext context, mangaStatus status) {
  var statusAsString = "";

  switch (status) {
    case mangaStatus.IN_PROGRESS:
      statusAsString = AppLocalizations.of(context).statusInProgress;
      break;

    case mangaStatus.COMPLETED:
      statusAsString = AppLocalizations.of(context).statusCompleted;
      break;
  }

  return statusAsString;
}
