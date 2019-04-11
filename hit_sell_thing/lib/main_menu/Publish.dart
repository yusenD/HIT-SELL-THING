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
            ),
            SizedBox(height: 25.0),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "请简单介绍一下你的商品……",
                helperText: "* 请尽量不要超过200字",
                labelText: "商品介绍"
              ),
              maxLines: 4
            ),
            new Container(
              height: 80.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[ 
                  new Text(
                    "请上传商品图片（至少一张）:",
                    style: new TextStyle(
                      fontSize:15.0 
                    )
                  ),
                  new IconButton(
                    icon: Icon(Icons.add_a_photo),
                    iconSize: 24.0,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text("拍摄照片……")
                                // onTap:
                              ),
                              new ListTile(
                                leading: Icon(Icons.photo_library),
                                title: Text("从相册中选择……")
                                // onTap:
                              )
                            ],
                          );
                        },
                      );
                    }
                  ),
                ]
              )
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  child: Text("确认提交"), 
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                new RaisedButton(
                  child: Text("取消发布"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
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