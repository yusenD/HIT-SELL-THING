import 'package:flutter/material.dart';

class feedbackPage extends StatefulWidget {
    feedbackPageState createState() => new feedbackPageState();
}

class feedbackPageState extends State<feedbackPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("意见反馈")
      ),
      body: new Center(
        child: Text("你有什么意见吗?") 
      )
    );
  } 
}