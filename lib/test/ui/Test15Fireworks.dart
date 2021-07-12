import 'package:flutter/material.dart';
import 'package:flutter_app/test/testui/magic_barrage.dart';

import 'Fireworks.dart';

/// 烟花效果
class Test_15_FirWorks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Test_15_FirWorksState();
  }
}

class Test_15_FirWorksState extends State<Test_15_FirWorks> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          Tab(
            icon: Icon(Icons.menu),
          )
        ],
        title: new Text("测试烟花效果"),
      ),
      body:
          new Column(children: [Container(width: 300, child: Fireworks())]),
    );
  }
}
