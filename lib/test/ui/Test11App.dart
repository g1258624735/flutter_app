import 'dart:ui';

import 'package:flutter/material.dart';

///测试  ces
class Test11App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Test10AppState();
  }
}

class Test10AppState extends State {
  String imgBackgroundUrl = "";
  ScrollController scrollController = ScrollController();
  double dy = 0.0;
  double dyMove = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = (window.padding.top / window.devicePixelRatio);
    double height = 225.0 + statusBarHeight;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "我是首页",
            style: TextStyle(color: Colors.white),
          ),
          leading: _buildLeading(),
          elevation: 0,
          backgroundColor: Color(0xffF43333),
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: ListView.builder(
              controller: ScrollController(),
              itemBuilder: (context, index) {
                if (index != 20) {
                  return Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.green,
                      ),
                      Divider(
                        height: 1,
                        color: Colors.red,
                      )
                    ],
                  );
                } else {
                  return Container(
                      height: 56,
                      child: TextField(
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff060918)),
                        controller: TextEditingController(text: ""),
                        textAlign: TextAlign.end,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.only(top: 0, bottom: 9),
                            hintText: "",
                            hintStyle: TextStyle(color: Color(0xffC2C0CC)),
                            //修改颜色
                            border: InputBorder.none),
                      ));
                }
              },
              itemCount: 30,
            ));
  }

  ///返回按钮
  Widget _buildLeading() => IconButton(
        icon: Image.asset("assets/image/back_white.png"),
        padding: EdgeInsets.all(12),
        onPressed: () => Navigator.of(context).pop(),
      );
}
