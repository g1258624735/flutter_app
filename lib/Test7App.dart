import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

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
      appBar: new AppBar(
          title: new Text("基本测试控件2"),
          bottom: TabBar(
            tabs: list.map((t) {
              return new Text(t);
            }).toList(),
            controller:_TabControl,
            indicatorColor: Colors.green,
            isScrollable: true,
              indicatorSize:TabBarIndicatorSize.tab,
            indicatorWeight: 8.0,

          )),
      //todo 垂直布局
      body: TabBarView(
          controller: _TabControl,
          children: list.map((t) {
            return Center(child: Text(t));
          }).toList()),
    );
  }
}
