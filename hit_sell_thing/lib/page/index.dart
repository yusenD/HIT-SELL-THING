
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hit_sell_thing/page/home.dart';
import 'package:hit_sell_thing/page/my.dart';


class IndexPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new IndexPageState();
      }
}

 class IndexPageState extends State<IndexPage>{

  final List<BottomNavigationBarItem> bottomTabs = [
    new BottomNavigationBarItem(
      icon: new Icon(CupertinoIcons.home),
      title: new Text("首页"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(CupertinoIcons.profile_circled),
      title: new Text("我的"),
    )
  ];

  final List tabBodies = [
    new HomePage(),
    new MyPage()
  ];

  var curIndex = 0;
  var curPage;

  @override
  void initState() {
    super.initState();
    curPage = tabBodies[curIndex];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: curIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            curIndex = index;
            curPage = tabBodies[curIndex];
          });
        },
      ),
      body: curPage,
    );
  }
 }