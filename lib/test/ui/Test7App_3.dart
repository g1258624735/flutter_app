//import 'package:fluttertoast/fluttertoast.dart';

import 'package:circle_progress/circle_progress.dart';
import 'package:circle_progress/example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test/widget/circle_progress_widget.dart';

import 'CircleTest.dart';

//测试控件 7_3
class Test7App_3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Test7App_3_1();
  }
}

class _Test7App_3_1 extends State with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Text("测试圆形进度条"),
      SizedBox(
        child: null,
        height: 10,
      ),
//      CircleProgressWidget(
//          progress: Progress(
//              backgroundColor: Colors.grey,
//              value: 0.8,
//              radius: 100,
//              completeText: "完成",
//              color: Color(0xff46bcf6),
//              strokeWidth: 5)),
      Row(children:<Widget>[
        Expanded(
            child: Container(child: Text("测试"), height: 10, color: Colors.blue))
      ]),
      SizedBox(
        child: null,
        height: 10,
      ),
      CircleStateful(),
      SizedBox(
        child: null,
        height: 10,
      ),
      MyCircleProgressWidget(
          progress: MyProgress(
              //Color(0xfff3f2f5)
              backgroundColor: Color(0xfff3f2f5),
              value: 0.5,
              radius: 90,
              completeText: "100%",
              color: Color(0xffF13333),
              strokeWidth: 8)),
    ]);
  }
}
