import 'package:flutter/material.dart';
// import '../component/list.dart';

class FirstPage extends StatefulWidget {
    FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = new TabController(length: 6, vsync: this) ;
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
          isScrollable: true,
          controller: _tabController,
            tabs: <Widget>[
              new Tab(text: '书籍'),
              new Tab(text: '美妆'),
              new Tab(text: '日用品'),
              new Tab(text: '电子'),
              new Tab(text: '服装'),
              new Tab(text: '杂物')
            ]  
        ),
      ),
      body: new TabBarView(
        controller: _tabController, 
        children: <Widget> [
          new ListView.builder( // list是一个单独控件,但是listView只需要直接构建listView.builder即可
            itemCount: 20, // listView的item个数
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                padding: new EdgeInsets.all(10.0),
                child: new ListTile(
                  contentPadding: new EdgeInsets.all(3.0),
                  subtitle: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row( // item第一行:显示物品名称及价格
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text(
                              '《编译原理》',
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
                  trailing: new Image(image: new AssetImage('images/test.jpg'), width: 100, height: 70), // 每一个item的配图(item右侧)
                )
              );
            }
          ),
          new ListView.builder( // list是一个单独控件,但是listView只需要直接构建listView.builder即可
            itemCount: 20, // listView的item个数
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                padding: new EdgeInsets.all(10.0),
                child: new ListTile(
                  contentPadding: new EdgeInsets.all(3.0),
                  subtitle: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row( // item第一行:显示物品名称及价格
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text(
                              '洁面乳',
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
                  trailing: new Image(image: new AssetImage('images/test.jpg'), width: 100, height: 70), // 每一个item的配图(item右侧)
                )
              );
            }
          ),
          new ListView.builder( // list是一个单独控件,但是listView只需要直接构建listView.builder即可
            itemCount: 20, // listView的item个数
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                padding: new EdgeInsets.all(10.0),
                child: new ListTile(
                  contentPadding: new EdgeInsets.all(3.0),
                  subtitle: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row( // item第一行:显示物品名称及价格
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text(
                              '黑人牙膏',
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
                  trailing: new Image(image: new AssetImage('images/test.jpg'), width: 100, height: 70), // 每一个item的配图(item右侧)
                )
              );
            }
          ),
          new ListView.builder( // list是一个单独控件,但是listView只需要直接构建listView.builder即可
            itemCount: 20, // listView的item个数
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                padding: new EdgeInsets.all(10.0),
                child: new ListTile(
                  contentPadding: new EdgeInsets.all(3.0),
                  subtitle: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row( // item第一行:显示物品名称及价格
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text(
                              'Ipad Pro 2',
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
                  trailing: new Image(image: new AssetImage('images/test.jpg'), width: 100, height: 70), // 每一个item的配图(item右侧)
                )
              );
            }
          ),
          new ListView.builder( // list是一个单独控件,但是listView只需要直接构建listView.builder即可
            itemCount: 20, // listView的item个数
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                padding: new EdgeInsets.all(10.0),
                child: new ListTile(
                  contentPadding: new EdgeInsets.all(3.0),
                  subtitle: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row( // item第一行:显示物品名称及价格
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text(
                              'Zara韩版风衣',
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
                  trailing: new Image(image: new AssetImage('images/test.jpg'), width: 100, height: 70), // 每一个item的配图(item右侧)
                )
              );
            }
          ),
          new ListView.builder( // list是一个单独控件,但是listView只需要直接构建listView.builder即可
            itemCount: 20, // listView的item个数
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                padding: new EdgeInsets.all(10.0),
                child: new ListTile(
                  contentPadding: new EdgeInsets.all(3.0),
                  subtitle: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row( // item第一行:显示物品名称及价格
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text(
                              '捷安特自行车',
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
                  trailing: new Image(image: new AssetImage('images/test.jpg'), width: 100, height: 70), // 每一个item的配图(item右侧)
                )
              );
            }
          )
        ]
      )
    );
  }
}