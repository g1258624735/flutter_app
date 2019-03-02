// Step 4: Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// 以App 结尾的都是单独作为界面的 ； 以 widget 结尾的都只是单独的界面布局
class Test2App extends StatelessWidget {
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
                child: new Text('Go back!')),
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
          child: new Test2Widget2(),
        ),
      ),
    );
  }
}

class Test2Widget extends StatelessWidget {
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

class Test2Widget2 extends StatefulWidget {
  @override
  _CountState createState() => new _CountState();
}

/// 可以记录状态的 View  widget 是一种临时变量 view
class _CountState extends State<Test2Widget2> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  Widget build(BuildContext context) {
    return new Material(
        child: new CustomScrollView(shrinkWrap: false, slivers: <Widget>[
      new SliverList(
          delegate: new SliverChildListDelegate(<Widget>[
        new Column(
          children: <Widget>[
            new Test2Widget(),
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
            new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    "http://01imgmini.eastday.com/mobile/20190227/2019022716_4160ed1c7126425e83f030c31f90f59a_4414_wmk.jpg"),
            new Text("水平listView"),
            new Container(
              margin: new EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: new ListView(
                //水平listView
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  new Container(
                    width: 60.0,
                    color: Colors.red,
                  ),
                  new Container(
                    width: 60.0,
                    color: Colors.blue,
                  ),
                  new Container(
                    width: 60.0,
                    color: Colors.green,
                  ),
                  new Container(
                    width: 60.0,
                    height: 20.0,
                    color: Colors.yellow,
                  ),
                  new Container(
                    width: 60.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            new Text("GridView"),
            new Container(
                margin: new EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child: new GridView.count(
                  crossAxisCount: 2,
                  children: new List.generate(10, (index) {
                    return new Center(
                      child: new Text("Item $index"),
                    );
                  }),
                )),

          ],
        ),
      ]))
    ]));
  }
}
