import 'package:flutter/material.dart';

class setPage extends StatefulWidget {
    setPageState createState() => new setPageState();
}

class setPageState extends State<setPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("个人信息")
      ),
      body: new Center(
        child: Text("数据已删除") 
      )
    );
  } 
}