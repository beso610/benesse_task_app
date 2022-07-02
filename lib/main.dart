import 'package:benesse_task_app/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:benesse_task_app/ui/calendar.dart';

//void main() {
//  runApp(const ScaffoldExample());
//}

void main() => runApp( new MaterialApp(
  //home: Home(),
  home: CalendarScreen(),
  routes: <String, WidgetBuilder>{
    '/calendar': (BuildContext context) => CalendarScreen(),
  },
));
