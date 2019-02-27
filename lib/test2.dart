// Step 4: Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/// list 列表 菜单列表
// ignore: must_be_immutable
class Test2MyApp extends StatelessWidget {
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
  final _suggestions = <WordPair>[];
  final List<String> list = ["简单的UI控件测试demo", "简单的UI控件测试demo2"];
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
        final  index = i ~/2;
        return _buildRow(list[index]);
      },
      itemCount: list.length*2,
    );
  }
void _toNextPahe
  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
      onTap: setState(() {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new SecondScreen()),
        )
      }) ; ,
    );
  }
}
