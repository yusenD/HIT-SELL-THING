import 'package:flutter/material.dart';

class collectPage extends StatefulWidget {
    collectPageState createState() => new collectPageState();
}

class collectPageState extends State<collectPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("我收藏的")
      ),
      body: new Center(
        child: Text("这些我买了.") 
      )
    );
  } 
}