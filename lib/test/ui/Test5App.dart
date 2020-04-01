import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class Test5App extends StatelessWidget {
  //todo 底部按钮点击时间回掉掉方法
  onclick() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      //todo 导航栏
      appBar: new AppBar(
        actions: <Widget>[
          Tab(
            icon: Icon(Icons.menu),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("返回"),
          )
        ],
        title: new Text("test5"),
      ),
      //todo 抽屉
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("34343434@qq.com"),
              accountName: Text("xiaoming"),
              currentAccountPicture: CircleAvatar(
                child: Text("X"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text("联系人"),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text("邮箱列表"),
            )
          ],
        ),
      ),
      //todo 垂直布局
      body: new Column(children: [
        //todo 富文本显示
        new Text.rich(
          TextSpan(children: [
            TextSpan(
                text: "富文本1",
                style: TextStyle(color: Colors.yellow, fontSize: 20)),
            TextSpan(
                text: "富文本2", style: TextStyle(color: Colors.red, fontSize: 20))
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
        ),
        //todo 带阴影的按钮
        new RaisedButton(
          child: new Text("带阴影按钮"),
          color: Colors.blue,
          textColor: Colors.white,
          highlightColor: Colors.blue[700],
          onPressed: () {
//          Fluttertoast.showToast(msg: "我是Toast提示！");
          },
        ),
        FlatButton(
          child: Text("扁平按钮"),
          onPressed: () {},
        ),
        OutlineButton(
          child: Text("带边框背景按钮"),
          onPressed: () {},
        ),
        //todo 带图片的按钮
        IconButton(
          icon: Icon(Icons.call),
          onPressed: () {},
        ),
//        Image(
//            image: NetworkImage(
//                "https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png")),
        Image.asset("assets/image/img1.png"),
        Image(image: AssetImage("assets/image/img1.png"))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("首页")),
          new BottomNavigationBarItem(
              icon: Icon(Icons.call), title: Text("联系人")),
          new BottomNavigationBarItem(
              icon: Icon(Icons.mail), title: Text("我的")),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.red,
        onTap: onclick(),
        type:BottomNavigationBarType.fixed ,
      ),
    );
  }
}
