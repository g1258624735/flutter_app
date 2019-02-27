import 'package:flutter/material.dart';
import 'package:flutter_app/test2.dart';

void main() {
  runApp(new Test2MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("welcome to android"),
        ),
        body: new Center(
          child: new Text("你好，欢迎来到安卓!"),
        ),
      ),
    );
  }
}
