//import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/zhihu_demo/MyInfoPage.dart';

import 'HomeListPage.dart';
import 'TreePage.dart';

//仿知测试demo
class Zhihu_main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ZhiHuMain();
  }
}

class _ZhiHuMain extends State {
  var _appBarTitle = ["测试", "首页", "发现", "我的"];
  int _tabIndex = 0;
  List<BottomNavigationBarItem> _navigationViews;
  var _body;

  @override
  void initState() {
    super.initState();
    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          title: Text(_appBarTitle[0]),
          icon: Icon(Icons.streetview),
          backgroundColor: Colors.blue),
      BottomNavigationBarItem(
          title: Text(_appBarTitle[1]),
          icon: Icon(Icons.home),
          backgroundColor: Colors.blue),
      BottomNavigationBarItem(
          title: Text(_appBarTitle[2]),
          icon: Icon(Icons.widgets),
          backgroundColor: Colors.blue),
      BottomNavigationBarItem(
          title: Text(_appBarTitle[3]),
          icon: Icon(Icons.person),
          backgroundColor: Colors.blue),
    ];
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    _body = IndexedStack(index: _tabIndex, children: <Widget>[
      MainApp(),
      HomeListPage(),
      TreePage(),
      MyInfoPage()
    ]);
    return new MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Color(0xFFC91B3A),
        backgroundColor: Color(0xFFC91B3A),
        accentColor: Color(0xFF888888),
      ),
      home: Scaffold(
          appBar:
              AppBar(title: Text(_appBarTitle[_tabIndex]), actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigatorKey.currentState
                      .push(MaterialPageRoute(builder: (context) {
                    return HomeListPage();
                  }));
                })
          ]),
          body: _body,
          bottomNavigationBar: BottomNavigationBar(
            items: _navigationViews
                .map((BottomNavigationBarItem item) => item)
                .toList(),
            currentIndex: _tabIndex,
            onTap: (int index) {
              setState(() {
                _tabIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
          )),
    );
  }
}
