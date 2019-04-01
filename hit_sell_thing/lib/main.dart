import 'package:flutter/material.dart';
import './main_meau/FirstPage.dart';
import './main_meau/SecondPage.dart';
import './main_meau/PublishPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // App的根Widget,即MyApp,整个框架的出发点
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '工大二手街',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController controller;
  int _counter = 0;

  // 应用程序的主页,可以配置它的相关状态

  void initState() {
    controller = new TabController(vsync: this, length: 2);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // 对setState的调用使得Flutter得知有什么状态的配置发生了更改.每次setState都会调用下面的build()方法
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new FirstPage(), // 页面一:商城
          new SecondPage() // 页面二:个人信息
        ],
      ),
      floatingActionButton: new Builder(builder: (BuildContext context) {
        return new FloatingActionButton(
          child: const Icon(Icons.add),
          shape: new CircleBorder(),
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
          onPressed:() {
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new PublishPage()));
          }
        );
      }),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          labelColor: Colors.black,
          controller: controller,
          tabs: <Tab>[
            new Tab(text: "商城", icon: new Icon(Icons.shop)),
            new Tab(text: "个人信息", icon: new Icon(Icons.people))
          ]
        ),
      )
    );
  }
}
