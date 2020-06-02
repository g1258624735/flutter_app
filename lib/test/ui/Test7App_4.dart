import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///水平花滑动listView
class Test7App_4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Test7App_4_1();
  }
}

class _Test7App_4_1 extends State with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  Timer _timer;
  int i = 0;
  double width = 0;
  double itemWidth = 180;
  int count = 5;
  bool enableScroll = false; //是否允许滑动
  @override
  void initState() {
    super.initState();
    //获取屏幕宽度 px 转 dp
    width = window.physicalSize.width / 2;
    enableScroll = count * itemWidth >= width;
    if(enableScroll) {
      int number = width ~/ itemWidth; //模数
      double other = itemWidth - width % itemWidth; //余数
      int enableNum = count - number;
      print("width=" + width.toString());
      print("enableNum=" + enableNum.toString());
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        double scrollWidth = itemWidth * i;
        if (i == enableNum) {
          scrollWidth = itemWidth * (i - 1) + other;
        }
        _scrollController.animateTo(scrollWidth,
            duration: new Duration(milliseconds: 200), curve: Curves.ease);
        i++;
        if (i == enableNum + 1) {
          i = 0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget>[Text("测试可水平自动滑动listView"), _getListView()]));
  }

//
  Widget _getListView() {
    return SizedBox(
        height: 120,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemBuilder: (context, index) {
            var colors = [Colors.green, Colors.blue, Colors.red, Colors.yellow];
            return Container(
                width: itemWidth,
                height: itemWidth,
                alignment: Alignment.center,
                color: colors[index % 3],
                child: Text("$index"));
          },
          itemCount: count,
        ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
