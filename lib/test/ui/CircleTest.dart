import 'package:circle_progress/circle_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test/widget/circle_progress_widget.dart';

/// 本组件的测试类  -------------使用--TestStateful()--------------
class CircleStateful extends StatefulWidget {
  @override
  _TestStatefulState createState() => _TestStatefulState();
}

class _TestStatefulState extends State<CircleStateful>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  double value;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        ////创建 Animation对象
        duration: Duration(milliseconds: 8000), //时长
        vsync: this);
    var tween = Tween(begin: 0.0, end: 1.0);
    animation = tween.animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MyCircleProgressWidget(
        progress: MyProgress(
            backgroundColor: Color(0xfff3f2f5),
            value: animation.value,
            radius: 90,
            completeText: "100%",
            color: Color(0xffF13333),
            strokeWidth: 8));
  }
}
