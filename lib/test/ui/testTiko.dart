import 'package:flutter/material.dart';
import 'package:flutter_app/test/bean/notie_manager_test.dart';
import 'package:flutter_app/test/widget/TikTokVideoGesture.dart';
import 'package:flutter_app/test/widget/TikTokVideoGesture1.dart';
import 'package:flutter_app/test/widget/hand_order_loading_widget.dart';
import 'package:flutter_app/test/widget/love_2widget.dart';
import 'package:flutter_app/test/widget/love_widget.dart';
import 'package:flutter_app/test/widget/pay_new_order_lose_dialog.dart';
import 'package:provider/provider.dart';

import 'ToastPostion.dart';
import 'easy_appbar.dart';

///测试动画
class MyAppTestTikTok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MyHomePage(title: 'Flutter Demo Home Page');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  NoticeManagerTest mNoticeManagerTest;
  AnimationController controllerNormal;
  AnimationController controller;
  Animation movementNormal;
  Animation movement;
  List animationArr = [
    Curves.fastLinearToSlowEaseIn,
    Curves.ease,
    Curves.easeIn,
    Curves.easeInToLinear,
    Curves.easeInSine,
    Curves.easeInQuad,
    Curves.easeInCubic,
    Curves.easeInQuart,
    Curves.easeInQuint,
    Curves.easeInExpo,
    Curves.easeInCirc,
    Curves.easeInBack,
    Curves.easeOut,
    Curves.linearToEaseOut,
    Curves.easeOutSine,
    Curves.easeOutQuad,
    Curves.easeOutCubic,
    Curves.easeOutQuart,
    Curves.easeOutQuint,
    Curves.easeOutExpo,
    Curves.easeOutCirc,
    Curves.easeOutBack,
    Curves.easeInOut,
    Curves.easeInOutSine,
    Curves.easeInOutQuad,
    Curves.easeInOutCubic,
    Curves.easeInOutQuart,
    Curves.easeInOutQuint,
    Curves.easeInOutCirc,
    Curves.easeInOutBack,
    Curves.easeInOutExpo,
    Curves.fastOutSlowIn,
    Curves.slowMiddle,
    Curves.bounceIn,
    Curves.elasticInOut,
    Curves.bounceOut,
    Curves.bounceInOut,
    Curves.elasticIn,
    Curves.elasticOut,
  ];
  List<String> animationString = [
    "Curves.fastLinearToSlowEaseIn",
    "Curves.ease",
    "Curves.easeIn",
    "Curves.easeInToLinear",
    "Curves.easeInSine",
    "Curves.easeInQuad",
    "Curves.easeInCubic",
    "Curves.easeInQuart",
    "Curves.easeInQuint",
    "Curves.easeInExpo",
    "Curves.easeInCirc",
    "Curves.easeInBack",
    "Curves.easeOut",
    "Curves.linearToEaseOut",
    "Curves.easeOutSine",
    "Curves.easeOutQuad",
    "Curves.easeOutCubic",
    "Curves.easeOutQuart",
    "Curves.easeOutQuint",
    "Curves.easeOutExpo",
    "Curves.easeOutCirc",
    "Curves.easeOutBack",
    "Curves.easeInOut",
    "Curves.easeInOutSine",
    "Curves.easeInOutQuad",
    "Curves.easeInOutCubic",
    "Curves.easeInOutQuart",
    "Curves.easeInOutQuint",
    "Curves.easeInOutCirc",
    "Curves.easeInOutBack",
    "Curves.easeInOutExpo",
    "Curves.fastOutSlowIn",
    "Curves.slowMiddle",
    "Curves.bounceIn",
    "Curves.elasticInOut",
    "Curves.bounceOut",
    "Curves.bounceInOut",
    "Curves.elasticIn",
    "Curves.elasticOut",
  ];
  String _value = "Curves.fastLinearToSlowEaseIn";
  Curve _valueInt = Curves.fastLinearToSlowEaseIn;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        ////创建 Animation对象
        duration: Duration(milliseconds: 2000));
    controller.repeat(reverse: false);
    movement = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1.0,
          curve: _valueInt,
        ),
      ),
    );
    controller.addListener(() {
      print(movement.value);
      if (mounted) {
        setState(() {});
      }
    });
    controllerNormal = AnimationController(
        ////创建 Animation对象
        duration: Duration(milliseconds: 2000));
    controllerNormal.repeat(reverse: false);
    movementNormal = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(controllerNormal);
    controllerNormal.addListener(() {
      print(movementNormal.value);
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mNoticeManagerTest = Provider.of<NoticeManagerTest>(context, listen: false);
    print("刷新了");
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                child: DropdownButton<String>(
                  hint: new Text("动画类型："),
                  value: _value,
                  onChanged: (String newValue) {
                    setState(() {
                      this._value = newValue;
                      if (animationString.length > 1) {
                        for (int i = 0; i < animationArr.length; i++) {
                          if (animationString[i] == newValue) {
                            _valueInt = animationArr[i];
                            controller.reset();
                            controllerNormal.reset();
                            movement = Tween(
                              begin: 0.0,
                              end: 100.0,
                            ).animate(
                              CurvedAnimation(
                                parent: controller,
                                curve: Interval(
                                  0.0,
                                  1.0,
                                  curve: _valueInt,
                                ),
                              ),
                            );
                            controller.forward();
                            controllerNormal.forward();
                            return;
                          }
                        }
                      }
                    });
                  },
                  items: animationString
                      .map<DropdownMenuItem<String>>((String text) {
                    return DropdownMenuItem<String>(
                      value: text,
                      child: Text(text),
                    );
                  }).toList(),
                ),
                left: 150,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 200-movementNormal.value * 2, left: 100-movement.value),
                width: 50,
                color: Colors.green,
                height: 50,
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    controllerNormal?.dispose();
    controller?.dispose();
  }
}
