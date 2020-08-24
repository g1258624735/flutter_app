import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// 官方 NestScrollView 使用方法
class Test7App7 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Test7App7State();
  }
}

class Test7App7State extends State {
  List _tabs = ["tab1", "tab2"];
  ScrollController magicCoreController =
  ScrollController();
@override
  void initState() {
    super.initState();
    magicCoreController.addListener(() {
    print("magicCoreController");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("测试NestScrollView"),actions: <Widget>[RaisedButton(onPressed: (){
        magicCoreController.jumpTo(1);
      },child: Text("置顶"),)],),
        body: DefaultTabController(
          length: _tabs.length, // This is the number of tabs.
          child: NestedScrollView(
            controller: magicCoreController,
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              // These are the slivers that show up in the "outer" scroll view.
              return <Widget>[
                SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context),
                sliver:SliverList(
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      return Container(child: Text("testNestScrollView"),height: 20,);
                    }, childCount:30)))
              ];
            },
            body: TabBarView(
              // These are the contents of the tab views, below the tabs.
              children: _tabs.map((name) =>_getItem(name)).toList(),
            ),
          ),
        )
    );
  }

  Widget _getItem(name) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        // This Builder is needed to provide a BuildContext that is
        // "inside" the NestedScrollView, so that
        // sliverOverlapAbsorberHandleFor() can find the
        // NestedScrollView.
        builder: (BuildContext context) {
          return CustomScrollView(
            // The "controller" and "primary" members should be left
            // unset, so that the NestedScrollView can control this
            // inner scroll view.
            // If the "controller" property is set, then this scroll
            // view will not be associated with the NestedScrollView.
            // The PageStorageKey should be unique to this ScrollView;
            // it allows the list to remember its scroll position when
            // the tab view is not on the screen.
            key: PageStorageKey<String>(name),
            slivers: <Widget>[
              SliverOverlapInjector(
                // This is the flip side of the SliverOverlapAbsorber
                // above.
                handle: NestedScrollView
                    .sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                // In this example, the inner scroll view has
                // fixed-height list items, hence the use of
                // SliverFixedExtentList. However, one could use any
                // sliver widget here, e.g. SliverList or SliverGrid.
                sliver: SliverFixedExtentList(
                  // The items in this example are fixed to 48 pixels
                  // high. This matches the Material Design spec for
                  // ListTile widgets.
                  itemExtent: 48.0,
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      // This builder is called for each child.
                      // In this example, we just number each list item.
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    // The childCount of the SliverChildBuilderDelegate
                    // specifies how many children this inner list
                    // has. In this example, each tab has a list of
                    // exactly 30 items, but this is arbitrary.
                    childCount: 30,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}