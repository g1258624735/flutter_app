
import 'package:flutter/material.dart';
import 'package:flutter_app/test/testui/magic_barrage.dart';

class Test_14_Barrage extends StatefulWidget {
  //todo 底部按钮点击时间回掉掉方法
  onclick() {}

  @override
  State<StatefulWidget> createState() {
    return new Test_14_BarrageState();
  }
}

class Test_14_BarrageState extends State<Test_14_Barrage> {

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
        title: new Text("测试弹幕组件"),
      ),
      //todo 垂直布局
      body: new Column(children: [
        Container(width: 300,child:MagicBarrage())
      ]),
    );
  }

  @override
  void dispose() {
    //界面销毁方法
    super.dispose();
  }

  @override
  void deactivate() {
    //界面销毁方法
    super.deactivate();
  }
}
