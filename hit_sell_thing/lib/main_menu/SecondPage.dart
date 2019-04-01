import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
    SecondPageState createState() => new SecondPageState();
}
  

class SecondPageState extends State<SecondPage> {
  List<Icon> person_icon = <Icon> [new Icon(Icons.person), new Icon(Icons.note), new Icon(Icons.place), new Icon(Icons.power),
  new Icon(Icons.report), new Icon(Icons.share), new Icon(Icons.star), new Icon(Icons.vpn_key)];

  List<String> person_string = <String> ["个人信息", "我的卖品", "购物篮", "等级评价", "个人成就", "关于我们", "意见反馈", "赞助商"];

  Widget buildPersonListData(BuildContext context, Icon person_icon, String person_string) {
    return new ListTile(
      isThreeLine: false,
      leading: person_icon,
      title: new Text(person_string)
    );
  }

  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('个人空间')
        ),
        body: new ListView.builder(
          itemCount: person_icon.length,
          itemBuilder: (BuildContext context, int index) {
            return buildPersonListData(context, person_icon[index], person_string[index]);
          }
        )
      );
    }
}