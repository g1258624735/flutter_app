import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test/ToastPostion.dart';
import 'package:flutter_app/zhihu_demo/http/api.dart';
import 'package:flutter_app/zhihu_demo/http/http_util.dart';

//列表页
class TreePage extends StatefulWidget {
  @override
  _TreePageState createState() => new _TreePageState();
}

class _TreePageState extends State<TreePage> {
  var listData;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  ///获取列表数据
  void _getData() {
    HttpUtil.get(Api.TREE, (data) {
      if (data != null) {
        setState(() {
          listData = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null) {
      return new Scaffold(
          appBar: AppBar(
            title: Text("列表"),
          ),
          body: Center(child: CircularProgressIndicator()));
    } else {
      return new Scaffold(
          appBar: AppBar(
            title: Text("列表"),
          ),
          body: ListView.builder(
              itemBuilder: (context, i) => _buildItem(i),
              itemCount: listData.length));
    }
  }

  ///处理listview 每个条目的数据
  Widget _buildItem(int i) {
    var data = listData[i];
    List list = data["children"];
    String content ="";
    for( var s in list){
      content +='${s["name"]}  ';
    }
    return Card(
        elevation: 3.0,
        borderOnForeground: true,
        child: InkWell(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[Text(data["name"]), Text(content,softWrap: true,)],
              ),
              Image(
                  image: AssetImage("assets/image/img1.png"),
                  width: 20,
                  height: 20)
            ],
          ),
          onTap: () {
            Toast.toast(context, msg: "你点击我了!");
          },
        ));
  }
}
