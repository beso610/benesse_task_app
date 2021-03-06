import 'package:benesse_task_app/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:benesse_task_app/ui/input_task.dart';
import 'package:benesse_task_app/ui/calendar.dart';
import 'package:benesse_task_app/ui/video.dart';
import 'package:benesse_task_app/ui/stopwatch.dart';
import 'package:benesse_task_app/ui/input_progress.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//void main() {
//  runApp(const ScaffoldExample());
//}
const locale = Locale("ja", "JP");

void main() => runApp(new MaterialApp(
  locale: locale,
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    locale,
  ],
  home: Home(),
  routes: <String, WidgetBuilder>{
    '/calendar': (BuildContext context) => CalendarScreen(),
    '/video': (BuildContext context) => VideoScreen(),
    '/input_task': (BuildContext context) => InputTask(),
    '/stopwatch': (BuildContext context) => ClockTimer(),
    '/input_progress': (BuildContext context) => InputProgress(),
  },
));
