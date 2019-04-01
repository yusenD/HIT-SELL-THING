import 'package:flutter/material.dart';

class PublishPage extends StatefulWidget { 
  PublishPageState createState() => new PublishPageState();
}

class PublishPageState extends State<PublishPage> {
  String _name; // 商品名称
  String _price; // 商品价格

  String _validateName(String value) {
    if(value.isEmpty) return "请输入商品名称。";
  }

  // final TextEditingController _controller = new TextEditingController();
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('发布新商品')
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: new Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: new Icon(Icons.add_shopping_cart),
                hintText: "请输入商品名称……",
                labelText: "商品名称",
              ),
              onSaved: (String value) {
                this._name = value;
              },
              validator: _validateName
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.attach_money),
                hintText: "请输入你的商品定价……",
                labelText: "商品价格",
                prefixText: "RMB-"
              ),
              onSaved: (String value) {
                this._price = value;
              }
            )
          ]
        ),
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