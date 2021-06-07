import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_barrage/flutter_barrage.dart';

final barrageWallController = BarrageWallController();

class MyBrandePage extends StatefulWidget {
  MyBrandePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyBrandePage> {
  Timer _timer;
  List<Bullet> bullets = List<Bullet>.generate(1000, (i) {
    final showTime = Random().nextInt(60000); // in 60s
    return Bullet(child: Text('$i-$showTime'), showTime: showTime);
  });
  List<String> _words = <String>[
    "666",
    "给阿姨倒杯卡布奇诺",
    "17张牌他能秒我，我当场吃掉这个显示器我当场吃掉这个显示器",
    "小轩在不在,我是娇妹",
    "蛮王冲撞",
    "醉里挑灯看剑，梦回吹角连营。",
    "你看我还有机会吗？",
    "I will find you, and kill you!",
    "风急天高猿啸哀，渚清沙白鸟飞回。",
    "无边落木萧萧下，不尽长江滚滚来。",
    "万里悲秋常作客，百年多病独登台。",
    "艰难苦恨繁霜鬓",
    "潦倒新停浊酒杯",
  ];
  Random random = new Random();

  GlobalKey _myKey = new GlobalKey();
  ScrollController _controller;
  int index = 0;

  @override
  void dispose() {
    _controller.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    // //来监听 节点是否build完成
    // WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    // widgetsBinding.addPostFrameCallback((callback) {
    //   _timer = Timer.periodic(new Duration(seconds: 3), (timer) {
    //     index += _myKey.currentContext.size.height.toInt();
    //     _controller.animateTo((index).toDouble(),
    //         duration: new Duration(milliseconds: 500),
    //         curve: Curves.easeOutSine);
    //     //滚动到底部从头开始
    //     if ((index - _myKey.currentContext.size.height.toInt()).toDouble() >
    //         _controller.position.maxScrollExtent) {
    //       _controller.jumpTo(_controller.position.minScrollExtent);
    //       index = 0;
    //     }
    //   });
    // });
    // _controller = new ScrollController(initialScrollOffset: 0);
    // /*   _controller.addListener(() {
    //   print(_controller.offset);
    // });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("标签测试")),
        body: SafeArea(
            child: Column(children: <Widget>[
          Stack(children: <Widget>[
            Container(
                height: 140,
                color: Colors.green,
                child:
                BarrageWall(
                debug: false,
                // do not send bullets to the safe area
                speed: 10,
                // speedCorrectionInMilliseconds: 10000,
                // timelineNotifier: timelineNotifier, // send a BarrageValue notifier let bullet fires using your own timeline*/
                bullets: bullets,
                child: new Container(),
                controller: barrageWallController))

                // ListView.builder(itemBuilder: (context, index) {
                //   return Text(_words[random.nextInt(12)]);
                // },  physics: new NeverScrollableScrollPhysics(),
                //   itemCount: widget.list.length,
                //   //item固定高度
                //   itemExtent: 24,
                //   scrollDirection: Axis.vertical,
                //   controller: _controller,)),
          ]),
        ])));
  }
}
