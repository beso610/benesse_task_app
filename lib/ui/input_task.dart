import 'package:flutter/material.dart';

class InputTask extends StatelessWidget {
  const InputTask({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'タスク入力画面'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChecked = true;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.teal[200],
      ),
      backgroundColor: Colors.teal[100],
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, right: 0, bottom: 20, left: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('教科名: 　'),
                  width: 70.0,
                  alignment: Alignment.centerRight,
                ),
                TextFieldConstructed(100.0),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, right: 0, bottom: 20, left: 0),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                Container(
                  child: Text('教材名: 　'),
                  width: 70.0,
                  alignment: Alignment.centerRight,
                ),
                TextFieldConstructed(200.0),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, right: 0, bottom: 20, left: 0),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('目標期間: 　'),
                  width: 70.0,
                  alignment: Alignment.centerRight,
                ),
                TextFieldConstructed(80.0),
                Icon(
                  Icons.calendar_month ,     // Icons.○○にアイコン毎のワードを入れる
                  color: Colors.teal[300], // アイコンの色を設定できる
                  size: 24.0,         // アイコンのサイズを設定できる
                ),
                Container(
                  child: Text('〜'),
                  width: 30.0,
                  alignment: Alignment.center,
                ),
                TextFieldConstructed(80.0),
                Icon(
                  Icons.calendar_month ,     // Icons.○○にアイコン毎のワードを入れる
                  color: Colors.teal[300], // アイコンの色を設定できる
                  size: 24.0,         // アイコンのサイズを設定できる
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, right: 0, bottom: 20, left: 0),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('目標分量: 　'),
                  width: 70.0,
                  alignment: Alignment.centerRight,
                ),
                TextFieldConstructed(30.0),
                Container(
                  child: Text('〜'),
                  width: 70.0,
                  alignment: Alignment.center,
                ),
                TextFieldConstructed(30.0),
                Expanded(
                  flex: 3,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                          child: CheckboxListTile(
                          activeColor: Colors.teal[200],
                          title: Text('ページ'),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        ),

                        SizedBox(
                          height: 30,
                          child:CheckboxListTile(
                          activeColor: Colors.teal[200],
                          title: Text('問'),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: !isChecked,
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                              isChecked = false;
                              }else {
                              isChecked = true;
                              }
                            });
                          },
                        ),
                        ),
                      ],
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {print('決定');},
        label: const Text('決定'),
        icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.teal[200],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


Widget TextFieldConstructed(
    width_value,
    )
{
  return SizedBox(
    width: width_value,
    height: 20,
    child: TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: (Colors.teal[300])!,
          ),
        ),
      ),
    ),
  );
}