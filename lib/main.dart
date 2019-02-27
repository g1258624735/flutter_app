import 'package:flutter/material.dart';
import 'package:flutter_app/test2.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Scaffold(//Scaffold是Material中主要的布局组件.
        appBar: new AppBar(
          title: new Text("welcome to android"),
        ),
        body: new Center(
//          child: new Text("你好，欢迎来到安卓!"),
          child: new Main3App(),
        ),
      ),
    );
  }
}

class Main2App extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu), tooltip: "菜单", onPressed: null),
//          new Expanded(child: new ),
          new IconButton(
              icon: new Icon(Icons.search), tooltip: "搜索", onPressed: null)
        ],

      ),
    );
  }
}
class Main3App extends StatelessWidget{
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[new Main2App(),
        new Stack(children: <Widget>[
          new Text("text1"),
          new Text("text2")
        ],
        ),
        new Expanded(child: new Center(// Expanded 剩下的填充布局。
          child: new Text("你好我是测试！"),
        ))],
      ),
    );
  }
}
