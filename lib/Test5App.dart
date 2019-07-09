import 'package:flutter/material.dart';

class Test5App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(actions: <Widget>[
        new RaisedButton(onPressed: () {
//          Navigator.pop();
        })
      ], title: new Text("test5")),
      body: new Column(children:[ new Text("我是测试界面5"),
        new Text("我是一个文本显示控件")
      ]),
    );
  }
}
