import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///测试Sliver
class Test7App_5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Test7App_5_1();
  }
}

class _Test7App_5_1 extends State with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child:ListView.builder(
      itemBuilder: (context, index) {
        return Container(
              alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 8),
          height: 60,
          child: Text(
            "text",
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0x6642A5F5),
        );
      },
      itemCount: 20,
    ),decoration:BoxDecoration(image: DecorationImage(image:AssetImage("assets/image/ic_launcher_round.png"))) ,));
  }
}
