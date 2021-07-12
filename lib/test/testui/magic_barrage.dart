import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'barrage_widget.dart';

///魔法 弹幕组件
class MagicBarrage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MagicBarrageState();
}

class MagicBarrageState extends State<MagicBarrage> {
  var _barrageKey = GlobalKey<BarrageWidgetState>();
  AppLifecycleState appState;
  int times = 0;
  int indexOne = 0;
  int indexTwo = 0;
  int indexThree = 0;
  bool isLoaded = false;
  Timer _timer;

  //
  List commentList = [
    "0购了多次，爱喝的好牛...",
    "1感觉不错！试了一下很... ",
    "2感觉不错！",
    "3感觉不错！试了一下",
    "4感觉",
    "5感觉不错！试了一下",
    "6感觉不错！试了",
    "7感觉不错！试了一下很... ",
    "8感觉不错！试了一下很... ",
    "9感觉不错！试了一",
    "10感觉不错！试了一下很",
    "11感觉不错！试",
    "12感觉不错！试了",
    "13感觉不错！",
    "14感觉不错！试了一下很... ",
    "15感觉不错！试了一下",
    "16感觉",
    "17感觉不",
    "18感觉不错！试了一下",
    "19感觉不错！试了",
    "20感觉不错",
    "21感觉不错！试",
    "22感觉不错！试了一下很",
    "23感觉不错！试了一下",
    "24感觉不错",
    "25感觉不错！试",
    "26感觉不错！试了",
    "27感觉不错！试了一下很... ",
    "28感觉不错！试了一下很... "
  ];

  @override
  void initState() {
    super.initState();
    // _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
    // if (times > 2) {
    //   times = 0;
    // }
    // if (times == 2) {
    for (int i = 0; i < 3; i++) {
      getNextData(i);
    }
    // return false;
    // });
  }

  void getNextData(int type) {
    int index = 0;
    if (type == 0) {
      // 第一列
      index = indexOne * 3;
    } else if (type == 1) {
      // 第二列
      index = indexTwo * 3 + 1;
    } else {
      //第三列
      index = indexTwo * 3 + 2;
    }
    var item = commentList[index];
    var child = _getItem(item);
    String text = "";
    if (index > 2) {
      text = commentList[index - 3];
    } else {
      if (isLoaded) {
        int endIndex=0;

        text =commentList[commentList.length];
      }
    }
    //计算文字高度
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: TextStyle(fontSize: 12)),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    double width = textPainter.size.width;
    var widthS = (window.physicalSize.width - 48.0) * 3 / 20;

    var left = 0.0;
    int delayed = 0;
    if (width > widthS) {
      left = width - widthS;
      delayed =
          left * 1000 ~/ ((window.physicalSize.width - 48.0) / 20);
      print("gxj=====widthS=" +
          width.toString() +
          "|" +
          widthS.toString() +
          "|" +
          delayed.toString() +
          "|" +
          index.toString() +
          "-" +
          text);
    }

    if (type == 0) {
      // 第一列
      indexOne = indexOne + 1;
      if (indexOne * 3 >= commentList.length) {
        isLoaded = true;
        indexOne = 0;
      }
    } else if (type == 1) {
      // 第二列
      indexTwo = indexTwo + 1;
      if (indexTwo * 3 + 1 >= commentList.length) {
        isLoaded = true;
        index = 0;
      }
    } else {
      //第三列
      indexThree = indexThree + 1;
      if (indexThree * 3 + 2 >= commentList.length) {
        isLoaded = true;
        index = 0;
      }
    }

    Future.delayed(Duration(milliseconds: delayed), () {
      _barrageKey.currentState.addBarrage(child);
      getNextData(type);
    });
  }

  @override
  void dispose() {
    // _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          height: 142,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Visibility(
                          visible: true,
                          child: getTextWidget(
                              12, "晒出你的团巴拉好物", Color(0xff8D8D99))),
                    ],
                  ),
                  Container(
                    height: 100,
                    child: BarrageWidget(
                      key: _barrageKey,
                      showCount: 3,
                    ),
                  ),
                ],
              )
            ],
          )),
      onTap: () {},
    );
  }

  ///返回text 组件
  Widget getTextWidget(double textSize, String text, Color textColor,
      {FontWeight fontWeight,
      TextDecoration decoration,
      TextOverflow overflow,
      Key key,
      int maxLines,
      double height,
      TextAlign textAlign = TextAlign.left}) {
    return Text(
      text,
      key: key,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
          decoration: decoration,
          color: textColor,
          fontSize: textSize,
          fontWeight: fontWeight,
          height: height),
    );
  }

  Widget _getItem(var item) {
    String text = item ?? "";
    if (text.length > 10) {
      text = text.substring(0, 10) + "...";
    }
    return Center(
      child: InkWell(
          onTap: () {},
          child: Container(
            height: 20,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 4,
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(
                  width: 4,
                )
              ],
            ),
          )),
    );
  }
}
