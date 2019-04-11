import 'package:flutter/material.dart';

class publishPage extends StatefulWidget {
    publishPageState createState() => new publishPageState();
}

class publishPageState extends State<publishPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("我发布的")
      ),
      body: new Center(
        child: Text("我发布了一大堆好东西.") 
      )
    );
  } 
}