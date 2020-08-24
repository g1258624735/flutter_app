import 'package:flutter/material.dart';
import 'package:flutter_app/zhihu_demo/http/api.dart';
import 'package:flutter_app/zhihu_demo/http/http_util.dart';
import 'package:flutter_app/zhihu_demo/util/constants.dart';
import 'package:flutter_app/zhihu_demo/widget/end_line.dart';

import 'ArticleItem.dart';

///详情单个条目界面

// ignore: must_be_immutable
class DetailItemPage extends StatefulWidget {
  dynamic id;

  DetailItemPage(this.id);

  @override
  _DetailItemPageState createState() => new _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage>  with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List listData = List();
  int listTotalSize = 0;
  int curPage = 0;
  Map<String, String> map = Map();
  ScrollController _controller = ScrollController();

  _DetailItemPageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        _getData();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    String url = Api.ARTICLE_LIST;
    url += "$curPage/json";
    map['cid'] = widget.id;
    HttpUtil.get(url, (data) {
      if (data != null) {
        Map<String, dynamic> map = data;
        var _listData = map['datas'];
        listTotalSize = map["total"];
        setState(() {
          List list1 = List();
          if (curPage == 0) {
            listData.clear();
          }
          curPage++;
          list1.addAll(listData);
          list1.addAll(_listData);
          if (list1.length >= listTotalSize) {
            list1.add(Constants.END_LINE_TAG);
          }
          listData = list1;
        });
      }
    }, params: map);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("gxj=build");
    if (listData.length==0) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
          itemBuilder: (context, i) => _buildItem(i),
          itemCount: listData.length,
          controller: _controller);
    }
  }

  Widget _buildItem(int i) {
    var itemData = listData[i];
    if (i == listData.length - 1 &&
        itemData.toString() == Constants.END_LINE_TAG) {
      return EndLine();
    }
    return ArticleItem(itemData);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
