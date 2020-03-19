import 'dart:ffi';

import 'package:flutter/material.dart';

import 'DetailItemPage.dart';

///详情界面

// ignore: must_be_immutable
class DetailInfoPage extends StatefulWidget {
  var data;

  DetailInfoPage(this.data);

  @override
  _DetailInfoPageState createState() => new _DetailInfoPageState(data);
}

class _DetailInfoPageState extends State<DetailInfoPage> {
  dynamic data;
  TabController _tabControl;
  List list = List();
  List<Tab> tabs = List();
  _DetailInfoPageState(this.data);

  @override
  void initState() {
    super.initState();
    print(data);
     list = data["children"];
    for (var s in list) {
      tabs.add(Tab(child: Text(s["name"])));
    }

    _tabControl =
        TabController(length: list.length, vsync: ScrollableState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.data["name"]),
            bottom:PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Container(
            color: Colors.white,
            ///获取屏幕宽度MediaQuery.of(context).size.width  /获取屏幕高度MediaQuery.of(context).size.height
            width: MediaQuery.of(context).size.width,
            child: TabBar(
                isScrollable: true,
                controller: _tabControl,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: tabs)))),
        body: TabBarView(
            controller: _tabControl,
            children:
            list.map((dynamic item) => DetailItemPage(item['id'].toString())).toList()));
  }
}
