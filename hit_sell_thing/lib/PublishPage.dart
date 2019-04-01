import 'package:flutter/material.dart';

class PublishPage extends StatefulWidget { 
  PublishPageState createState() => new PublishPageState();
}

class PublishPageState extends State<PublishPage> {
  var value;
  // final TextEditingController _controller = new TextEditingController();
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('发布新商品')
      ),
      body: new Container(
        child: new Column(
          children: <Widget> [ 
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Align(
                  alignment: FractionalOffset.topLeft,
                  child: new Text('新品发布', style: new TextStyle(fontSize: 16)),
                ),
                new Align( 
                  alignment: FractionalOffset.topRight,
                  child: new DropdownButton(
                    items: _getItems(),
                    hint: Text("请选择商品种类"), 
                    value: value,
                    elevation: 24,
                    onChanged: (itemValue) {
                      setState(() {
                        value = itemValue;
                      });
                    },
                  )
                )
              ],
            ),
            /*
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("商品名称", style: new TextStyle(fontSize: 16)),
                new TextField(
                  controller: _controller,
                  decoration: new InputDecoration(
                    hintText: 'Type something',
                  ),
                )
              ],
            ),
            */
            new RaisedButton(
              child: new Text("确认发布"),
              onPressed:() {
                Navigator.pop(context);
              }
            )
          ]
        )
      )
    );
  }
}

List<DropdownMenuItem> _getItems() {
  List<DropdownMenuItem> itemType = new List();
  // value表示DropdownButton.onChanged的返回值
  itemType.add(DropdownMenuItem(child: Text("书籍"), value: "1"));
  itemType.add(DropdownMenuItem(child: Text("美妆"), value: "2"));
  itemType.add(DropdownMenuItem(child: Text("日用"), value: "3"));
  itemType.add(DropdownMenuItem(child: Text("电子"), value: "4"));
  itemType.add(DropdownMenuItem(child: Text("服装"), value: "5"));
  return itemType;
}