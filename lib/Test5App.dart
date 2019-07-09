import 'package:flutter/material.dart';

class Test5App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(actions: <Widget>[
        new RaisedButton(onPressed: () {
//          Navigator.pop();
        },
        )
      ], title: new Text("test5")),
      //todo 垂直布局
      body: new Column(children: [
        new Text.rich(
          TextSpan(children: [
            TextSpan(text: "富文本1", style: TextStyle(color: Colors.yellow,fontSize: 20)),
            TextSpan(text: "富文本2",style: TextStyle(color: Colors.red,fontSize: 20))
          ]),
        ),
        new Text("我是一个文本显示控件"),
        new Container(
          child: new Text(
            "我是Container容器",
            style: TextStyle(
                fontSize: 42,
                color: Colors.lightBlueAccent,
                //字体颜色
                fontStyle: FontStyle.italic,
                //斜体
                background: new Paint()..color = Colors.yellow,
                //背景
                decoration: TextDecoration.underline,
                //下划线
                fontFamily: "Courier"),
            maxLines: 1,
            overflow: TextOverflow.ellipsis, //满一行...表示
          ),
          alignment: Alignment.center,
        )
      ]),
    );
  }
}
