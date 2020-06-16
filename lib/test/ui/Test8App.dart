import 'package:flutter/material.dart';

import 'FlareAnimation.dart';
import 'Test7App_1.dart';
import 'Test7App_2.dart';
import 'Test7App_3.dart';
import 'Test7App_4.dart';

///测试嵌套
class Test8App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Test8AppState();
  }
}

class Test8AppState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColor: Color(0xFFC91B3A),
//          splashColor: Color(0x00000000),
//          highlightColor: Color(0x00000000),
          backgroundColor: Color(0xFFC91B3A),
          accentColor: Color(0xFF888888),
        ),
        home: Scaffold(
            body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ListTile(
              title: Text("Test8AppState"),
            ),
            ListTile(
              title: Text("Test8AppState"),
            ),
            ListTile(
              title: Text("Test8AppState"),
            ),
            ListTile(
              title: Text("Test8AppState"),
            ),
            ListTile(
              title: Text("Test8AppState"),
            ),
            ListTile(
              title: Text("Test8AppState"),
            ),
            ListTile(
              title: Text("Test8AppState"),
            ),
//            Test8_1_App()
            Test8_1_App(),
          ],
        )));
  }
}

class Test8_1_App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Test8_1_AppState();
  }
}

class Test8_1_AppState extends State<Test8_1_App> {
  List list = ["控件1", "控件2", "控件3"];
  bool isCheck = false;
  bool isSwich = false;
  TabController _TabControl;

  @override
  void initState() {
    super.initState();
    _TabControl =
        new TabController(length: list.length, vsync: ScrollableState());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
          Container(
              height: 44,
              child: TabBar(
                tabs: list.map((t) {
                  return Container(
                      child: Text(t, style: TextStyle(color: Colors.black)));
                }).toList(),
                controller: _TabControl,
                indicatorColor: Colors.black,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.0,
              )),
          Container(
              child: TabBarView(controller: _TabControl, children: <Widget>[
                Test8App_2(),
                Test8App_2(),
                Test8App_2(),
              ]))
        ]));
  }
}

class Test8App_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        ListTile(
          title: Text("Test8App_2"),
        ),
        ListTile(
          title: Text("Test8App_2"),
        ),
        ListTile(
          title: Text("Test8App_2"),
        ),
        ListTile(
          title: Text("Test8App_2"),
        ),
        ListTile(
          title: Text("Test8App_2"),
        ),
        ListTile(
          title: Text("Test8App_2"),
        ),
        ListTile(
          title: Text("Test8App_2"),
        ),
        ListTile(
          title: Text("Test8App_2"),
        ),
        ListTile(
          title: Text("Test8App_2"),
        )
      ],
    );
  }
}
