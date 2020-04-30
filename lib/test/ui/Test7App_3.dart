import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CircleTest.dart';

//测试控件 7_3
class Test7App_3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Test7App_3_1();
  }
}

class _Test7App_3_1 extends State with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Text("测试圆形进度条"),
      CircleStateful(),
    ]);
  }
}
