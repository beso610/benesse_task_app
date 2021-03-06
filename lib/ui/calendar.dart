// 参考: https://qiita.com/Ryota-Nakamura-317/items/56a022a37c9dd8e2d020

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

import 'home.dart';
import 'input_task.dart';
import 'video.dart';
import 'data.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List> _eventsList = {};
  CalendarFormat _calendarFormat = CalendarFormat.month;

  var sceneIndex = <Widget>[
    Home(),
    CalendarScreen(),
    VideoScreen(),
    InputTask(),
  ];

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    //サンプルのイベントリスト
    _eventsList = {
      DateTime.now(): [
        '国語 5p',
        '化学 8p',
        '数学 3p',
        '英語 6p',
      ],
      DateTime.now().add(Duration(days: 1)): [
        '国語 2p',
        '化学 4p',
        '数学 3p',
        '英語 6p',
      ],
      DateTime.now().add(Duration(days: 2)): [
        '国語 2p',
        '物理 4p',
        '数学 3p',
      ],
      DateTime.now().add(Duration(days: 3)): [
        '日本史 2p',
        '世界史 4p',
        '数学 3p',
        '物理 3p',
        '生物 3p',
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('カレンダー'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal[200],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.teal[100],
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                eventLoader: getEventForDay,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                    getEventForDay(selectedDay);
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    if (events.isNotEmpty) {
                      return _buildEventsMarker(date, events);
                    }
                  },

                )


              ),
              Expanded(
                child: ListView(
                  children: getEventForDay(_selectedDay!)
                      .map((event) => ListTile(
                    title: Text(event.toString()),
                  ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[50],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today,color:Colors.blue,),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call, color: Colors.grey),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit, color: Colors.grey),
            label: 'Input Task',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (int i){
          if(i != 1) {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => sceneIndex[i]));
          };
        },
      ),
    );
  }
}

Widget _buildEventsMarker(DateTime date, List events) {
  return Positioned(
    right: 5,
    bottom: 5,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red[300],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    ),
  );
}