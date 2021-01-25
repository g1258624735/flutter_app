import 'package:flutter/material.dart';
import 'package:flutter_app/test/bean/notie_manager_test.dart';
import 'package:flutter_app/test/ui/Test10App.dart';
import 'package:flutter_app/test/ui/Test11App.dart';
import 'package:flutter_app/test/ui/Test12App.dart';
import 'package:flutter_app/test/ui/Test13App.dart';
import 'package:flutter_app/test/ui/chart_app.dart';
import 'package:flutter_app/test/ui/chart_demo.dart';
import 'package:flutter_app/test/ui/scan_page.dart';
import 'package:flutter_app/test/ui/test1.dart';
import 'package:flutter_app/test/ui/test2.dart';
import 'package:flutter_app/test/ui/test3.dart';
import 'package:flutter_app/test/ui/test4HttpNet.dart';
import 'package:flutter_app/zhihu_demo/ui/BottomNavigationPage.dart';
import 'package:flutter_app/zhihu_demo/ui/ZhiHuMainPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'test/ui/Test5App.dart';
import 'test/ui/Test6App.dart';
import 'test/ui/Test7App.dart';
import 'test/ui/TestAnimation.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NoticeManagerTest>.value(value: NoticeManagerTest())
  ], child: MainApp()));
}

/// 首页 list 列表 菜单列表
class MainApp extends StatefulWidget {
  @override
  createState() => new _MainApp();
}

class _MainApp extends State<MainApp> {
  final List<String> list = [
    "简单的UI控件测试demo",
    "简单的UI控件测试demo2",
    "购物车demo测试例子3",
    "测试网络请求4",
    "基本控件测试",
    "基本控件测试2",
    "基本控件测试3",
    "测试BottomNavigation",
    "仿知乎demo",
    "测试动画",
    "测试二维码扫描",
  ];
  final TextStyle _biggerFont = new TextStyle(fontSize: 18.0);
  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Startup Name Generator',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale("zh", "CH"), const Locale("en", "US")],
        theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.red,
          primaryColor: Colors.redAccent,
//          splashColor: Color(0x00000000),
//          highlightColor: Color(0x00000000),
//          backgroundColor: Color(0xFFC91B3A),
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("首页")),
          body: _buildSuggestions(context),
        ));
  }

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  Widget _buildSuggestions(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(milliseconds: 600), () {});
        },
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          controller: ScrollController(keepScrollOffset: false),
          itemBuilder: (context, i) {
            if (i.isOdd) return new Divider();
            final index = i ~/ 2;
            return _buildRow(context, list[index], index);
          },
          itemCount: list.length * 2,
//      scrollDirection: Axis.horizontal,//水平布局
        ));
  }

  Widget _buildRow(BuildContext context, String pair, int index) {
    return ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
      onTap: () {
        _toNextPage(context, index);
      },
    );
  }

  ///跳转到下一页
  void _toNextPage(BuildContext context, int index) {
    // ignore: missing_return
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      switch (index) {
        case 0:
          return ChartApp();
        case 1:
          return Test2App();
        case 2:
          return Test3App();
        case 3:
          return Test4App();
        case 4:
          return Test5App();
        case 5:
          return Test6App();
        case 6:
          return Test7App();
        case 7:
          return BottomNavigationPage();
        case 8:
          return ZhiHuMainPage();
        case 9:
          return TestAnimation();
        case 10:
          return ScanPage();
      }
    }));
  }
}
