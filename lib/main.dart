import 'package:benesse_task_app/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:benesse_task_app/ui/calender.dart';

//void main() {
//  runApp(const ScaffoldExample());
//}

void main() => runApp( new MaterialApp(
  home: Home(),
  routes: <String, WidgetBuilder>{
    '/calender': (BuildContext context) => CalenderScreen(),
  },
));
