import 'package:flutter/material.dart';

class aboutUsPage extends StatefulWidget {
    aboutUsPageState createState() => new aboutUsPageState();
}

class aboutUsPageState extends State<aboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("关于我们")
      ),
      body: new Center(
        child: Text("哈尔滨工业大学(威海)\n @2010-2019") 
      )
    );
  } 
}