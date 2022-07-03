import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/study_movie.MOV');
    _controller.initialize().then((_) {
      // 最初のフレームを描画するため初期化後に更新
      setState(() {});
    });
    _controller2 = VideoPlayerController.asset('assets/study_movie.MOV');
    _controller2.initialize().then((_) {
      // 最初のフレームを描画するため初期化後に更新
      setState(() {});
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
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
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.videocam,
                    size: 60.0,
                    color: Colors.red[800],
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.mic_off,
                    size: 40.0,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              // Container(
              //   // 動画を表示
              //   child: VideoPlayer(_controller),
              //   height: 150,
              //   width: 300,
              //   margin: EdgeInsets.all(5),
              // ),
              // Container(
              //   // 動画を表示
              //   child: VideoPlayer(_controller2),
              //   height: 150,
              //   width: 300,
              //   margin: EdgeInsets.all(5),
              // ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image(
                    image: AssetImage('images/task_app3.jpg'),
                    height: 180.0,
                    width: 1000.0,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image(
                    image: AssetImage('images/task_app2.jpg'),
                    height: 180.0,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Center(
                  child: Text(
                    '01:50:29',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
