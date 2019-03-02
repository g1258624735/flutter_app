// Step 4: Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// 以App 结尾的都是单独作为界面的 ； 以 widget 结尾的都只是单独的界面布局
///  本类重点测试 网络请求功能。
class Test4App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Scaffold(
        //Scaffold是Material中主要的布局组件.
        appBar: new AppBar(
          actions: <Widget>[
            new RaisedButton(
                onPressed: () {
                  // Navigate back to first screen when tapped!
                  Navigator.pop(context);
                },
                child: new Text('返回'))
          ],
          title: new Text("welcome to android"),
        ),
        body: new Center(
//          child: new Text("你好，欢迎来到安卓!"),
          child: new Test4Widget2(),
        ),
      ),
    );
  }
}

class PostBean {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostBean(this.userId, this.id, this.title, this.body);

  factory PostBean.fromJson(Map<String, dynamic> json) {
    return new PostBean(
        json["userId"], json["is"], json["title"], json["body"]);
  }
}

class Test4Widget2 extends StatefulWidget {
  @override
  _CountState createState() => new _CountState();
}

/// 可以记录状态的 View  widget 是一种临时变量 view
class _CountState extends State<Test4Widget2> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  Widget build(BuildContext context) {
    return new Material(
        child: new CustomScrollView(
      shrinkWrap: false,
      slivers: <Widget>[
        new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
          new Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new Text("test1我是则帧布局"),
                  new Text("tex2我是则帧布局")
                ],
              ),
              new Text("数量：$_count"),
              new RaisedButton(
                onPressed: () {
                  _increment();
                  final snackBar = new SnackBar(content: new Text("点击事件"));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: new Text("点我增加"),
              ),
            ],
          ),
        ]))
      ],
    ));
  }
}
