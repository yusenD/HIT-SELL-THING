import 'package:flutter/material.dart';
import 'package:flutter_object/login.dart';
import 'package:flutter_object/user_page/aboutUsPage.dart';
import 'package:flutter_object/user_page/collectPage.dart';
import 'package:flutter_object/user_page/feedbackPage.dart';
import 'package:flutter_object/user_page/publishPage.dart';
import 'package:flutter_object/user_page/setPage.dart';

class SecondPage extends StatefulWidget {
    SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  List<Icon> person_icon = <Icon> [new Icon(Icons.person), new Icon(Icons.note), new Icon(Icons.power),
  new Icon(Icons.report), new Icon(Icons.star)];

  List<String> person_string = <String> ["个人信息", "我发布的", "我收藏的", "意见反馈", "关于我们"];

  List<MaterialPageRoute> person_route = <MaterialPageRoute> [
    MaterialPageRoute(builder: (context) => new setPage()),
    MaterialPageRoute(builder: (context) => new publishPage()),
    MaterialPageRoute(builder: (context) => new collectPage()),
    MaterialPageRoute(builder: (context) => new feedbackPage()),
    MaterialPageRoute(builder: (context) => new aboutUsPage()),
  ];

  Widget buildPersonListData(BuildContext context, Icon list_icon, String list_string, MaterialPageRoute list_route) {
    return new ListTile(
      isThreeLine: false,
      leading: list_icon,
      title: new Text(list_string),
      onTap: () {
        Navigator.pushReplacement(context, list_route);
      }
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("个人空间")
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 110.0,
            width: 600.0,
            color: Colors.blue,
            child: new Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.person_add),
                  iconSize: 60.0,
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new login()));
                  },
                ),
                new Text("点击头像登录")
              ]
            )
          ),
          Expanded(
            child: new ListView.builder(
              itemCount: person_icon.length,
              itemBuilder: (BuildContext context, int index) {
                return buildPersonListData(context, person_icon[index], person_string[index], person_route[index]);
              }
            )
          )
        ]
      )
    );
  }
}