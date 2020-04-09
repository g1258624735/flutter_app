import 'package:flutter/material.dart';
import 'package:flutter_app/test/bean/notie_manager_test.dart';
import 'package:provider/provider.dart';

class MyAppTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MyHomePage(title: 'Flutter Demo Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //全局增加
  void _incrementCounter() {
    Provider.of<NoticeManagerTest>(context).add();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '${Provider.of<NoticeManagerTest>(context).count}',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(onPressed: _incrementCounter, child: Text("全局刷新增加")),
            //局部刷新控件
            Consumer(
                builder: (context, NoticeManagerTest test, _) => Text(
                    "局部刷新${Provider.of<NoticeManagerTest>(context).count}")),
            RaisedButton(onPressed: _incrementCounter, child: Text("局部刷新增加")),
          ],
        ),
      ),
    );
  }
}
