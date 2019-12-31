//import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Test7App.dart';

class Test7App_1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Test7App_1_1();
  }
}

class _Test7App_1_1 extends State {
  @override
  void initState() {
    super.initState();
  }

  String _groupValue = "";

  _onClick(BuildContext context, String value) {
    setState(() {
      this._groupValue = value;

//      scaffoldKey.currentState.showSnackBar(
//        SnackBar(content: Text(_groupValue),duration:Duration(milliseconds: 50)));
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_groupValue), duration: Duration(milliseconds: 50)));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(children: <Widget>[
      Text("第一个控件"),
      Row(
        children: <Widget>[
          //测试单选按钮
          Radio(
            value: "中文",
            groupValue: _groupValue,
            onChanged: (value) {
              _onClick(context, value);
            },
            activeColor: Colors.red,
          ),
          Text("中文"),
          Radio(
            value: "英文",
            groupValue: _groupValue,
            onChanged: (value) {
              _onClick(context, value);
            },
            activeColor: Colors.red,
          ),
          Text("英文"),
        ],
      ),
      OutlineButton(
        child: Text("弹出底部弹窗"),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) => const _Drawle(),
          );
        },
      ),
      OutlineButton(
        child: Text("弹出pop弹窗"),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => const _Drawle(),
          );
        },
      ),
      RaisedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text("RaisedButton"),
        color: Colors.greenAccent,
        highlightColor: Colors.green,
        textColor: Colors.white,
      ),
      Row(
        children: <Widget>[
          Text("DropDown_Button"),
          DropdownButton<String>(
            value: _value,
            onChanged: (String newValue) {
              setState(() {
                this._value = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String text) {
              return DropdownMenuItem<String>(
                value: text,
                child: Text(text),
              );
            }).toList(),
          ),
        ],
      )
    ]);
  }

  String _value = "";
}

class _Drawle extends StatelessWidget {
  const _Drawle();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "我是底部弹窗",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      height: 200,
      color: Colors.green,
      alignment: Alignment.center,
    );
  }
}
