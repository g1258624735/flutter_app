import 'package:flutter/material.dart';
import 'package:flutter_app/test1.dart';
import 'package:flutter_app/test2.dart';
import 'package:flutter_app/test3.dart';

void main() {
  runApp(new MainApp());
}

/// list 列表 菜单列表
// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<String> list = ["简单的UI控件测试demo", "简单的UI控件测试demo2", "购物车demo测试例子3"];
  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter测试'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        return _buildRow(list[index], index);
      },
      itemCount: list.length * 2,
//      scrollDirection: Axis.horizontal,//水平布局
    );
  }

  Widget _buildRow(String pair, int index) {
    return new Dismissible(
        key: new Key("$index"),
        onDismissed: (direction) => list.removeAt(index),
        child: new ListTile(
          title: new Text(
            pair,
            style: _biggerFont,
          ),
          onTap: () {
            _toNextPage(index);
          },
        ));
  }

  ///跳转到下一页
  void _toNextPage(int index) {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) {
        if (index == 0) {
          return new MyAppTest1();
        } else if (index == 1) {
          return new Test2App();
        } else if (index == 2) {
          return new Test3App();
        }
      }),
    );
  }
}
