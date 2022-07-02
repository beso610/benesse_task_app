import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextStyle taskStyle = TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        );
    final TextStyle todayTaskStyle = TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        );
    final BoxDecoration taskTile =  BoxDecoration(
                                            color: Colors.tealAccent[100],
                                            borderRadius: BorderRadius.circular(12),
                                            );
    double iconSize = 50;


    return Scaffold(
      appBar: AppBar(
        title: Text('魅力的なアプリ名', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.teal[200],
      ),
      backgroundColor: Colors.white,
      body:
      Center(
        child: Container(
          child: Column(
            children: <Widget>[
              //今日のタスク&時間
              Container(
                margin: EdgeInsets.only(top:15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //テキスト1
                    Text('今日の開始時刻',
                    style: todayTaskStyle,),
                    //テキスト
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.teal[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(5),
                      child: Text("9:00",
                              style: todayTaskStyle,)
                    )

                  ],
          ),
              ),
              //タスク一覧
              Container(
                decoration: BoxDecoration(
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(14.4),
                ),
                width: size.width*0.9,
                height: size.height*0.65,
                child:Column(
                  children: <Widget>[
                    //今日の進捗
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 15),
                                alignment: Alignment.centerLeft,
                                child: Text("今日の進捗",style: taskStyle)),
                            Container(
                              width: size.width*0.7,
                              child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.grey,
                                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                                  minHeight: 30,
                                  value: 0.8,
                                ),
                              ),
                            ),

                          ],
                        )
                    ),
                    //区切り線
                    Divider(
                      thickness: 2,
                      color: Colors.teal,
                    ),
                    //Taskの表示(スクロール可能)
                    Container(

                      child: Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            //Task1
                            Container(
                              margin: EdgeInsets.all(10),
                              width: size.width*0.8,
                              height: size.height*0.15,
                              decoration: taskTile,
                              child:Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text('家庭科',
                                              style: taskStyle),
                                        ),
                                        Icon(Icons.play_arrow, size: iconSize),
                                      ],
                                    ),
                                  ),
                                  //進捗バー
                                  Container(
                                    width: size.width*0.7,
                                    child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(30)),
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.grey,
                                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                                        minHeight: 30,
                                        value: 0.9,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Task2
                            Container(
                              margin: EdgeInsets.all(10),
                              width: size.width*0.8,
                              height: size.height*0.15,
                              decoration: taskTile,
                              child:Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text('数学',
                                              style: taskStyle),
                                        ),
                                        Icon(Icons.play_arrow, size: iconSize),
                                      ],
                                    ),
                                  ),
                                  //進捗バー
                                  Container(
                                    width: size.width*0.7,
                                    child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(30)),
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.grey,
                                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                                        minHeight: 30,
                                        value: 0.1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Task3
                            Container(
                              margin: EdgeInsets.all(10),
                              width: size.width*0.8,
                              height: size.height*0.15,
                              decoration: taskTile,
                              child:Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text('化学',
                                              style: taskStyle),
                                        ),
                                        Icon(Icons.play_arrow, size: iconSize),
                                      ],
                                    ),
                                  ),
                                  //進捗バー
                                  Container(
                                    width: size.width*0.7,
                                    child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(30)),
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.grey,
                                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                                        minHeight: 30,
                                        value: 0.3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Task4
                            Container(
                              margin: EdgeInsets.all(10),
                              width: size.width*0.8,
                              height: size.height*0.15,
                              decoration: taskTile,
                              child:Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: Text('国語',
                                              style: taskStyle),
                                        ),
                                        Icon(Icons.play_arrow, size: iconSize),
                                      ],
                                    ),
                                  ),
                                  //進捗バー
                                  Container(
                                    width: size.width*0.7,
                                    child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(30)),
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.grey,
                                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                                        minHeight: 30,
                                        value: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
                )
              ),
              //全体のバー
            ],
          ),
        ),
      ),


        //ページ遷移ボタン
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
          ],
        ),
      
      //child: Text("Hello"),
    );
  }
}
