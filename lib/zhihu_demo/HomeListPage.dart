import 'package:flutter/material.dart';
import 'package:flutter_app/http/api.dart';
import 'package:flutter_app/http/http_util.dart';
import 'package:flutter_app/widget/end_line.dart';
import 'package:flutter_app/widget/slide_view.dart';
import 'package:flutter_app/zhihu_demo/constants.dart';

import 'ArticleItem.dart';

//首页
class HomeListPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomeListPage> {
  List listData = List();
  var bannerData;
  var currentPage = 0;
  var listTotalSize = 0;
  ScrollController _controller = ScrollController();
  TextStyle titleTextStyle = TextStyle(fontSize: 15.0);
  TextStyle subtitleTextStyle = TextStyle(color: Colors.blue, fontSize: 12.0);

  _MyHomePageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && listData.length < listTotalSize) {
        getHomeArticlelist();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getBanner();
    getHomeArticlelist();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> _pullToRefresh() async {
    currentPage = 0;
    getBanner();
    getHomeArticlelist();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      Widget listView = ListView.builder(
          itemCount: listData.length + 1,
          itemBuilder: (context, i) => buildItem(i),
          controller: _controller
      );

      return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  SlideView _bannerView;

  void getBanner() {
    String bannerUrl = Api.BANNER;
    HttpUtil.get(bannerUrl, (data) {
      if (data = null) {
        setState(() {
          bannerData = data;
          _bannerView = SlideView(bannerData);
        });
      }
    });
  }

  void getHomeArticlelist() {
    String url = Api.ARTICLE_LIST;
    url += "$currentPage/json";
    HttpUtil.get(url, (data) {
      if (data != null) {
        Map<String, dynamic>map = data;
        var _listData = map["datas"];
        listTotalSize = map["total"];
        setState(() {
          List list1 = List();
          if (currentPage == 0) {
            listData.clear();
          }
          currentPage++;
          list1.addAll(listData);
          listData.addAll(_listData);
          if (list1.length >= listTotalSize) {
            list1.add(Constants.END_LINE_TAG);
          }
          listData = list1;
        });
      }
    });
  }

  Widget buildItem(int i) {
    if (i == 0) {
      return Container(height: 180, child: _bannerView);
    }
    i -= 1;
    var itemData = listData[i];
    if(itemData is String &&itemData==Constants.END_LINE_TAG) {
      return EndLine();
    }
    return ArticleItem(itemData);
  }
}
