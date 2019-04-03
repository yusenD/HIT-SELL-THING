import 'package:flutter/material.dart';

class login extends StatefulWidget {
    loginPage createState() => new loginPage();
}
  

class loginPage extends State<login> with SingleTickerProviderStateMixin {

  TabController _loginController;

  void initState() {
    super.initState();
    _loginController = new TabController(length: 2, vsync: this) ;
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("登录"),
        bottom: TabBar(
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _loginController,
          tabs: <Widget>[
            new Tab(text: "登录"),
            new Tab(text: "注册")
          ],
        )
      ),
      body: new TabBarView(
        controller: _loginController,
        children: <Widget>[
          new Center(
            child: new Container(
              height: 300.0,
              width: 300.0,
              child: new Column( 
                children: <Widget> [
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_pin),
                      filled: true,
                      hintText: "请输入学号:",
                      labelText: "学号",
                    )
                  ),
                  new Container(height: 20),
                  TextFormField(
                    obscureText: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.keyboard),
                      filled: true,
                      hintText: "请输入密码:",
                      labelText: "密码",
                    )
                  ),
                  new Container(height: 20),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("登录"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      RaisedButton(
                        child: Text("忘记密码?"),
                        onPressed: () {
                          Navigator.pop(context);
                        }
                      )
                    ],
                  )
                ]
              )
            )
          ),
          new Center(
            child: new Container(
              height: 700.0,
              width: 300.0,
              child: new Column( 
                children: <Widget> [
                  new Container(height: 40),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_pin),
                      filled: true,
                      hintText: "请输入学号:",
                      labelText: "学号",
                    )
                  ),
                  new Container(height: 20),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.nature),
                      filled: true,
                      hintText: "请输入真实姓名:",
                      labelText: "真实姓名",
                    )
                  ),
                  new Container(height: 20),
                  TextFormField(
                    obscureText: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.keyboard),
                      filled: true,
                      hintText: "请输入密码:",
                      labelText: "密码",
                    )
                  ),
                  new Container(height: 20),
                  TextFormField(
                    obscureText: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.keyboard),
                      filled: true,
                      hintText: "请再次输入密码:",
                      labelText: "确认密码",
                    )
                  ),
                  new Container(height: 20),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("注册账号"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                ]
              )
            )
          )
        ]
      )  
    );
  }
}