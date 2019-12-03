import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class Test6App extends StatefulWidget {
  //todo 底部按钮点击时间回掉掉方法
  onclick() {}

  @override
  State<StatefulWidget> createState() {
    return new Test7_1_App();
  }
}

class Test7_1_App extends State<Test6App> {
  bool isCheck = false;
  bool isSwich = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      //todo 导航栏
      appBar: new AppBar(
        actions: <Widget>[
          Tab(
            icon: Icon(Icons.menu),
          )
        ],
        title: new Text("基本测试控件2"),
      ),

      //todo 垂直布局
      body: null,
    );
  }

}
