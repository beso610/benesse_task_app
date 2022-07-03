import 'package:benesse_task_app/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:benesse_task_app/ui/input_task.dart';
import 'package:benesse_task_app/ui/calendar.dart';
import 'package:benesse_task_app/ui/video.dart';

//void main() {
//  runApp(const ScaffoldExample());
//}

void main() => runApp( new MaterialApp(
  home: VideoScreen(),
  routes: <String, WidgetBuilder>{
    '/calendar': (BuildContext context) => CalendarScreen(),
    '/video': (BuildContext context) => VideoScreen(),
    '/input_task': (BuildContext context) => InputTask(),
  },
));