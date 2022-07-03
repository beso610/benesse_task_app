import 'package:flutter/material.dart';

class InputProgress extends StatefulWidget {
  @override
  _InputProgressState createState() => _InputProgressState();
}

class _InputProgressState extends State<InputProgress> {
  String _text = '';

  void _handleText(String e) {
    setState(() {
      // 状態を保持する変数を変更する処理は、setState内に記述する
      _text = e;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('魅力的なアプリ'),
        centerTitle: true,
        backgroundColor: Colors.teal[200],
      ),
      body: SafeArea(
        child: Container(
            color: Colors.teal[100],
            //width: 210.0, //横幅調整
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "進捗を入力しよう",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),
                TextField(
                    // テキストを表示
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 30.0,
                    ),
                    textAlign: TextAlign.right,
                    onChanged: _handleText,
                    decoration: InputDecoration(
                      suffix: Text(
                        "ページまで進んだ　　",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    )),
                Text(
                  "",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30.0,
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.thumb_up,
                    color: Colors.white,
                  ),
                  label: const Text('決定'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[200],
                    onPrimary: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                ),
              ],
            )),
      ),
    );
  }
}
