import 'package:flutter/material.dart';

class Test3App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Test4Widget1(),
    );
  }
}

class Test4Widget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Scaffold(
      appBar: new AppBar(actions: <Widget>[
        new RaisedButton(onPressed: () {
          Navigator.pop(context);
        })
      ], title: new Text("test4_UI")),
    );
  }
}
