import 'package:flutter/material.dart';

import 'FlareAnimation.dart';
import 'Test7App_1.dart';
import 'Test7App_2.dart';
import 'Test7App_3.dart';
import 'Test7App_4.dart';
import 'Test7App_5.dart';

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
  List list = ["控件测试1", "控件测试2","控件测试3","动画测试","水平滑动ListView","测试Sliver"];
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
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
          title: new Text("基本测试控件3"),
          bottom: TabBar(
            tabs: list.map((t) {
              return Container(child: Text(t,style: TextStyle(color: Colors.white))) ;
            }).toList(),
            controller: _TabControl,
            indicatorColor: Colors.white,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.0,
          )),
      body: TabBarView(controller: _TabControl, children: <Widget>[
        Test7App_1(),
        Test7App_2(),
        Test7App_3(),
        FlareAnimation(),
        Test7App_4(),
        Test7App_5(),
      ]),
    );
  }
}
