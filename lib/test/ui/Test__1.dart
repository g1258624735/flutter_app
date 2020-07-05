import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/test/widget/MyNestedScrollView.dart';

///测试滑动嵌套控件  NestedScrollView  下拉刷新
class MyTest11App extends StatelessWidget {
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
  GlobalKey<MyNestedScrollViewState> magicNavBarSearchKey = GlobalKey();
  bool isLoad= false;
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
//        print("滑动到底部。。。");
//      }
    if(!isLoad) {
      isLoad= true;
      MyNestedScrollViewState state = magicNavBarSearchKey.currentState;
      state.innerController.addListener(() {
        if (state.innerController.position.pixels ==
            state.innerController.position.maxScrollExtent) {
          print("innerController滑动到底部。。。");
        }
      });
    }
    });


//    MyNestedScrollViewState state = magicNavBarSearchKey.currentState;
//      state.outerController.addListener(() {
//        if (scrollController.position.pixels ==
//            scrollController.position.maxScrollExtent) {
//          print("innerController滑动到底部。。。");
//        }
//      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getChildView(),
    );
  }

  Widget getView() {
    return RefreshIndicator(
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
    MyNestedScrollView widget = MyNestedScrollView(key: magicNavBarSearchKey,
//      physics: BouncingScrollPhysics(),
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
//                collapseMode: CollapseMode.pin, //视差效果
//                centerTitle: true,
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
//          SliverPersistentHeader(
//              pinned: false,
//              delegate: _SliverDelegate(
//                  minHeight: 50.0,
//                  maxHeight: 50.0,
//                  child: Container(
//                      color: Colors.white,
//                      child: TabBar(
//                        unselectedLabelColor: Colors.blue[100],
//                        indicator: BoxDecoration(color: Colors.lightBlue),
//                        controller: tabController,
//                        tabs: <Widget>[
//                          Tab(
//                            text: "Home",
//                          ),
//                          Tab(
//                            text: "Fav",
//                          ),
//                          Tab(
//                            text: "Star",
//                          )
//                        ],
//                      ))))
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
    return widget;
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
class DummyListTop extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DummyListStateTop();
  }
}
// Dummy Listing for tab
class DummyList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
   return DummyListState();
  }
}
class DummyListState extends State {
  ScrollController scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
//      print(scrollController.position.pixels.toString() +
//          "|" +
//          scrollController.position.maxScrollExtent.toString());
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("滑动到底部。。。");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
//      controller: scrollController,
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
class DummyListStateTop extends State {
  ScrollController scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
//      print(scrollController.position.pixels.toString() +
//          "|" +
//          scrollController.position.maxScrollExtent.toString());
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("滑动到底部。。。");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
//      controller: scrollController,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Card(
          child: Container(
            height: 100.0,
            alignment: Alignment.center,
            child: Text("hello"),
          ),
        ),
        Card(
          child: Container(
            height: 100.0,
            alignment: Alignment.center,
            child: Text("hello"),
          ),
        ),
        Card(
          child: Container(
            height: 100.0,
            alignment: Alignment.center,
            child: Text("hello"),
          ),
        ),

      ],
    );
  }

}
