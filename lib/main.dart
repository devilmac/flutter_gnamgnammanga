import 'dart:async';

import 'package:flutter/material.dart';
import 'src/app/app_widget.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;

  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned<Future<void>>(() async {},
      onError: Crashlytics.instance.recordFlutterError);

  runApp(AppWidget());
}
