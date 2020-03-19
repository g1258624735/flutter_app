import 'package:flutter/material.dart';
import 'package:flutter_app/test/ToastPostion.dart';

//登录界面
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("登录")),
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
              margin: EdgeInsets.only(top: 16,left: 20,right: 20),
              child: TextField(decoration: InputDecoration(labelText: ),)),

        ],
      ),
    );
  }
}
