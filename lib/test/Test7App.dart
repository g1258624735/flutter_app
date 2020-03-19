import 'package:flutter/material.dart';

import 'Test7App_1.dart';
import 'Test7App_2.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class Test7App extends StatefulWidget {
  //todo 底部按钮点击时间回掉掉方法
  onclick() {}

  @override
  State<StatefulWidget> createState() {
    return new Test7_1_App();
  }
}

class Test7_1_App extends State<Test7App> {
  List list = ["控件测试1", "控件测试2"];
  bool isCheck = false;
  bool isSwich = false;
  TabController _TabControl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _TabControl =
        new TabController(length: list.length, vsync: ScrollableState());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      //todo 导航栏
      key: scaffoldKey,
      appBar: new AppBar(
          title: new Text("基本测试控件3"),
          bottom: TabBar(
            tabs: list.map((t) {
              return new Text(t);
            }).toList(),
            controller: _TabControl,
            indicatorColor: Colors.white,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.0,
          )),
      //todo 垂直布局
      body: TabBarView(controller: _TabControl, children: <Widget>[
        Test7App_1(),
        Test7App_2(),
      ]),
    );
  }
}
