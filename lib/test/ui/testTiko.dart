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

class MyAppTestTiko extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    mNoticeManagerTest = Provider.of<NoticeManagerTest>(context, listen: false);
    print("刷新了");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            child: Love2Widget(
              progress: LoveProgress(
                  radius: 100,
                  strokeWidth: 2,
                  value: 0.5,
                  color: Colors.redAccent,
                  backgroundColor: Colors.redAccent),
            ),
          )
        ],
      ),
    );
  }
}
