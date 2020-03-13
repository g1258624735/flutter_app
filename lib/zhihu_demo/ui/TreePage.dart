import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      if (data = null) {
        setState(() {
          listData = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("列表"),
        ),
        body: ListView.builder(
            itemBuilder: (context, i) => _buildItem(i),
            itemCount: listData.length));
  }

  ///处理listview 每个条目的数据
  _buildItem(int i) {
    

  }
}
