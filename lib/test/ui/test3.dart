import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class Test3App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new ShoppingListWidget(
      products: [
        new Product(name: "商品1-点我删除"),
        new Product(name: "商品2--点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
        new Product(name: "商品3-点我删除"),
      ],
    );
  }
}

/// 数据模型
class Product {
  const Product({this.name});

  final String name;
}

/// 回调接口   在 dart 里面 函数也是一个对象 。
/// 类似于下面的例子  typedef 只是标记这个是一个函数类型 并不会关注函数具体名称是什么 只会关注函数所传的参数和返回值 。
//typedef Predicate<E> = bool Function(E element);
typedef void CartChangedCallback(Product product, bool inCart);

/// 列表 item;
class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({
    Product product,
    this.inCart,
    this.onCartChanged,
  })  : product = product,
        super(key: new ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

class ShoppingListWidget extends StatefulWidget {
  ///如果没有key，当前构建中的第一个条目将始终与前一个构建中的第一个条目同步，即使在语义上，列表中的第一个条目如果滚动出屏幕，那么它将不会再在窗口中可见。
  ///通过给列表中的每个条目分配为“语义” key，无限列表可以更高效，
  /// 因为框架将同步条目与匹配的语义key并因此具有相似（或相同）的可视外观。
  /// 此外，语义上同步条目意味着在有状态子widget中，
  ///保留的状态将附加到相同的语义条目上，而不是附加到相同数字位置上的条目。
  ShoppingListWidget({Key key, this.products}) : super(key: key);
  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingListWidget> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  //异步
  Future<void> _handleRefresh() {
    Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {
      _refreshIndicatorKey.currentState.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("购物车"),
        ),
        body: Stack(
          //类似安卓得帧布局，可以重叠
          children: <Widget>[
            RefreshIndicator(
                child: new ListView(
                  padding: new EdgeInsets.symmetric(vertical: 8.0),
                  children: widget.products.map((Product product) {
                    return new ShoppingListItem(
                        product: product,
                        inCart: _shoppingCart.contains(product),
                        onCartChanged: _handleCartChanged);
                  }).toList(),
                ),
                onRefresh: _handleRefresh),
            FloatWidget()
          ],
        ));
  }
}

/// 悬浮弹窗
class FloatWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatState();
  }
}

class _FloatState extends State with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController controller;
  Animation<Offset> animation;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    //初始化
    //用来控制动画的开始与结束以及设置动画的监听
    //vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    //duration 动画的时长，这里设置的 seconds: 2 为2秒，当然也可以设置毫秒 milliseconds：2000.
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //AnimationStatus.completed 动画在结束时停止的状态
        controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        //AnimationStatus.dismissed 表示动画在开始时就停止的状态
//        controller.forward();
      }
    });
    //begin: Offset.zero, end: Offset(1, 0) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向不动，也就是水平向右平移
    //begin: Offset.zero, end: Offset(1, 1) 以左下角为参考点，相对于左下角坐标 x轴方向向右 平移执行动画的view 的1倍 宽度，y轴方向 向下 平衡执行动画view 的1倍的高度，也就是向右下角平移了
    animation =
        Tween(begin: Offset(0, 0), end: Offset(0, 0.3)).animate(controller);
    //开始执行动画
    controller.forward();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (controller != null) {
      controller.dispose();
    }
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
//            color: const Color(0xb3666666),
            color: Colors.green,

            ///0x 后面开始 两位FF表示透明度16进制，  渐变动画
            child: Row(children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                  //内边距
                  child: Image.asset("assets/image/gifindicator.gif")),
              Expanded(child: Text("")),
              Stack(
                children: <Widget>[
                  SlideTransition(
                      position: animation,
                      //将要执行动画的子view
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding:
                                  const EdgeInsets.only(right: 20.0, left: 6.0),
                              //内边距
                              child: new Text("￥100.00",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                          Container(
                              padding:
                                  const EdgeInsets.only(right: 20.0, left: 6.0),
                              //内边距
                              child: new Text("￥100.00",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)))
                        ],
                      )),
                  Positioned(
                      child:
                          Container(height: 30, color: Colors.green, width: 100),
                      top: 0,
                      right: 0),
                  Positioned(
                      child:
                          Container(height: 30, color: Colors.green, width: 100),
                      bottom: 0,
                      right: 0),
                ],
              )
            ])),
        left: 0,
        right: 0,
        bottom: 0,
        height: 80);
  }
}
