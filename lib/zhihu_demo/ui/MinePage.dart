import 'package:flutter/material.dart';
import 'package:flutter_app/test/ToastPostion.dart';

import 'LoginPage.dart';

//我的界面
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => new _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("我的")),
      body: new Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Image(
              image: AssetImage("assets/image/ic_launcher_round.png"),
              width: 80,
              height: 80,
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              margin: EdgeInsets.only(top: 16),
              child: RaisedButton(
                child: Text(
                  "请登录",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                highlightColor: Colors.lightBlueAccent,
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>LoginPage()));
                  });
                },
              )),
          Container(
            height: 200,
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("喜欢的文章"),
                  leading: Icon(Icons.favorite),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    setState(() {
                      Toast.toast(context, msg: "你点击了喜欢");
                    });
                  },
                ),
                ListTile(
                  title: Text("关于我们"),
                  leading: Icon(Icons.info),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    setState(() {
                      Toast.toast(context, msg: "你点击了关于我们");
                    });
                  },
                ),
                ListTile(
                  title: Text("退出登录"),
                  leading: Icon(Icons.info),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    setState(() {
                      Toast.toast(context, msg: "你退出了登录");
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
