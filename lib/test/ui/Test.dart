import 'dart:math';

import 'package:flutter/material.dart';

class MyTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class _SliverDelegate extends SliverPersistentHeaderDelegate {
  _SliverDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight; //最小高度
  final double maxHeight; //最大高度
  final Widget child; //孩子

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override //是否需要重建
  bool shouldRebuild(_SliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Image.asset("assets/images/back_white.png"),
                padding: EdgeInsets.all(12),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Container(
                  alignment: Alignment.center,
                  child:Text("标题",style: TextStyle(color: Colors.black),),
                  width: double.infinity),
              elevation: 0.2,
              pinned: true,
              backgroundColor: Color(0xffF3F2F5),
              flexibleSpace: FlexibleSpaceBar(
                //伸展处布局
                collapseMode: CollapseMode.pin, //视差效果
                centerTitle: true,
                background: DummySection(color: Colors.red,height: 40,),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return Card(
                child: Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  child: Text("hello"),
                ),
              );
            }, childCount: 10)),
            SliverPersistentHeader(
                pinned: true,
                delegate: _SliverDelegate(
                    minHeight: 50.0,
                    maxHeight: 50.0,
                    child:Container(color: Colors.white,child: TabBar(
                      unselectedLabelColor: Colors.blue[100],
                      indicator: BoxDecoration(color: Colors.lightBlue),
                      controller: tabController,
                      tabs: <Widget>[
                        Tab(
                          text: "Home",
                        ),
                        Tab(
                          text: "Fav",
                        ),
                        Tab(
                          text: "Star",
                        )
                      ],
                    ))))
          ];
        },
        body: Container(
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                    controller: tabController,
                    children: [DummyList(), DummyList(), DummyList()]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy List Container
class DummySection extends StatelessWidget {
  Color color;
  double height;

  DummySection({this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
    );
  }
}

// Dummy Listing for tab
class DummyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Card(
          child: Container(
            height: 200.0,
            alignment: Alignment.center,
            child: Text("hello"),
          ),
        ),
        Card(
          child: Container(
            height: 200.0,
            alignment: Alignment.center,
            child: Text("hello"),
          ),
        ),
        Card(
          child: Container(
            height: 200.0,
            alignment: Alignment.center,
            child: Text("hello"),
          ),
        ),
        Card(
          child: Container(
            height: 200.0,
            alignment: Alignment.center,
            child: Text("hello"),
          ),
        ),
        Card(
          child: Container(
            height: 200.0,
            alignment: Alignment.center,
            child: Text("hello"),
          ),
        ),
      ],
    );
  }
}
