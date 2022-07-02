import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VideoScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
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
                height: 100.0,
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
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image(
                    image: AssetImage('images/study.jpeg'),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
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
