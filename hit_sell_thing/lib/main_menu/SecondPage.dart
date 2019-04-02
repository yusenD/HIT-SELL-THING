import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
    SecondPageState createState() => new SecondPageState();
}
  

class SecondPageState extends State<SecondPage> {
  List<Icon> person_icon = <Icon> [new Icon(Icons.person), new Icon(Icons.note), new Icon(Icons.power),
  new Icon(Icons.report), new Icon(Icons.star)];

  List<String> person_string = <String> ["个人信息", "我发布的", "我收藏的", "意见反馈", "关于我们"];

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