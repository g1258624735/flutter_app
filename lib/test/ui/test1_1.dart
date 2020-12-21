import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test/bean/notie_manager_test.dart';
import 'package:flutter_app/test/widget/pay_new_order_lose_dialog.dart';
import 'package:flutter_app/test/widget/round_underline_tab_indicator.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:provider/provider.dart';

class MyAppTest1_1 extends StatefulWidget {
  MyAppTest1_1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyAppTest1_1State createState() => new _MyAppTest1_1State();
}

class _MyAppTest1_1State extends State<MyAppTest1_1>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    double screenHeight = mq.size.height;
    // 顶部状态栏, 随着刘海屏会增高
    double statusBarHeight = (window.padding.top / window.devicePixelRatio);
    double height = screenHeight -
        statusBarHeight -
        kToolbarHeight;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("测试"),
        ),
        body: ListView.builder(
          itemBuilder: (context, int index) {
            return Container(
              height: height,
              color: index == 0
                  ? Colors.red
                  : (index == 1 ? Colors.green : Colors.cyan),
              child: Center(child: Text(index.toString())),
            );
          },
          itemCount: 3,
        ));
  }
}
