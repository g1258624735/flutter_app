import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
/// 品牌详情
/// author gxj
/// date 2020.6.1
class BrandDetailPage extends StatefulWidget {
  final int productId;

  BrandDetailPage({Key key, this.productId}) : super(key: key);

  @override
  _BrandDetailPageState createState() => _BrandDetailPageState();
}

class _BrandDetailPageState extends State<BrandDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xffF3F2F5),
      child: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          _buildPersistentHeader(),
          _buildSliverList()
        ],
      ),
    ));
  }

  Widget _buildPersistentHeader() => SliverPersistentHeader(
      pinned: true,
      delegate: _SliverDelegate(
        minHeight: 40.0,
        maxHeight: 40.0,
        child: Container(
          color: Color(0xffF3F2F5),
          child: Row(
            children: <Widget>[
              getRadiusContainer(Color(0xffF3F2F5), 0,
                  height: 44,
                  width: 80,
                  margin: EdgeInsets.only(left: 12),
                  child: getTextWidget(14, "默认", Color(0xff060918))),
              getRadiusContainer(Color(0xffF3F2F5), 0,
                  height: 44,
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      getTextWidget(14, "价格", Color(0xff060918)),
                      Container(
                        height: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: 4,
                                width: 4,
                                child: Icon(Icons.arrow_drop_up,
                                    color: Color(0xffF43333))),
                            Container(
                                margin: EdgeInsets.only(top: 2),
                                height: 4,
                                width: 4,
                                child: Icon(Icons.arrow_drop_down,
                                    color: Color(0xff333333)))
                          ],
                        ),
                      )
                    ],
                  )),
              getRadiusContainer(Color(0xffF3F2F5), 0,
                  height: 44,
                  width: 80,
                  child: getTextWidget(14, "销量", Color(0xff060918))),
              Spacer(),
              SizedBox(
                  height: 44,
                  child: IconButton(
                      padding: EdgeInsets.all(12),
                      icon: Image.asset("assets/images/icon_horizontal.png"),
                      onPressed: () {}))
            ],
          ),
        ),
      ));

  /// 商品列表
  Widget _buildSliverList() {
    EdgeInsets edgeInsets;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 12,
          childAspectRatio: 172 / 272),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        if (index % 2 == 0) {
          edgeInsets = EdgeInsets.only(left: 12);
        } else {
          edgeInsets = EdgeInsets.only(right: 12);
        }
        return getRadiusContainer(Colors.white, 3,
            child: _getItemImg(), margin: edgeInsets);
      }, childCount: 10),
    );
  }

  /// 商品列表 图片
  Widget _getItemImg() {
    double width = window.physicalSize.width / window.devicePixelRatio - 32;
    double imgWidth = width / 2;

    return Stack(children: <Widget>[
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(
            child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3), topRight: Radius.circular(3)),
          child: FadeInImage.assetNetwork(
              width: imgWidth,
              height: imgWidth,
              placeholder: "assets/images/icon_default.png",
              image:
                  "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg",
              fit: BoxFit.cover),
        )),
        Padding(
          child: getTextWidget(14,
              "ZARA新款 TRF 女装 迪士尼米奇与米妮老鼠©...", Color(0xff060918),
              maxLines: 2, overflow: TextOverflow.ellipsis),
          padding: EdgeInsets.only(top: 4, left: 6, right: 6),
        ),
        Spacer(),
        Row(children: <Widget>[
          //价格
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: getTextWidget(12,
                              "￥", Color(0xffFE4545),fontWeight: FontWeight.w500)),
                      getTextWidget(16, "119",
                          Color(0xffFE4545),fontWeight: FontWeight.w500),
                      Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: getTextWidget(12,
                              ".00", Color(0xffFE4545),fontWeight: FontWeight.w500))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 2, bottom: 8),
                  child: getTextWidget(12, "￥00.00",
                      Color(0xff999999),
                      decoration: TextDecoration.lineThrough))
            ],
          ),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(right: 8),
              child:Container(
            height: 26,
            width: 26,
            child: Image.asset(
              "assets/images/icon_share_big.png",
              fit: BoxFit.fill,
            ),
          )),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
                height: 26,
                width: 26,
                child: Image.asset("assets/images/icon_new_car.png",
                    fit: BoxFit.fill)),
          )
        ])
      ]),
      Positioned(
          left: 4,
          top: imgWidth - 14,
          height: 18,
          child: Container(
              width: 18,
              height: 18,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/icon_default.png",
                    image:
                        "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg",
                    fit: BoxFit.cover),
              ))),
      Positioned(
          left: 16,
          top: imgWidth - 10,
          height: 18,
          child: Container(
              width: 8,
              height: 8,
              child: Image.asset('assets/images/praise.png')))
    ]);
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 250,
      leading: _buildLeading(),
      title: Text('ZARA女装'),
      actions: _buildActions(),
      elevation: 0.2,
      pinned: true,
      backgroundColor: Color(0xffF3F2F5),
      flexibleSpace: FlexibleSpaceBar(
        //伸展处布局
        titlePadding: EdgeInsets.only(left: 55, bottom: 15), //标题边距
        collapseMode: CollapseMode.parallax, //视差效果
        background: _getHeader(),
      ),
    );
  }

  /// 顶部品牌说明
  Widget _getHeader() {
    return Stack(children: <Widget>[
      Container(
          height: 225,
          width: double.infinity,
          child:
              Image.asset("assets/images/login_banner.png", fit: BoxFit.cover)),
      Padding(
        padding: EdgeInsets.only(top: 104, left: 12, right: 12),
        child: Stack(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 12),
                child: getRadiusContainer(Colors.white, 5,
                    width: double.infinity,
                    height: 148,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 96, top: 12),
                          child: getTextWidget(18, "ZARA女装", Color(0xff060918)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 96, top: 8),
                          child:
                              getTextWidget(12, "在售商品25个", Color(0xff8D8D99)),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 12, top: 18, right: 12),
                          child: getTextWidget(
                              14, "ZARA深受全球时尚青年的喜爱，设计师品", Color(0xff5A5A66),
                              maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                        Spacer(),
                        Padding(
                            padding: EdgeInsets.only(bottom: 12, top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                getTextWidget(12, "更多品牌信息", Color(0xff8D8D99)),
                                Container(
                                    height: 12,
                                    width: 12,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 2),
                                    child: Image.asset(
                                        "assets/images/vip_arrow_down.png"))
                              ],
                            ))
                      ],
                    ))),
            Container(
                width: 72,
                height: 72,
                margin: EdgeInsets.only(left: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/icon_default.png",
                      image:
                          "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg",
                      fit: BoxFit.cover),
                )),
          ],
        ),
      )
    ]);
  }
  ///返回text 组件
  Widget getTextWidget(double textSize, String text, Color textColor,
      {FontWeight fontWeight,
        TextDecoration decoration,
        TextOverflow overflow,
        int maxLines}) {
    return Text(
      text,
      textAlign: TextAlign.left,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        decoration: decoration,
        color: textColor,
        fontSize: textSize,
        fontWeight: fontWeight,
      ),
    );
  }

  ///获取圆角容器Container
  Widget getRadiusContainer(Color color, double radius,
      {double width, double height, Widget child, EdgeInsets margin}) {
    return Container(
        height: height,
        width: width,
        child: child,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(radius))));
  }

  ///获取圆角容器 (有阴影/背景图片 )Container
  Widget getShadowRadiusContainer(Color color, double radius,
      {double width,
        double height,
        Widget child,
        EdgeInsets margin,
        AssetImage img}) {
    return Container(
        height: height,
        width: width,
        child: child,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: img != null ? null : color,
            image: DecorationImage(
              image: img,
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xffD8D8D8),
                spreadRadius: 5.0,
                offset: Offset(3.0, 3.0),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(radius))));
  }
  Widget _buildLeading() => IconButton(
        icon: Image.asset("assets/images/back_white.png"),
        padding: EdgeInsets.all(12),
        onPressed: () => Navigator.of(context).pop(),
      );

  List<Widget> _buildActions() => <Widget>[
        IconButton(
          icon: Image.asset("assets/images/share_white.png"),
          padding: EdgeInsets.all(10),
          onPressed: () {},
        )
      ];

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
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
