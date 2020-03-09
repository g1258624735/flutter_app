import 'package:flutter/material.dart';
import 'package:flutter_app/test1.dart';
import 'package:flutter_app/test2.dart';
import 'package:flutter_app/test3.dart';
import 'package:flutter_app/test4HttpNet.dart';
import 'package:flutter_app/zhihu_demo/Zhihu_main.dart';

import 'Test5App.dart';
import 'Test6App.dart';
import 'Test7App.dart';

void main() {
  runApp(new Zhihu_main());
}

/// list 列表 菜单列表
// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RandomWords();
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<String> list = [
    "简单的UI控件测试demo",
    "简单的UI控件测试demo2",
    "购物车demo测试例子3",
    "测试网络请求4",
    "基本控件测试",
    "基本控件测试2",
    "基本控件测试3",
  ];
  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    key: scaffoldKey,
      body: _buildSuggestions( context),
    );
  }
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }
  Widget _buildSuggestions(BuildContext context) {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        return _buildRow(context,list[index], index);
      },
      itemCount: list.length * 2,

//      scrollDirection: Axis.horizontal,//水平布局
    );
  }

  Widget _buildRow(BuildContext context,String pair, int index) {
    return new Dismissible(
        key: new Key("$index"),
//        onDismissed: (direction) => list.removeAt(index),
        child: new ListTile(
          title: new Text(
            pair,
            style: _biggerFont,
          ),
          onTap: () {
            _toNextPage(context,index);
          },
        ));
  }

  ///跳转到下一页
  void _toNextPage(BuildContext context,int index) {
    // ignore: missing_return
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      switch (index) {
        case 0:
          return MyAppTest1();
        case 1:
          return Test2App();
        case 2:
          return Test3App();
        case 3:
          return Test4App();
        case 4:
          return Test5App();
        case 5:
          return Test6App();
        case 6:
          return Test7App();
      }
    }));
  }
}
