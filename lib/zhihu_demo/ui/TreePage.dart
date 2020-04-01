import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/test/ui/ToastPostion.dart';
import 'package:flutter_app/zhihu_demo/http/api.dart';
import 'package:flutter_app/zhihu_demo/http/http_util.dart';

import 'DetailInfoPage.dart';

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
    String content = "";
    for (var s in list) {
      content += '${s["name"]}  ';
    }
    return Card(
        elevation: 3.0,
        borderOnForeground: true,
        child: InkWell(
          child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  /// 占用整个屏幕
                  Expanded(
                      child: Column(
                    //子控件 从最左边开始显示  与原控件 交叉轴 方向
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(data["name"],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        padding: EdgeInsets.only(bottom: 8),
                      ),
                      Text(
                        content,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15),

                        /// 当位置不够 省略号显示
//                    overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )),
                  Icon(Icons.chevron_right, color: Colors.black)
                ],
              )),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailInfoPage(data);
            }));
          },
        ));
  }
}
