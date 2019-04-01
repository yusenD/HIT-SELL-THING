import 'package:flutter/material.dart';
// import '../component/list.dart';
// 商城页面的布局结构:见F:\主界面.jpg

class FirstPage extends StatefulWidget {
    FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this) ;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar( // 上方标题栏
        title: new Text('首页'),
        bottom: new TabBar(
          controller: _tabController,
            tabs: <Widget>[
              new Tab(text: '书籍'),
              new Tab(text: '美妆'),
              new Tab(text: '日用'),
              new Tab(text: '电子'),
              new Tab(text: '服装')
            ]  
        ),
      ),
      body: new Column( 
        children: <Widget> [
          Expanded(
            child: new ListView.builder( // list是一个单独控件,但是listView只需要直接构建listView.builder即可
              itemCount: 20, // listView的item个数
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                  padding: new EdgeInsets.all(10.0),
                  child: new ListTile(
                    subtitle: new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Row( // item第一行:显示物品名称及价格
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text(
                                '德芙巧克力',
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                )
                              )
                            ]
                          ),
                          new Row( // item第二行:显示物品上架时间
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  new Text('上架时间:'),
                                  new Text('2019-4-1 12:00'),
                                ]
                              ),
                            ]
                          ),
                          new Row( // item第三行:显示发布人
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                new Text('描述:')
                                ]
                              ),
                            ]
                          )
                        ],
                      ),
                    ), 
                    trailing: new Image(image: new AssetImage('images/test.jpg'), width: 100, height: 80)
                  )
                );
              }
            )
          )
        ]
      )
    );
  }
}

class _tabController {
}

