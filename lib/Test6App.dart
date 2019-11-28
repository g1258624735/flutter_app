import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class Test6App extends StatefulWidget {
  //todo 底部按钮点击时间回掉掉方法
  onclick() {}

  @override
  State<StatefulWidget> createState() {
    return new Test6_1_App();
  }
}

class Test6_1_App extends State<Test6App> {
  bool isCheck = false;
  bool isSwich = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      //todo 导航栏
      appBar: new AppBar(
        actions: <Widget>[
          Tab(
            icon: Icon(Icons.menu),
          )
        ],
        title: new Text("基本测试控件2"),
      ),

      //todo 垂直布局
      body: new Column(children: [
        Switch(
            value: isSwich,
            activeTrackColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                isSwich = value;
              });
            }),
        Checkbox(
          value: isCheck,
          activeColor: Colors.blue,
          onChanged: (value) {
            setState(() {
              isCheck = value;
            });
          },
        ),
        TextField(
          autofocus: true,
          decoration: InputDecoration(
              hintText: "请输入密码", labelText: "密码", prefixIcon: Icon(Icons.lock)),
        ),
        TextFormField(
          autofocus: false,
          decoration: InputDecoration(
              hintText: "请输入用户名", labelText: "用户名", icon: Icon(Icons.people)),
          validator: (v) {
            return "用户名不能为空!";
          },
        ),
        Row(
          children: <Widget>[
            Text(

              "测试1！",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                inherit: true,
                color: Colors.red,
                fontSize: 20,

              ),
            )
          ],
        )
      ]),
    );
  }
}
