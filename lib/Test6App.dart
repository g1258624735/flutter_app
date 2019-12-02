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
        //两种状态开关按钮
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

        Text(
          "测试1！",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            inherit: true,
            color: Colors.red,
            fontSize: 20,
          ),
        ),
        new Container(
            height: 100.0,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            //功能强大的装饰器 可以设置圆角、边框、背景色、背景图片
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ListView.separated(
              padding: EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int i) {
                return new ListTile(title: new Text("我是listView"));
              },
              // listView 线条
              separatorBuilder: (BuildContext context, int index) {
                return new Container(height: 1.0, color: Colors.red);
              },
              itemCount: 2,
            )),
        new Container(
          height: 100.0,
          decoration: BoxDecoration( color: Colors.lightBlueAccent,borderRadius:
          BorderRadius.all(Radius.circular(8))),
          //子类对齐方式
          alignment:Alignment.center ,
          //外边距
          margin: EdgeInsets.all(15),
          //内边距
          padding: EdgeInsets.all(16),
          //背景色
          child: Text("我是一个容器",style: TextStyle(color: Colors.white)),
        )
      ]),
    );
  }
}
