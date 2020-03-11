import 'package:flutter/material.dart';
import 'package:flutter_app/zhihu_demo/ui/HomeListPage.dart';
import 'package:flutter_app/zhihu_demo/ui/MyInfoPage.dart';
import 'package:flutter_app/zhihu_demo/ui/SearchPage.dart';
import 'package:flutter_app/zhihu_demo/ui/TreePage.dart';

/// 知乎首页
class ZhiHuMainPage extends StatefulWidget {
  @override
  createState() => new _ZhiHuMainPageState();
}

class _ZhiHuMainPageState extends State<ZhiHuMainPage> {
  final List<String> list = [
    "首页",
    "列表",
    "我的",
    "搜索",
  ];
  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("知乎首页")),
      body: _buildSuggestions(context),
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
        return _buildRow(context, list[index], index);
      },
      itemCount: list.length * 2,
    );
  }

  Widget _buildRow(BuildContext context, String pair, int index) {
    return new Dismissible(
        key: new Key("$index"),
//        onDismissed: (direction) => list.removeAt(index),
        child: new ListTile(
          title: new Text(
            pair,
            style: _biggerFont,
          ),
          onTap: () {
            _toNextPage(context, index);
          },
        ));
  }

  ///跳转到下一页
  void _toNextPage(BuildContext context, int index) {
    // ignore: missing_return
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      switch (index) {
        case 0:
          return HomeListPage();
        case 1:
          return TreePage();
        case 2:
          return MyInfoPage();
        case 3:
          return SearchPage();
      }
    }));
  }
}
