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
  int i = 1;
  double width;
  double itemWidth = 120;
  @override
  void initState() {
    super.initState();
    //获取屏幕宽度
    width = window.physicalSize.width;
    int count = 9;
    int number = width ~/ itemWidth; //模数
    double other = itemWidth - width % itemWidth; //余数
    int enableNum = count - number;
    print("width="+width.toString());
    print("enableNum="+enableNum.toString());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      double scrollWidth= itemWidth*i;
      if(i==enableNum){
        scrollWidth = itemWidth*(i-1)+other;
      }
      _scrollController.animateTo(scrollWidth,
          duration: new Duration(milliseconds: 200), curve: Curves.ease);
      i++;
      if(i==enableNum){
        i=0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
        children: <Widget>[Text("测试可水平自动滑动listView"), _getListView()]));
  }
//  SizedBox(
//  width: 120,
//  height: 120,
//  child: ClipRRect(
//  borderRadius: BorderRadius.circular(5),
//  child: FadeInImage.assetNetwork(
//  placeholder: "assets/images/icon_default.png",
//  image:
//  "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg",
//  fit: BoxFit.cover,
//  ),
//  )),
  Widget _getListView() {
    return SizedBox(
        height: 120,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
          ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
