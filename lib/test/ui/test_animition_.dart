import 'package:flutter/material.dart';

///测试动画 （开门动画 旋转动画 缩放动画  翻页动画）
class TestAnimationAppTest extends StatefulWidget {
  TestAnimationAppTest({Key key}) : super(key: key);

  @override
  _TestAnimationApp createState() => _TestAnimationApp();
}

class _TestAnimationApp extends State<TestAnimationAppTest>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  double valueScale = 0.0;
  double _rotateX = 0.0;
  double _rotateY = 0.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    controller.addListener(() {
      setState(() {
        valueScale = animation.value;
      });
    });
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
//        print("status is dismissed");
      } else if (status == AnimationStatus.forward) {
//        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
//        print("status is reverse");
      }
    });
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(from: 0.0);
      }
    });
    controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: Transform(
          transform: Matrix4.identity()
            ..rotateX(_rotateX)
            ..rotateY(_rotateY),
          alignment: Alignment.center,
          child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _rotateX += details.delta.dy * 0.01;
                  _rotateY += details.delta.dx * -0.01;
                });
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.green,
                child: Text('3D 变换Demo'),
              ),
            )),
    );
  }
}
