import 'package:flutter/material.dart';
import 'package:benesse_task_app/ui/input_task.dart';

//void main() {
//  runApp(const ScaffoldExample());
//}

void main() => runApp( new MaterialApp(
  home: InputTask(),
  routes: <String, WidgetBuilder>{
    '/input_task': (BuildContext context) => InputTask(),
  },
));