import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MyPageState();
  }

}

class MyPageState extends State<MyPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my page',
      home: Center(
        child: new Text('my page'),
      )
    );
  }
  
}