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
  NoticeManagerTest mNoticeManagerTest;

  //全局增加
  void _incrementCounter() {
    mNoticeManagerTest.add();
  }

  @override
  void initState() {
    super.initState();

//    _count = mNoticeManagerTest.count;
  }

  @override
  Widget build(BuildContext context) {
    mNoticeManagerTest = Provider.of<NoticeManagerTest>(context, listen: false);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '${mNoticeManagerTest.count}',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(onPressed: _incrementCounter, child: Text("全局刷新增加")),
            //局部刷新控件
            Consumer<NoticeManagerTest>(builder: (context, timerModel, _) {
              return Text(
                "局部刷新${timerModel.count}",
                overflow: TextOverflow.ellipsis,
              );
            }),
            RaisedButton(onPressed: _incrementCounter, child: Text("局部刷新增加"))
          ],
        ),
      ),
    );
  }
}
