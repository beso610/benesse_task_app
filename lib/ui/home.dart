import 'package:flutter/material.dart';
import 'data.dart';
import 'calendar.dart';
import 'input_task.dart';
import 'stopwatch.dart';
import 'video.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> taskName = ["国語", "数学", "化学", "生物"];
  List<double> taskProcess = [0.8, 0.3, 0.5, 0.4];

  @override
  void initState(){
    super.initState();
    for (var i = 0; i < todaystask.length; i++) {
      taskName.add(todaystask[i].subject);
      double _process = (todaystask[i].progress_page)/(todaystask[i].max_page);
      taskProcess.add(_process);
    }
  }

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

    var sceneIndex = <Widget>[
      Home(),
      CalendarScreen(),
      VideoScreen(),
      InputTask(),
    ];






    _toStopWatch(){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => ClockTimer()));
    };

    //起動時に別ファイルからタスクを取得


    return Scaffold(
      appBar: AppBar(
        title: Text('魅力的なアプリ名', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                        child:ListView.builder(
                          itemCount: taskName.length,
                            itemBuilder: (BuildContext context, int i){
                          return Container(
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
                                        child: Text(taskName[i],
                                            style: taskStyle),
                                      ),
                                      InkWell(onTap: ()=> _toStopWatch(),
                                        child: Icon(Icons.play_arrow, size: iconSize,),
                                      ),
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
                                      value: taskProcess[i],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
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
          backgroundColor: Colors.green[50],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Call',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Input Task',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: (int i){
            if(i >0) {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => sceneIndex[i]));
            };
          },
        ),
      //child: Text("Hello"),
    );
  }
}
