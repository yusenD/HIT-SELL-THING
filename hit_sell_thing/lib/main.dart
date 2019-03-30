import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hit_sell_thing/page/index.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '工大二手街',
      home: new IndexPage(),
    );
  }

}
