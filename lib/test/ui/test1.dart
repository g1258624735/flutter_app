import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/test/bean/notie_manager_test.dart';
import 'package:flutter_app/test/widget/pay_new_order_lose_dialog.dart';
import 'package:provider/provider.dart';

class MyAppTest1 extends StatelessWidget {
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

class _MyHomePageState extends State<MyHomePage> {
  NoticeManagerTest mNoticeManagerTest;
  Timer myTimer;

  //全局增加
  void _incrementCounter() {
    mNoticeManagerTest.add();
  }

  GlobalKey key = GlobalKey();
  double value=0;

  @override
  void initState() {
    super.initState();

//    print(
//        paintWidthWithTextStyle(TextStyle(fontSize: 16), "测试测试测试").toString());
//    _count = mNoticeManagerTest.count;
    myTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      value =value+3;
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    myTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    mNoticeManagerTest = Provider.of<NoticeManagerTest>(context, listen: false);
    print("刷新了");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Text(
            'You have pushed the button this many times:',
          ),
          new Text(
            '${mNoticeManagerTest.count}',
            style: Theme.of(context).textTheme.display1,
          ),
          RaisedButton(onPressed: _incrementCounter, child: Text("全局刷新增加")),
          //局部刷新控件
          Consumer<NoticeManagerTest>(builder: (context, timerModel, _) {
            return Text(
              "局部刷新${timerModel.count}",
              overflow: TextOverflow.ellipsis,
            );
          }),
          RaisedButton(onPressed: _incrementCounter, child: Text("局部刷新增加")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: Colors.green,
                width: 50,
                height: 20,
              ),
              Container(color: Colors.red, width: 50, height: 20),
              Container(color: Colors.blue, width: 50, height: 20)
            ],
          ),
          Container(
              width: 40,
              child: Text(
                "测试测试测试",
                softWrap: true,
                style: TextStyle(fontSize: 16),
              )),
          Row(
            children: <Widget>[
              Container(
                  width: 160,
                  height: 82,
                  color: Colors.green,
                  child: Image.asset(
                      "assets/image/bg_youhuiquan_you02_sel_s.png",
                      color: Colors.white,
                      fit: BoxFit.fill)),
              Container(
                  width: 82,
                  height: 82,
                  color: Colors.green,
                  margin: EdgeInsets.only(top: 10),
                  child: Icon(IconData(0xe615, fontFamily: 'aliIcon'),
                      color: Colors.red, size: 82))
            ],
          ),
          Text("0xe611", style: TextStyle(fontFamily: 'aliIcon')),
          RaisedButton(
              onPressed: () {
                showThisDialog((state) {
                  if (state != null && state == "start") {
//                    Toast.toast(context,
//                        msg: "开始倒计时开始 ", position: ToastPostion.bottom,showTime: 1);
                    print("开始倒计时");
                  } else if (state != null && state == "end") {
//                    Toast.toast(context,
//                        msg: "开始倒计时结束 ", position: ToastPostion.bottom,showTime: 1);
                    print("结束倒计时");
                    Navigator.of(context).pop();
                  }
                });
              },
              child: Text("显示弹窗")),
          RaisedButton(
              onPressed: () {
//                showDialog(context: context, child: PayNewOrderLoseDialog());
              setState(() {
                value =value+3;
              });
              },
              child: Text("移动动画")),
          Container(
              child: Transform.translate(
            offset: Offset(value, 0.0),
            child: Text("动画移动效果",key:key,),
          ))
        ]),
      ),
    );
  }

  showThisDialog(Function callBack) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {},
        barrierColor: Colors.grey.withOpacity(.1),
        barrierDismissible: true,
        barrierLabel: "",
        transitionDuration: Duration(milliseconds: 100),
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.scale(
            scale: anim1.value,
//            child: HandOrderLoadingWidget(callback: callBack),
            child: PayNewOrderLoseDialog(),
          );
        });
  }

  double paintWidthWithTextStyle(TextStyle style, String text) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }
}
