import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/test/widget/custom_refresh_controller.dart';
import 'package:flutter_app/test/widget/custom_refresh_page.dart';

import 'Test.dart';
import 'Test__1.dart';

///测试滑动嵌套控件
class MyTestApp_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: ScrollableState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("测试滑动嵌套")),
        body: Column(children: <Widget>[
          Container(
              color: Colors.white,
              child: TabBar(
                unselectedLabelColor: Colors.blue[100],
                indicator: BoxDecoration(color: Colors.lightBlue),
                controller: tabController,
                tabs: <Widget>[
                  Tab(
                    text: "tab一",
                  ),
                  Tab(
                    text: "tab二",
                  ),
                  Tab(
                    text: "tab三",
                  )
                ],
              )),
          Expanded(child:
          TabBarView(
              controller: tabController,
              children: [MyTest11App(), MyTest11App(), MyTest11App()],
              physics: NeverScrollableScrollPhysics()),
          )]));
  }
}
