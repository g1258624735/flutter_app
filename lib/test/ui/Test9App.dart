import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/test/utils/TextUtil.dart';

///测试嵌套
class Test9App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Test8AppState();
  }
}

class Test8AppState extends State {
  String imgBackgroundUrl = "";
  ScrollController scrollController = ScrollController();
  bool isShowNavBg = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > 80) {
        //判断是否滑动到顶部
        if (!isShowNavBg) {
          //替换顶部导航栏图片
          isShowNavBg = true;
          setState(() {});
        }
      } else {
        if (isShowNavBg) {
          //替换顶部导航栏图片
          isShowNavBg = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = (window.padding.top / window.devicePixelRatio);
    double height = 225.0 + statusBarHeight;
    return MaterialApp(
        title: 'Startup Name Generator',
        theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColor: Color(0xffF43333),
//          splashColor: Color(0x00000000),
//          highlightColor: Color(0x00000000),
          backgroundColor: Color(0xffF43333),
          accentColor: Color(0xFF888888),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("我是首页",style: TextStyle(color: isShowNavBg?Colors.black:Colors.white),),
              leading: _buildLeading(),
              elevation: 0,
              backgroundColor:!isShowNavBg?Colors.transparent:Color(0xffF43333),
            ),
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: NestedScrollView(
              controller: scrollController,
              body: Container(
                height: 2048,
              ),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        Container(
                            height: height,
                            width: double.infinity,
                            child: TextUtil.isEmpty(imgBackgroundUrl)
                                ? Container(
                                    width: double.infinity,
                                    color: Color(0xffF43333),
                                  )
                                : Image.network(imgBackgroundUrl,
                                    width: double.infinity, height: height)),
                        Container(
                            height: height,
                            width: double.infinity,
                            child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                              colors: [
                                Color(0xB3000000),
                                Color(0x66000000),
                                Color(0xffF3F2F5)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              "assets/image/ic_launcher_round.png",
                              width: 30,
                              height: 30,
                            ),
                            Text('复仇者联盟'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ];
              },
            )));
  }

  ///返回按钮
  Widget _buildLeading() => IconButton(
        icon: Image.asset("assets/image/back_white.png"),
        padding: EdgeInsets.all(12),
        onPressed: () => Navigator.of(context).pop(),
      );
}
