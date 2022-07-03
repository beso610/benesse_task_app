// 参考: https://tamappe.com/2020/10/11/flutter-stop-watch-app/

import 'package:flutter/material.dart';
import 'dart:async';

class ClockTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClockTimerState();
  }
}

class _ClockTimerState extends State<ClockTimer> {
  /// 初期値
  var _timeString = '00:00:00';

  /// 開始時間
  late DateTime _startTime;

  /// ローカルタイマー
  var _timer;
  var _isStart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('魅力的なアプリ'),
        backgroundColor: Colors.teal[200],
      ),
      body: Container(
        color: Colors.teal[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(_timeString, style: TextStyle(fontSize: 60)),
            ),
            SizedBox(
                height: 30.0,
            ),
            Container(
              width: 100,
              height: 50,
              color: (_isStart ? Colors.red : Colors.blue),
              child: TextButton(
                  onPressed: _startTimer,
                  child: Text(
                      _isStart ? 'STOP' : 'START',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    setState(() {
      _isStart = !_isStart;
      if (_isStart) {
        _startTime = DateTime.now();
        _timer = Timer.periodic(Duration(seconds: 1), _onTimer);
      } else {
        _timer.cancel();
        // stopが押された後のページ遷移を記述
      }
    });
  }

  void _onTimer(Timer timer) {
    /// 現在時刻を取得
    var now = DateTime.now();

    /// 開始時刻と比較して差分を取得
    var diff = now.difference(_startTime).inSeconds;

    /// タイマーのロジック
    var hour = (diff / (60 * 60)).floor();
    var mod = diff % (60 * 60);
    var minutes = (mod / 60).floor();
    var second = mod % 60;

    setState(() => {
          _timeString =
              """${_convertTwoDigits(hour)}:${_convertTwoDigits(minutes)}:${_convertTwoDigits(second)}"""
        });
  }

  String _convertTwoDigits(int number) {
    return number >= 10 ? "$number" : "0$number";
  }
}