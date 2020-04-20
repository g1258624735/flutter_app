//import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//测试控件 7_2
class Test7App_2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Test7App_2_1();
  }
}

class _Test7App_2_1 extends State with SingleTickerProviderStateMixin {
  var animation = kAlwaysCompleteAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //AnimationStatus.completed 动画在结束时停止的状态
        controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        //AnimationStatus.dismissed 表示动画在开始时就停止的状态
//        controller.forward();
      }
    });
  }

  bool _checkBox_1 = true;
  bool _checkBox_2 = true;
  double _seek_position_1 = 0;
  RangeValues _discreteCustomValues = const RangeValues(40.0, 100.0);
  static final _sizeTween = new Tween<double>(begin: 80.0, end: 0.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text("第一个控件"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
                tristate: true,
                onChanged: (bool value) {
                  setState(() {
                    _checkBox_1 = value;
                  });
                },
                value: _checkBox_1),
            Checkbox(
                onChanged: (bool value) {
                  setState(() {
                    _checkBox_2 = value;
                  });
                },
                value: _checkBox_2),
          ],
        ),
        // 进度条
        Slider.adaptive(
            value: _seek_position_1,
            min: 0,
            max: 100,
            divisions: 20,
            label: '${_seek_position_1.round()}',
            onChanged: (double value) {
              setState(() {
                _seek_position_1 = value;
              });
            }),
        //进度条
        RangeSlider(
          values: _discreteCustomValues,
          divisions: 10,
          min: 0,
          max: 100,
          onChanged: (values) {
            setState(() {
              _discreteCustomValues = values;
            });
          },
          labels: RangeLabels('${_discreteCustomValues.start.round()}',
              '${_discreteCustomValues.end.round()}'),
        ),
        SizedBox(
          height: 80,
          width: 300,
          child: Card(
            child: Center(
                child: Text("测试动画方块一", style: TextStyle(color: Colors.white))),
            color: Colors.red,
          ),
        ),
        Align(
            alignment: Alignment.center,
            //宽度因子  代表 Align 宽度是 子类* 宽度因子
            widthFactor: 1,
            //高度因子  代表 Align 高度是 子类* 高度因子
            heightFactor: 1,
            child: OutlineButton(
              child: Text("演示动画"),
              onPressed: () {
                controller.forward();
              },
            )),
        Expanded(
            child: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(left: 30, right: 30),
          child: SizeTransition(
              axis: Axis.vertical,
              sizeFactor: _sizeTween.animate(controller),
              child: SizedBox(
                height: 80,
                child: Card(
                  child: Center(
                      child: Text("测试动画方块一",
                          style: TextStyle(color: Colors.white))),
                  color: Colors.red,
                ),
              )),
        )),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }
}
