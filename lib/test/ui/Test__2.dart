import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/test/ui/refresh_indicator.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

///测试滑动嵌套控件  NestedScrollView  下拉刷新
class MyTest1_2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TabController tabController;
  ScrollController scrollController = new ScrollController();
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: ScrollableState());
    scrollController.addListener(() {
//      print(scrollController.position.pixels.toString() +
//          "|" +
//          scrollController.position.maxScrollExtent.toString());
//      if (scrollController.position.pixels ==
//          scrollController.position.maxScrollExtent) {
//        _controller.finishRefresh(success: true);
//      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getView(),
    );
  }

  Widget getView() {
    return RefreshIndicatorNestedScrollView(
        notificationPredicate: (notification) {
          return true;
        },
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2), () {
            return true;
          });
        },
        child: getChildView());
  }

  Widget getChildView() {
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
//            SliverAppBar(
//              leading: IconButton(
//                icon: Image.asset("assets/images/back_white.png"),
//                padding: EdgeInsets.all(12),
//                onPressed: () => Navigator.of(context).pop(),
//              ),
//              title: Container(
//                  alignment: Alignment.center,
//                  child:Text("标题",style: Tex tStyle(color: Colors.black),),
//                  width: double.infinity),
//              elevation: 0.2,
//              pinned: true,
//              backgroundColor: Color(0xffF3F2F5),
//              flexibleSpace: FlexibleSpaceBar(
//                //伸展处布局
//                collapseMode : CollapseMode.pin, //视差效果
////                centerTitle:true,
//                background: DummySection(color: Colors.red,height: 40,),
//              ),
//            ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Card(
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                child: Text("hello"),
              ),
            );
          }, childCount: 4)),
          SliverPersistentHeader(
              pinned: true,
              delegate: _SliverDelegate(
                  minHeight: 50.0,
                  maxHeight: 50.0,
                  child: Container(
                      color: Colors.white,
                      child: TabBar(
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
//              Container(color: Colors.white,child: TabBar(
//                unselectedLabelColor: Colors.blue[100],
//                indicator: BoxDecoration(color: Colors.lightBlue),
//                controller: tabController,
//                tabs: <Widget>[
//                  Tab(
//                    text: "Home",
//                  ),
//                  Tab(
//                    text: "Fav",
//                  ),
//                  Tab(
//                    text: "Star",
//                  )
//                ],
//              )),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: [DummyList(), DummyList(), DummyList()]),
            )
          ],
        ),
      ),
    );
  }
}

// Dummy List Container
// ignore: must_be_immutable
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

// Dummy Listing for tab
class DummyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WaterfallFlow.builder(
        //cacheExtent: 0.0,
        padding: EdgeInsets.all(5.0),
    itemCount: 10,
    itemBuilder:(context, index) {
      return Card(
        child: Container(
          width: 160,
          height: 120.0,
          alignment: Alignment.center,
          child: Text("hello"),
        ),
      );
    },
    gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 5.0,
    mainAxisSpacing: 5.0,
    /// follow max child trailing layout offset and layout with full cross axis extend
    /// last child as loadmore item/no more item in [GridView] and [WaterfallFlow]
    /// with full cross axis extend
    //  LastChildLayoutType.fullCrossAxisExtend,

    /// as foot at trailing and layout with full cross axis extend
    /// show no more item at trailing when children are not full of viewport
    /// if children is full of viewport, it's the same as fullCrossAxisExtend
    //  LastChildLayoutType.foot,
    lastChildLayoutTypeBuilder: (index) => index == 10
    ? LastChildLayoutType.foot
        : LastChildLayoutType.none,
    ));
  }
}
