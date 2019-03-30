import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'home',
      home: Center(
        child: new Text('home page'),
      )
    );
  }

}