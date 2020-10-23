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
  final StreamController _streamController = StreamController<int>();
  final ScrollController _scrollController = ScrollController();
  final PageController _scrollControllerPage = PageController();
  final ScrollController _scrollControllerSc = ScrollController();
  int _count = 0;

  //全局增加
  void _incrementCounter() {
    mNoticeManagerTest.add();
  }

  GlobalKey key = GlobalKey();
  double value = 0;
  bool isLoad = false;

  @override
  void initState() {
    super.initState();
//    print(
//        paintWidthWithTextStyle(TextStyle(fontSize: 16), "测试测试测试").toString());
//    _count = mNoticeManagerTest.count;
//    myTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
//      value = value + 3;
//      setState(() {});
//    });
//    _scrollControllerSc.jumpTo(30);
    _scrollControllerPage
      ..addListener(() {
        double _scrollValue = _scrollControllerPage.offset /
            _scrollControllerPage.position.maxScrollExtent;
        print(_scrollValue);
        _scrollControllerSc
            .jumpTo(30-(_scrollValue == null ? 0 : _scrollValue) * 30);
      });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollControllerSc.jumpTo(30);
    });
  }

  @override
  void dispose() {
    super.dispose();
    myTimer?.cancel();
    _streamController?.close();
  }

  @override
  Widget build(BuildContext context) {
    mNoticeManagerTest = Provider.of<NoticeManagerTest>(context, listen: false);
    print("刷新了");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
              child: Container(
            child:
                new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              new Text(
                'You have pushed the button this many times:',
              ),
              new Text(
                '${mNoticeManagerTest.count}',
                style: Theme.of(context).textTheme.bodyText1,
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
                      value = value + 3;
                    });
                  },
                  child: Text("移动动画")),
              Container(
                  child: Transform.translate(
                offset: Offset(value, 0.0),
                child: Text(
                  "动画移动效果",
                  key: key,
                ),
              )),
              Container(
                  child: Image.network(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598595196330&di=1a9a0abd2a8565bcc2cbf8d1d3486627&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201601%2F26%2F20160126224805_GVjW3.jpeg",
                    frameBuilder: (BuildContext context, Widget child,
                        int frame, bool wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) {
                        return child;
                      }
                      return AnimatedOpacity(
                        child: child,
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 3),
                        curve: Curves.easeOut,
                      );
                    },
                    repeat: ImageRepeat.noRepeat,
                  ),
                  color: Colors.green,
                  height: 60,
                  width: 60),
              Material(
                  child: Ink.image(
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      child: Text(
                        "我是图片",
                        style: TextStyle(color: Colors.white),
                      ),
                      image: NetworkImage(
                          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598595196330&di=1a9a0abd2a8565bcc2cbf8d1d3486627&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201601%2F26%2F20160126224805_GVjW3.jpeg"))),
              Container(
                  child: StreamBuilder<int>(
                      stream: _streamController.stream,
                      initialData: 0,
                      builder:
                          (BuildContext context, AsyncSnapshot<int> snapshot) {
                        return Text("数据刷新：${snapshot.data}");
                      })),
              RaisedButton(
                  onPressed: () {
//                showDialog(context: context, child: PayNewOrderLoseDialog());
                    setState(() {
                      _streamController.add(_count++);
                    });
                  },
                  child: Text("局部刷新界面-StreamBuilder")),
              Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: PageView(
                    controller: _scrollControllerPage,
                    children: [
                      Container(
                        color: Colors.blue,
                        width: double.infinity,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text("page1"),
                      ),
                      Container(
                        color: Colors.green,
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 40,
                        child: Text("page2"),
                      )
                    ],
                  )),

              Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    color: Colors.black12,
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 12),
                  child: CustomScrollView(
                    controller: _scrollControllerSc,
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverToBoxAdapter(
                          child: SizedBox(
                        width: 30,
                      )),
                      SliverToBoxAdapter(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          color: Colors.green,
                        ),
                        width: 30,
                        height: 6,
                        child: Text(""),
                      )),
                      SliverToBoxAdapter(
                          child: SizedBox(
                        width: 240,
                      ))
                    ],
                  )),
              SizedBox(
                height: 80,
              )
            ]),
          )),
        ],
      ),
    );
  }

  ///显示带动画弹窗
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

  ///计算文字宽度
  double paintWidthWithTextStyle(TextStyle style, String text) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }
}
