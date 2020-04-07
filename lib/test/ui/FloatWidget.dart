import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 悬浮弹窗
/// 通过帧布局 遮盖 实现平移动画
class FloatWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatState();
  }
}

class _FloatState extends State with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController controller;
  Animation<Offset> animation;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    //初始化
    //用来控制动画的开始与结束以及设置动画的监听
    //vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    //duration 动画的时长，这里设置的 seconds: 2 为2秒，当然也可以设置毫秒 milliseconds：2000.
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //AnimationStatus.completed 动画在结束时停止的状态
        controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        //AnimationStatus.dismissed 表示动画在开始时就停止的状态
//        controller.forward();
      }
    });
    //begin: Offset.zero, end: Offset(1, 0) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向不动，也就是水平向右平移
    //begin: Offset.zero, end: Offset(1, 1) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向 向下 平衡执行动画view 的1倍的高度，也就是向右下角平移了
    animation =
        Tween(begin: Offset(0, 0), end: Offset(0, 0.3)).animate(controller);
    //开始执行动画
    controller.forward();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      controller.forward();
    });
  }

  @override
  void dispose() {
    if (controller != null) {
      controller.dispose();
    }
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
//            color: const Color(0xb3666666),
            color: Colors.green,

            ///0x 后面开始 两位FF表示透明度16进制，  渐变动画
            child: Row(children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                  //内边距
                  child: Image.asset("assets/image/gifindicator.gif")),
              Expanded(child: Text("")),
              Stack(
                children: <Widget>[
                  SlideTransition(
                      position: animation,
                      //将要执行动画的子view
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding:
                                  const EdgeInsets.only(right: 20.0, left: 6.0),
                              //内边距
                              child: new Text("￥100.00",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          Container(
                              padding:
                                  const EdgeInsets.only(right: 20.0, left: 6.0),
                              //内边距
                              child: new Text("￥100.00",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)))
                        ],
                      )),
                  Positioned(
                      child: Container(
                          height: 30, color: Colors.green, width: 100),
                      top: 0,
                      right: 0),
                  Positioned(
                      child: Container(
                          height: 30, color: Colors.green, width: 100),
                      bottom: 0,
                      right: 0),
                ],
              )
            ])),
        left: 0,
        right: 0,
        bottom: 0,
        height: 80);
  }
}
