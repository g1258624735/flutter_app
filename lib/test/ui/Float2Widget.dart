import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 悬浮弹窗
/// 通过控制父类宽高实现平移动画
class Float2Widget extends StatefulWidget {
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
  List<String> money = ["101", "102", "103", "104"];
  List<String> time = ["1分钟", "2分钟", "3分钟", "4分钟"];
  ScrollController scrollController = ScrollController();
  int _scrollIndex = 0; //当前收益轮播到的 条目
  int _animationPosition = 0; //当前动画轮播到的条数
  String _preIncome = "0.00"; //正在显示收益
  String _nextIncome = "0.00"; //将要显示的下一个收益
  String _preTime = ""; //当前显示的收益时间
  bool _isShow = true; //是否显示  todo  这里 true 代表 隐藏  ； false 代表 显示。
  @override
  void initState() {
    super.initState();
    //用来控制动画的开始与结束以及设置动画的监听
    //vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    //duration 动画的时长，这里设置的 seconds: 2 为2秒，当然也可以设置毫秒 milliseconds：2000.
    controller = AnimationController(
        duration: const Duration(milliseconds: 300));
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //AnimationStatus.completed 动画在结束时停止的状态
        controller.reset();
        _animationPosition++;
        //移动到最后一个重置position
//        if(_animationPosition==money.length){
//          _animationPosition=0;
//        }
//        Future.delayed(Duration(milliseconds: 800)).then((_) {
////
//        });
      } else if (status == AnimationStatus.dismissed) {
        //AnimationStatus.dismissed 表示动画在开始时就停止的状态
//        controller.forward();
      }
    });
    //begin: Offset.zero, end: Offset(1, 0) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向不动，也就是水平向右平移
    //begin: Offset.zero, end: Offset(1, 1) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向 向下 平衡执行动画view 的1倍的高度，也就是向右下角平移了
    animation =
        Tween(begin: Offset(0, 0), end: Offset(0, -0.3)).animate(controller);

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _handleIncome();
      if (!_isShow) {
        if (_animationPosition < money.length) {
          setState(() {
            _isShow = false;
          });
          //开始执行动画
          controller.forward();
        } else {
          _animationPosition = 0;
          _scrollIndex = 0;
          setState(() {
            _isShow = true;
          });
        }
      }
    });
  }

  ///处理显示的收益
  void _handleIncome() {
    //滑动最后一个重置index
    if (_scrollIndex >= money.length) {
      _scrollIndex = 0;
      return;
    }
    if (money.length == 1) {
      //赋值显示的收益
      _preIncome = money[0];
      _nextIncome = money[0];
      _preTime = time[0];
      _scrollIndex++;
      _isShow = false;
    } else if (money.length > 1 && _scrollIndex < money.length - 1) {
      //赋值显示的收益
      _preIncome = money[_scrollIndex];
      _nextIncome = money[_scrollIndex + 1];
      _preTime = time[_scrollIndex];
      _scrollIndex++;
      _isShow = false;
    } else if (money.length > 1 && _scrollIndex == money.length - 1) {
      //赋值显示的收益
      _preIncome = money[_scrollIndex];
      _nextIncome = money[0];
      _preTime = time[_scrollIndex];
      _scrollIndex++;
      _isShow = false;
    } else {
      _preIncome = "0.00";
      _nextIncome = "0.00";
      _scrollIndex = 0;
    }
  }

  @override
  void didUpdateWidget(Float2Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Offstage(
            offstage: _isShow,
            child: Stack(
                //类似安卓得帧布局，可以重叠
                children: <Widget>[
                  Container(
                      height: 38,
                      margin: EdgeInsets.only(top: 20),
                      color: const Color(0xffFFE8E8),

                      ///0x 后面开始 两位FF表示透明度16进制，  渐变动画
                      child: Row(children: <Widget>[
                        Container(
                            height: 16,
                            child: SingleChildScrollView(
                                controller: scrollController,
                                //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
                                scrollDirection: Axis.vertical,
                                //true 滑动到底部
                                reverse: false,
                                //禁止滑动
                                physics: NeverScrollableScrollPhysics(),
                                ////滑动到底部回弹效果
                                child: SlideTransition(
                                    position: animation,
                                    //将要执行动画的子view
                                    //内边距
                                    child: Column(children: <Widget>[
                                      Container(
                                          padding: const EdgeInsets.only(
                                              right: 20.0, left: 80.0),
                                          //内边距
                                          child: new Text(
                                              "你又叕叕赚了$_preIncome元！真棒~",
                                              style: TextStyle(
                                                  color: Color(0xffF43333),
                                                  fontSize: 14))),
                                      Container(
                                          padding: const EdgeInsets.only(
                                              right: 20.0, left: 80.0),
                                          //内边距
                                          child: new Text(
                                              "你又叕叕赚了$_nextIncome元！真棒~",
                                              style: TextStyle(
                                                  color: Color(0xffF43333),
                                                  fontSize: 14)))
                                    ])))),
                        Expanded(
                          child: Text(""),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 14),
                          child: Text(_preTime,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff8D8D99))),
                        )
                      ])),
                  Container(
                      padding: const EdgeInsets.only(left: 16.0),
                      //内边距
                      child: Image.asset("assets/image/gifindicator.gif")),
                ])),
        left: 0,
        right: 0,
        bottom: 0,
        height: 56);
  }

  @override
  void dispose() {
    /// 必须放在 super.dispose() 之前, 否着会报错。
    if (controller != null) {
      controller.dispose();
    }
    if (_timer != null) {
      _timer.cancel();
    }
    if (scrollController != null) {
      scrollController.dispose();
    }
    super.dispose();
  }
}
